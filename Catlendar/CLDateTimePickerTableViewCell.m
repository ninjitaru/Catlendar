//
//  CLDateTimePickerTableViewCell.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CLDateTimePickerTableViewCell.h"
#import "NSDate+MonnyExtension.h"

@interface CLDateTimePickerTableViewCell ()
@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UILabel *dateLabel;
@property (nonatomic,strong) IBOutlet UILabel *timeLabel;
@end

@implementation CLDateTimePickerTableViewCell

- (void) configWithTitle:(NSString *)title date:(NSDate *)date {
    self.titleLabel.text = title;
    if(!date) {
        self.dateLabel.hidden = YES;
        self.timeLabel.hidden = YES;
    } else {
        self.dateLabel.hidden = NO;
        self.timeLabel.hidden = NO;
        NSDateFormatter *formatter = [NSDate mn_formatterWithFormatString: @"yyyy/M/d"];
        NSDateFormatter *timeFormatter = [NSDate mn_formatterWithFormatString: @"h:mm a"];
        self.dateLabel.text = [formatter stringFromDate: date];
        self.timeLabel.text = [timeFormatter stringFromDate: date];
    }
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
