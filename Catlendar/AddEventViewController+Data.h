//
//  AddEventViewController+TableHandler.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "AddEventViewController.h"

extern NSString *const cat_AddEventAllDay;
extern NSString *const cat_AddEventStartDate;
extern NSString *const cat_AddEventEndDate;
extern NSString *const cat_AddEventTitle;
extern NSString *const cat_AddEventSticker;
extern NSString *const cat_AddEventNote;
extern NSString *const cat_AddEventDatePicker;

@interface AddEventViewController (Data)

+ (NSArray *) addEventTableSectionData;

@end
