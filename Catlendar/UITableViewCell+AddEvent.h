//
//  UITableViewCell+AddEvent.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <UIKit/UITableViewCell.h>

extern NSString *const CLDateTimePickerTableViewCellIdentifier;
extern NSString *const CLTextInputTableViewCellIdentifier;
extern NSString *const CLOnOffTableViewCellIdentifier;

@class AddEventTableItem;
@interface UITableViewCell (AddEvent)

- (void) configWithItem:(AddEventTableItem *)item;


@end
