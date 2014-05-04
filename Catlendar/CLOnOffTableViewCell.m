//
//  CLOnOffTableViewCell.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CLOnOffTableViewCell.h"

@interface CLOnOffTableViewCell ()
@end

@implementation CLOnOffTableViewCell

- (void)awakeFromNib
{
    [self.onOffSwitch addTarget: self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) valueChanged:(UISwitch *)onOffSwitch {
    if([self.delegate respondsToSelector: @selector(onOffCell:onOffValueChanged:)]) {
        [self.delegate onOffCell: self onOffValueChanged: onOffSwitch];
    }
}

@end
