//
//  CLTextInputTableViewCell.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLTextInputTableViewCell;
@protocol CLTextInputTableViewCellDelegate <NSObject>

- (void) textInputCell:(CLTextInputTableViewCell *)cell withItemKey:(NSString *)key textValueChanged:(NSString *)text;

@end

@interface CLTextInputTableViewCell : UITableViewCell
@property (nonatomic,weak) id<CLTextInputTableViewCellDelegate> delegate;
- (void) configWithText:(NSString *)text placeholder:(NSString *)placeholder itemKey:(NSString *)itemKey asTextView:(BOOL)useTextView;

@end
