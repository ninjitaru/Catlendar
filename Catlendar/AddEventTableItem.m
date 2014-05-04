//
//  AddEventTableItem.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "AddEventTableItem.h"

@implementation AddEventTableItem

+(instancetype) itemWithKey:(NSString *)key identifier:(NSString *)identifier {
    AddEventTableItem *item = [AddEventTableItem new];
    item.key = key;
    item.cellIdentifier = identifier;
    return item;
}

@end

@implementation AddEventTableSectionItem

+ (instancetype) sectionItemWithTitle:(NSString *)title items:(AddEventTableItem *)item, ... {
    AddEventTableSectionItem *sectionItem = [AddEventTableSectionItem new];
    sectionItem.title = title;
    va_list args;
    NSMutableArray *array = [NSMutableArray array];
    va_start(args, item);
    for (AddEventTableItem *arg = item; arg != nil; arg = va_arg(args, AddEventTableItem*)) {
        [array addObject: arg];
    }
    va_end(args);
    sectionItem.items = [NSArray arrayWithArray: array];
    return sectionItem;
}

@end