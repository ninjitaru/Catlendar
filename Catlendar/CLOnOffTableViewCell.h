//
//  CLOnOffTableViewCell.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLOnOffTableViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UISwitch *onOffSwitch;

@end
