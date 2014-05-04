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
extern NSString *const CLUIDatePickerTableViewCellIdentifier;

@class AddEventTableItem,CatlendarEvent;
@interface UITableViewCell (AddEvent)

- (void) configWithItem:(AddEventTableItem *)item event:(CatlendarEvent *)event;
+ (void) handleCellSelectedWithTableView:(UITableView *)tableView selectRowAtIndexPath:(NSIndexPath *)indexPath event:(CatlendarEvent *) event;

@end
