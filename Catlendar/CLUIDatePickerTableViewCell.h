//
//  CLUIDatePickerTableViewCell.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLUIDatePickerTableViewCell;
@protocol CLUIDatePickerTableViewCellDelegate <NSObject>

- (void) datePickerCell:(CLUIDatePickerTableViewCell *)cell datePickerValueChanged:(UIDatePicker *)datePicker;

@end

@interface CLUIDatePickerTableViewCell : UITableViewCell

@property (nonatomic,weak) id<CLUIDatePickerTableViewCellDelegate> delegate;
- (void) configWithDate:(NSDate *)date;

@end
