//
//  AddEventViewController+TableHandler.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "AddEventViewController+Data.h"
#import "AddEventTableItem.h"
#import "UITableViewCell+AddEvent.h"

NSString *const cat_AddEventAllDay = @"allday";
NSString *const cat_AddEventStartDate = @"startdate";
NSString *const cat_AddEventEndDate = @"enddate";
NSString *const cat_AddEventTitle = @"title";
NSString *const cat_AddEventSticker = @"sticker";
NSString *const cat_AddEventNote = @"note";

@implementation AddEventViewController (Data)

+ (NSArray *) addEventTableSectionData {
    static NSArray *_sharedAddEventTableSectionData = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedAddEventTableSectionData = @[
                                            [AddEventTableSectionItem sectionItemWithTitle: nil items:
                                             [AddEventTableItem itemWithKey:cat_AddEventAllDay identifier: CLOnOffTableViewCellIdentifier],
                                             [AddEventTableItem itemWithKey:cat_AddEventStartDate identifier: CLDateTimePickerTableViewCellIdentifier],
                                             [AddEventTableItem itemWithKey:cat_AddEventEndDate identifier: CLDateTimePickerTableViewCellIdentifier]
                                             ,nil],
                                            [AddEventTableSectionItem sectionItemWithTitle: nil items:
                                             [AddEventTableItem itemWithKey:cat_AddEventTitle identifier: CLTextInputTableViewCellIdentifier],[AddEventTableItem itemWithKey:cat_AddEventSticker identifier: CLTextInputTableViewCellIdentifier],
                                             nil],
                                            [AddEventTableSectionItem sectionItemWithTitle: nil items:
                                             [AddEventTableItem itemWithKey:cat_AddEventNote identifier: CLTextInputTableViewCellIdentifier],
                                             nil]
                                            ];
    });
    return _sharedAddEventTableSectionData;
}

@end
