//
//  NSDate+MonnyExtension.m
//  Monny
//
//  Created by Jason Chang on 3/10/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "NSDate+MonnyExtension.h"

static NSString *const MonnyDateFormatString = @"MMM d";
static NSString *const MonnyHeaderDateFormatString = @"MMM yyyy";
static NSString *const MonnyFullDateFormatString = @"MMM d yyyy EEE";
static NSString *const MonnymmddyyyyDateFormatString = @"MM/dd/yyyy";

@implementation NSDate (MonnyExtension)

+ (NSCache *) mn_formatterCache {
    static NSCache *_sharedCache = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedCache = [NSCache new];
    });
    return _sharedCache;
}

+ (void) mn_resetCache {
    [NSTimeZone resetSystemTimeZone];
    [NSDate mn_calendar].timeZone = [NSTimeZone systemTimeZone];
    [[NSDate mn_formatterCache] removeAllObjects];
}

+ (NSCalendar*) mn_calendar {
    static NSCalendar *_sharedCalendar = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedCalendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        _sharedCalendar.timeZone = [NSTimeZone systemTimeZone];
    });
    return _sharedCalendar;
}

+ (NSDateFormatter *) mn_formatterWithFormatString:(NSString *) formatString {
    NSCache *cache = [NSDate mn_formatterCache];
    NSDateFormatter *formatter = [cache objectForKey: formatString];
    if(!formatter) {
        formatString = [NSDateFormatter dateFormatFromTemplate:formatString options:0
                                                        locale:[NSLocale currentLocale]];
        formatter = [[NSDateFormatter alloc] init];
        formatter.calendar = [NSDate mn_calendar];
        formatter.timeZone = [NSDate mn_calendar].timeZone;
        
        [formatter setDateFormat: formatString];
        [cache setObject: formatter forKey: formatString];
    }
    return formatter;
}

+ (NSDate *) mn_dateFromYear: (NSInteger) year month: (NSInteger) month day:(NSInteger)day {
    NSCalendar* calendar = [NSDate mn_calendar];
    NSDateComponents* component = [[NSDateComponents alloc] init];
    component.month = month;
    component.year = year;
    component.day = day;
    NSDate *date = [calendar dateFromComponents: component];
    return [date mn_normalize];
}

+ (NSArray*) mn_monthStrings {
    NSCalendar* calendar = [NSDate mn_calendar];
    NSDateComponents* component = [[NSDateComponents alloc] init];
    NSDateFormatter* formatter = [NSDate mn_formatterWithFormatString: @"MMM"];
    NSMutableArray* array = [NSMutableArray array];
    for(NSInteger i = 1; i < 13; i++)
    {
        component.month = i;
        [array addObject: [formatter stringFromDate: [calendar dateFromComponents: component]]];
    }
    return array;
}

+ (NSDate*) mn_normalizedToday {
    return [[NSDate date] mn_normalize];
}

- (NSDateComponents *) mn_dateComponent {
    return [[NSDate mn_calendar] components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit )  fromDate: self];
}

- (NSDate *) mn_lastDayDate {
    NSDateComponents *component = [self mn_dateComponent];
    NSRange daysRange =
    [[NSDate mn_calendar]
     rangeOfUnit:NSDayCalendarUnit
     inUnit:NSMonthCalendarUnit
     forDate: self];
    return [NSDate mn_dateFromYear:component.year month:component.month day:daysRange.length];
}

- (BOOL) mn_isTodayIgnoreHour {
    NSDate* today = [NSDate date];
    NSCalendar *calendar = [NSDate mn_calendar];
    NSDateComponents* todayComponent = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit )  fromDate: today];
    NSDateComponents* component = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate: self];
    
    if(todayComponent.year == component.year &&
       todayComponent.month == component.month &&
       todayComponent.day == component.day)
    {
        return YES;
    }
    return NO;
}

- (BOOL) mn_isYesterdayIgnoreHour {
    NSCalendar *calendar = [NSDate mn_calendar];
    NSDateComponents *yesterdayComponent = [[NSDateComponents alloc] init];
    [yesterdayComponent setDay:-1];
    NSDate* yesterday = [calendar dateByAddingComponents:yesterdayComponent toDate: [NSDate date] options:0];
    yesterdayComponent = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit )  fromDate: yesterday];
    NSDateComponents* component = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate: self];
    
    if(yesterdayComponent.year == component.year &&
       yesterdayComponent.month == component.month &&
       yesterdayComponent.day == component.day)
    {
        return YES;
    }
    return NO;
}

- (BOOL) mn_isEqualToDateIgnoreTime:(NSDate *)otherDate {
    NSCalendar *calendar = [NSDate mn_calendar];
    NSDateComponents* otherComponent = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit )  fromDate: otherDate];
    NSDateComponents* component = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate: self];
    
    if(otherComponent.year == component.year &&
       otherComponent.month == component.month &&
       otherComponent.day == component.day)
    {
        return YES;
    }
    return NO;
}

- (NSString*) mn_dateString {
    if([self mn_isTodayIgnoreHour])
        return NSLocalizedString(@"today", nil);
//    else if([self isYesterdayIgnoreHour])
//        return NSLocalizedString(@"yesterday", nil);
    return [[NSDate mn_formatterWithFormatString: MonnyDateFormatString] stringFromDate: self];
}

- (NSString*) mn_headerDateString {
    return [[NSDate mn_formatterWithFormatString: MonnyHeaderDateFormatString] stringFromDate: self];
}

- (NSString*) mn_mmddyyyyDateString {
    return [[NSDate mn_formatterWithFormatString: MonnymmddyyyyDateFormatString] stringFromDate: self];
}

- (NSString*) mn_fullDateString {
    return [[NSDate mn_formatterWithFormatString: MonnyFullDateFormatString] stringFromDate: self];
}

- (NSDate*) mn_normalize {
    NSDateComponents* component = [[NSDate mn_calendar] components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate: self];
    component.hour = 8;
    component.second = 0;
    component.minute = 0;
    return [[NSDate mn_calendar] dateFromComponents: component];
}

- (NSInteger) mn_numberOfDaysToDate:(NSDate*)toDateTime {
    NSCalendar *calendar = [NSDate mn_calendar];
    NSDate *fromDate;
    NSDate *toDate;
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:self];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    return [difference day];
}

@end
