//
//  CatlendarEvent.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CatlendarEvent.h"
#import "NSDate+MonnyExtension.h"

@implementation CatlendarEvent

@dynamic title;
@dynamic startDate;
@dynamic endDate;
@dynamic note;
@dynamic isAllDay;

- (void)awakeFromInsert {
    if(!self.startDate) {
        NSCalendar *calendar = [NSDate mn_calendar];
        NSDateComponents *component = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute) fromDate: [NSDate date]];
        component.minute = 0;
        self.startDate = [calendar dateFromComponents: component];
        component.hour += 1;
        self.endDate = [calendar dateFromComponents: component];
    }
}

@end
