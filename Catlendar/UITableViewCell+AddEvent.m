//
//  UITableViewCell+AddEvent.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "UITableViewCell+AddEvent.h"
#import "AddEventTableItem.h"
#import "AddEventViewController+Data.h"
#import "CLDateTimePickerTableViewCell.h"
#import "CLOnOffTableViewCell.h"
#import "CLTextInputTableViewCell.h"
#import "CLUIDatePickerTableViewCell.h"
#import "NSDate+MonnyExtension.h"
#import "CatlendarEvent.h"

NSString *const CLDateTimePickerTableViewCellIdentifier = @"datetimepickercell";
NSString *const CLTextInputTableViewCellIdentifier = @"textinputcell";
NSString *const CLOnOffTableViewCellIdentifier = @"onoffcell";
NSString *const CLUIDatePickerTableViewCellIdentifier = @"uidatepickercell";

@implementation UITableViewCell (AddEvent)

- (void) configWithItem:(AddEventTableItem *)item event:(CatlendarEvent *)event delegate:(id)delegate {
    NSDictionary *handlersByKey = @{
                                    cat_AddEventDatePicker:[^(CLUIDatePickerTableViewCell *cell, AddEventTableItem *item,CatlendarEvent *event) {
                                        if([delegate conformsToProtocol:@protocol(CLUIDatePickerTableViewCellDelegate)]) {
                                            cell.delegate = delegate;
                                        }
                                        if([item.parentKey isEqualToString: cat_AddEventStartDate]) {
                                            [cell configWithDate: event.startDate itemKey: item.parentKey];
                                        } else {
                                            [cell configWithDate: event.endDate itemKey: item.parentKey];
                                        }
                                    } copy],
                                    cat_AddEventAllDay:[^(CLOnOffTableViewCell *cell,AddEventTableItem *item,CatlendarEvent *event) {
                                        if([delegate conformsToProtocol:@protocol(CLOnOffTableViewCellDelegate)]) {
                                            cell.delegate = delegate;
                                        }
                                        cell.titleLabel.text = NSLocalizedString(item.key, nil);
                                        cell.onOffSwitch.on = event.isAllDay;
                                    } copy],
                                    cat_AddEventStartDate:[^(CLDateTimePickerTableViewCell *cell,AddEventTableItem *item,CatlendarEvent *event) {
                                        [cell configWithTitle: NSLocalizedString(item.key, nil) date: event.startDate];
                                    } copy],
                                    cat_AddEventEndDate:[^(CLDateTimePickerTableViewCell *cell,AddEventTableItem *item,CatlendarEvent *event) {
                                        [cell configWithTitle: NSLocalizedString(item.key, nil) date: event.endDate];
                                    } copy],
                                    cat_AddEventTitle:[^(CLTextInputTableViewCell *cell, AddEventTableItem *item,CatlendarEvent *event) {
                                        if([delegate conformsToProtocol:@protocol(CLTextInputTableViewCellDelegate)]) {
                                            cell.delegate = delegate;
                                        }
                                        [cell configWithText: event.title placeholder:NSLocalizedString(item.key, nil) itemKey: item.key asTextView:NO];
                                    } copy],
                                    cat_AddEventSticker:[^(CLTextInputTableViewCell *cell, AddEventTableItem *item,CatlendarEvent *event) {
                                        [cell configWithText: nil placeholder:NSLocalizedString(item.key, nil)  itemKey: item.key asTextView:NO];
                                    } copy],
                                    cat_AddEventNote:[^(CLTextInputTableViewCell *cell, AddEventTableItem *item,CatlendarEvent *event) {
                                        if([delegate conformsToProtocol:@protocol(CLTextInputTableViewCellDelegate)]) {
                                            cell.delegate = delegate;
                                        }
                                        [cell configWithText: event.note placeholder:NSLocalizedString(item.key, nil)  itemKey: item.key asTextView:YES];
                                    } copy],
                              };
    void(^handler)(UITableViewCell * cell,AddEventTableItem *item,CatlendarEvent *event) = handlersByKey[item.key];
    if(handler) {
        handler(self,item,event);
    }
}

+ (void) handleCellSelectedWithTableView:(UITableView *)tableView selectRowAtIndexPath:(NSIndexPath *)indexPath event:(CatlendarEvent *) event {
    AddEventTableSectionItem *section = (AddEventTableSectionItem *)[AddEventViewController addEventTableSectionData][indexPath.section];
    AddEventTableItem *item = ((AddEventTableSectionItem *)[AddEventViewController addEventTableSectionData][indexPath.section]).items[indexPath.row];
    NSDictionary *handlersByKey = @{
                                    cat_AddEventStartDate:[^(UITableView *tableView,NSIndexPath *indexPath,AddEventTableItem *item,CatlendarEvent *event) {
                                        
                                        [UITableViewCell toggleUIDatePickerCellWithTableView:tableView selectedRowAtIndexPath: indexPath section: section item: item event: event];
                                    } copy],
                                    cat_AddEventEndDate:[^(UITableView *tableView,NSIndexPath *indexPath,AddEventTableItem *item,CatlendarEvent *event) {
                                        [UITableViewCell toggleUIDatePickerCellWithTableView:tableView selectedRowAtIndexPath: indexPath section: section item: item event: event];
                                    } copy],
                                    cat_AddEventSticker:[^(UITableView *tableView,NSIndexPath *indexPath,AddEventTableItem *item,CatlendarEvent *event) {
                                    } copy],
                                    };
    void(^handler)(UITableView *,NSIndexPath *,AddEventTableItem *,CatlendarEvent *) = handlersByKey[item.key];
    if(handler) {
        handler(tableView,indexPath,item,event);
    }
}

+ (void) toggleUIDatePickerCellWithTableView:(UITableView *)tableView selectedRowAtIndexPath:(NSIndexPath *)indexPath section:(AddEventTableSectionItem *) section item:(AddEventTableItem *)item event:(CatlendarEvent *)event {
    
    BOOL addDatePickerRow = YES;
    if(section.items.count >= indexPath.row+2) {
        AddEventTableItem *nextItem = section.items[indexPath.row+1];
        if([nextItem.parentKey isEqualToString: item.key]) {
            addDatePickerRow = NO;
        }
    }
    
    if(addDatePickerRow) {
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow: indexPath.row+1 inSection:indexPath.section];
        AddEventTableItem *newItem = [AddEventTableItem itemWithKey: cat_AddEventDatePicker identifier:CLUIDatePickerTableViewCellIdentifier];
        newItem.parentKey = item.key;
        [section.items insertObject: newItem atIndex: newIndexPath.row];
        [tableView beginUpdates];
        [tableView insertRowsAtIndexPaths: @[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
    } else {
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow: indexPath.row+1 inSection:indexPath.section];
        [section.items removeObjectAtIndex: newIndexPath.row];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths: @[newIndexPath] withRowAnimation:UITableViewRowAnimationTop];
        [tableView endUpdates];
    }
}

@end
