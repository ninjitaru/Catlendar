//
//  SLComposeViewController+MonnyExtension.m
//  Monny
//
//  Created by Jason Chang on 4/10/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "SLComposeViewController+MonnyExtension.h"

// Return nil when __INDEX__ is beyond the bounds of the array
#define NSArrayObjectMaybeNil(__ARRAY__, __INDEX__) ((__INDEX__ >= [__ARRAY__ count]) ? nil : [__ARRAY__ objectAtIndex:__INDEX__])

// Manually expand an array into an argument list
#define NSArrayToVariableArgumentsList(__ARRAYNAME__)\
NSArrayObjectMaybeNil(__ARRAYNAME__, 0),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 1),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 2),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 3),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 4),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 5),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 6),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 7),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 8),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 9),\
nil

@implementation SLComposeViewController (MonnyExtension)

+ (NSString *) mn_slServiceNameFromServiceString:(NSString *)serviceString {
    if(!serviceString) // guard against nil service string
        return nil;
    if([serviceString isEqualToString: @"Facebook"])
        return SLServiceTypeFacebook;
    if([serviceString isEqualToString: @"Twitter"])
        return SLServiceTypeTwitter;
    if([serviceString isEqualToString: @"SinaWeibo"])
        return SLServiceTypeSinaWeibo;
    if(MN_ISIOS7 && [serviceString isEqualToString: @"TencentWeibo"])
        return SLServiceTypeTencentWeibo;
    return nil;
}

+ (NSArray *) mn_avaliableServiceStrings {
    NSMutableArray *services = [NSMutableArray new];
    // due to ios 6,7 behave differently
    // in ios 6 avaliable will return yes even if user has not login
    // in ios 7 avaliable will return no if user has not login
    if(MN_ISIOS7 || [SLComposeViewController isAvailableForServiceType: SLServiceTypeFacebook]) {
        [services addObject: @"Facebook"];
    }
    if(MN_ISIOS7 || [SLComposeViewController isAvailableForServiceType: SLServiceTypeTwitter]) {
        [services addObject: @"Twitter"];
    }
    if(MN_ISIOS7 || [SLComposeViewController isAvailableForServiceType: SLServiceTypeSinaWeibo]) {
        [services addObject: @"SinaWeibo"];
    }
    if(MN_ISIOS7) {
        [services addObject: @"TencentWeibo"];
    }
    return services;
}

+ (UIActionSheet *) mn_socialActionSheet {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle: nil delegate: nil cancelButtonTitle: NSLocalizedString(@"Cancel", nil) destructiveButtonTitle: nil otherButtonTitles: NSArrayToVariableArgumentsList([self mn_avaliableServiceStrings])];
    return sheet;
}

+ (SLComposeViewController *) mn_SLViewController:(NSString *)serviceType onShareCompleted:(void(^)())completedBlock failed:(void(^)())failureBlock {
    // guard against nil service type
    if(serviceType && (MN_ISIOS7 || [SLComposeViewController isAvailableForServiceType: serviceType])) {
        SLComposeViewController *slViewController = [SLComposeViewController composeViewControllerForServiceType: serviceType];
        if(completedBlock || failureBlock) {
            slViewController.completionHandler = ^(SLComposeViewControllerResult result) {
                switch(result) {
                    case SLComposeViewControllerResultDone:
                    {
                        if(completedBlock) {
                            completedBlock();
                        }
                        break;
                    }
                    case SLComposeViewControllerResultCancelled:
                    {
                        if(failureBlock) {
                            failureBlock();
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            };
        }
//        NSString *text = ([serviceType isEqualToString: SLServiceTypeTwitter]?NSLocalizedString(tKeyNametwittermsg, nil):NSLocalizedString(tKeyNamefacebookmsg, nil));
//        [slViewController setInitialText: text];
//        if([serviceType isEqualToString: SLServiceTypeFacebook]) {
//            [slViewController addURL: [NSURL URLWithString: @"https://itunes.apple.com/us/app/monny/id590327036?ls=1&mt=8"]];
//        } else if(MN_ISIOS7 && ([serviceType isEqualToString: SLServiceTypeSinaWeibo] || [serviceType isEqualToString: SLServiceTypeTencentWeibo])) {
//            [slViewController addURL: [NSURL URLWithString: @"https://itunes.apple.com/cn/app/monny/id590327036?ls=1&mt=8"]];
//        }
//        [slViewController addImage: [UIImage imageNamed: @"monnyshare.png"]];
        return slViewController;
    }
    return nil;    
}

@end
