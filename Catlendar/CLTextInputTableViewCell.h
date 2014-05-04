//
//  CLTextInputTableViewCell.h
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLTextInputTableViewCell : UITableViewCell

- (void) configWithText:(NSString *)text placeholder:(NSString *)placeholder asTextView:(BOOL)useTextView;

@end
