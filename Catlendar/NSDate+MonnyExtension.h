//
//  NSDate+MonnyExtension.h
//  Monny
//
//  Created by Jason Chang on 3/10/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MonnyExtension)

+ (void) mn_resetCache;
+ (NSCalendar*) mn_calendar;
+ (NSDateFormatter *) mn_formatterWithFormatString:(NSString *) formatString;
+ (NSDate *) mn_dateFromYear: (NSInteger) year month: (NSInteger) month day:(NSInteger)day;
+ (NSArray*) mn_monthStrings;
+ (NSDate*) mn_normalizedToday;

- (NSDateComponents *) mn_dateComponent;
- (NSDate *) mn_lastDayDate;
- (BOOL) mn_isTodayIgnoreHour;
- (BOOL) mn_isYesterdayIgnoreHour;
- (NSString*) mn_dateString;
- (NSString*) mn_headerDateString;
- (NSString*) mn_mmddyyyyDateString;
- (NSString*) mn_fullDateString;
- (NSDate*) mn_normalize;
- (NSInteger) mn_numberOfDaysToDate:(NSDate*)toDateTime;
- (BOOL) mn_isEqualToDateIgnoreTime:(NSDate *)otherDate;

@end
