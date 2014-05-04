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
@property (nonatomic,strong) NSString *parentKey;
+(instancetype) itemWithKey:(NSString *)key identifier:(NSString *)identifier;
@end

@interface AddEventTableSectionItem : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSMutableArray *items;
+(instancetype) sectionItemWithTitle:(NSString *)title items:(AddEventTableItem *)item, ...;
@end

