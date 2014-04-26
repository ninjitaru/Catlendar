//
//  SLComposeViewController+MonnyExtension.h
//  Monny
//
//  Created by Jason Chang on 4/10/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>

@interface SLComposeViewController (MonnyExtension)

+ (NSString *) mn_slServiceNameFromServiceString:(NSString *)serviceString;
+ (NSArray *) mn_avaliableServiceStrings;
+ (UIActionSheet *) mn_socialActionSheet;
+ (SLComposeViewController *) mn_SLViewController:(NSString *)serviceType onShareCompleted:(void(^)())completedBlock failed:(void(^)())failureBlock;

@end
