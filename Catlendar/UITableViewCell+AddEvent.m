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
#import "NSDate+MonnyExtension.h"

NSString *const CLDateTimePickerTableViewCellIdentifier = @"datetimepickercell";
NSString *const CLTextInputTableViewCellIdentifier = @"textinputcell";
NSString *const CLOnOffTableViewCellIdentifier = @"onoffcell";

@implementation UITableViewCell (AddEvent)

- (void) configWithItem:(AddEventTableItem *)item {
    NSDictionary *handlersByKey = @{
                                    cat_AddEventAllDay:[^(CLOnOffTableViewCell *cell,AddEventTableItem *item) {
                                        cell.titleLabel.text = NSLocalizedString(item.key, nil);
                                        cell.onOffSwitch.on = item.on;
                                    } copy],
                                    cat_AddEventStartDate:[^(CLDateTimePickerTableViewCell *cell,AddEventTableItem *item) {
                                        if(!item.date) {
                                            NSCalendar *calendar = [NSDate mn_calendar];
                                            NSDateComponents *component = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute) fromDate: [NSDate date]];
                                            if(component.minute > 0) {
                                                component.hour += 1;
                                                component.minute = 0;
                                            }
                                            item.date = [calendar dateFromComponents: component];
                                        }
                                        [cell configWithTitle: NSLocalizedString(item.key, nil) date: item.date];
                                    } copy],
                                    cat_AddEventEndDate:[^(CLDateTimePickerTableViewCell *cell,AddEventTableItem *item) {
                                        [cell configWithTitle: NSLocalizedString(item.key, nil) date: item.date];
                                    } copy],
                                    cat_AddEventTitle:[^(CLTextInputTableViewCell *cell, AddEventTableItem *item) {
                                        [cell configWithText: item.text placeholder:NSLocalizedString(item.key, nil) asTextView:NO];
                                    } copy],
                                    cat_AddEventSticker:[^(CLTextInputTableViewCell *cell, AddEventTableItem *item) {
                                        [cell configWithText: item.text placeholder:NSLocalizedString(item.key, nil) asTextView:NO];
                                    } copy],
                                    cat_AddEventNote:[^(CLTextInputTableViewCell *cell, AddEventTableItem *item) {
                                        [cell configWithText: item.text placeholder:NSLocalizedString(item.key, nil) asTextView:YES];
                                    } copy],
                              };
    void(^handler)(UITableViewCell * cell,AddEventTableItem *item) = handlersByKey[item.key];
    handler(self,item);
}

@end
