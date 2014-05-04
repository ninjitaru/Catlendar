//
//  CLOnOffTableViewCell.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLOnOffTableViewCell;
@protocol CLOnOffTableViewCellDelegate <NSObject>

- (void) onOffCell:(CLOnOffTableViewCell *)cell onOffValueChanged:(UISwitch *) onOffSwitch;

@end

@interface CLOnOffTableViewCell : UITableViewCell

@property (nonatomic,weak) id<CLOnOffTableViewCellDelegate> delegate;
@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UISwitch *onOffSwitch;

@end
