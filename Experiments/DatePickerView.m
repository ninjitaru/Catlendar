//
//  DatePickerView.m
//  Monny
//
//  Created by Jason Chang on 2/27/13.
//  Copyright (c) 2013 Greamer. All rights reserved.
//

#import "DatePickerView.h"
#import "MonnyFlipInputButton.h"

@implementation DatePickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _datePicker = [[UIDatePicker alloc] initWithFrame: CGRectMake(0,50,320,216+50)];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleBlackTranslucent;
        numberToolbar.items = [NSArray arrayWithObjects:
                               [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(test)],
                               [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                               [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(test)],
                               nil];
        [numberToolbar sizeToFit];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.maximumDate = [NSDate date];
        _datePicker.calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        [self addSubview: numberToolbar];
        [self addSubview: _datePicker];
    }
    return self;
}

- (void) setValue:(id)value
{
    if([value isKindOfClass: [NSDate class]])
    {
        [self setDate: value];
    }
}

- (void) reset
{
    [self setToday];
}

- (void) setDate: (NSDate*) date
{
    [_datePicker setDate: date];
    MonnyFlipInputButton* btn = (MonnyFlipInputButton*)self.delegate;
    [btn test: [self determineDisplay] object: [_datePicker date]];
}

- (void) setToday
{
    _datePicker.maximumDate = [NSDate date];
    [_datePicker setDate: _datePicker.maximumDate];
    MonnyFlipInputButton* btn = (MonnyFlipInputButton*)self.delegate;
    [btn test: @"TODAY" object: [_datePicker date]];
}

- (void) test
{
    NSString* text = [self determineDisplay];
    
    MonnyFlipInputButton* btn = (MonnyFlipInputButton*)self.delegate;
    [btn test: text object: [_datePicker date]];
    [btn flip];
}

- (NSString*) determineDisplay
{
    NSCalendar* calendar = [_datePicker calendar];
    NSDate* today = [NSDate date];
    NSDate* pickerDate = [_datePicker date];
    NSDate* yesterday;
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:-1];
    yesterday = [calendar dateByAddingComponents:components toDate: today options:0];
    
    NSDateComponents* todayComponent = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit )  fromDate: today];
    NSDateComponents* yesterdayComponent = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit )  fromDate: yesterday];
    NSDateComponents* pickerComponent = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate: pickerDate];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle: NSDateFormatterShortStyle];
    [formatter setDateFormat: @"MMM d"];
    NSString* text = [formatter stringFromDate: pickerDate];
    
    if(todayComponent.year == pickerComponent.year &&
       todayComponent.month == pickerComponent.month &&
       todayComponent.day == pickerComponent.day)
    {
        text = @"TODAY";
    }
    else if(yesterdayComponent.year == pickerComponent.year &&
            yesterdayComponent.month == pickerComponent.month &&
            yesterdayComponent.day == pickerComponent.day)
    {
        text = @"YESTERDAY";
    }
    return text;
}

@end
