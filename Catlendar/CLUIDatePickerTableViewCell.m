//
//  CLUIDatePickerTableViewCell.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CLUIDatePickerTableViewCell.h"
#import "CatlendarEvent.h"

@interface CLUIDatePickerTableViewCell ()
@property (nonatomic,strong) IBOutlet UIDatePicker *datePicker;
@property (nonatomic,strong) NSString *itemKey;
@end

@implementation CLUIDatePickerTableViewCell

- (void) configWithDate:(NSDate *)date itemKey:(NSString *)key {
    self.itemKey = key;
    [self.datePicker setDate: date animated: YES];
}

- (void)awakeFromNib
{
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.datePicker.minuteInterval = 5;
    [self.datePicker addTarget: self action:@selector(dateValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) dateValueChanged:(UIDatePicker *)datePicker {
    if([self.delegate respondsToSelector:@selector(datePickerCell:withItemKey:datePickerValueChanged:)]){
        [self.delegate datePickerCell: self withItemKey: self.itemKey datePickerValueChanged:datePicker];
    }
}

@end
