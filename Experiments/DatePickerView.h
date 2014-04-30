//
//  DatePickerView.h
//  Monny
//
//  Created by Jason Chang on 2/27/13.
//  Copyright (c) 2013 Greamer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewDelegate.h"

@interface DatePickerView : UIView <PickerViewDelegate>
{
    UIDatePicker* _datePicker;
}

@property (assign) id delegate;

- (void) setDate: (NSDate*) date;
- (void) setToday;
- (void) setValue:(id)value;
- (void) reset;

@end
