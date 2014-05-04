//
//  CatlendarEvent.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CatlendarEvent : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSNumber * isAllDay;

@end
