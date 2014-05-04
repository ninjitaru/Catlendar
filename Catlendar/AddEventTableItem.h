//
//  AddEventTableItem.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddEventTableItem : NSObject
@property (nonatomic,strong) NSString *key;
@property (nonatomic,strong) NSString *cellIdentifier;
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,assign) BOOL on;
+(instancetype) itemWithKey:(NSString *)key identifier:(NSString *)identifier;
@end

@interface AddEventTableSectionItem : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSArray *items;
+(instancetype) sectionItemWithTitle:(NSString *)title items:(AddEventTableItem *)item, ...;
@end

