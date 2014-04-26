//
//  GAI+MonnyExtension.h
//  Monny
//
//  Created by Jason Chang on 4/8/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleAnalytics-iOS-SDK/GAI.h>
#import <GoogleAnalytics-iOS-SDK/GAIFields.h>
#import <GoogleAnalytics-iOS-SDK/GAITracker.h>
#import <GoogleAnalytics-iOS-SDK/GAIDictionaryBuilder.h>

extern NSString *const GACategoryQuest;
extern NSString *const GACategoryCategory;
extern NSString *const GACategoryPremiumReport;
extern NSString *const GACategoryDashboard;
extern NSString *const GACategoryReport;
extern NSString *const GACategorySetting;
extern NSString *const GACategoryIAP;
extern NSString *const GACategorySocial;

extern NSString *const GAActionAccept;
extern NSString *const GAActionComplete;
extern NSString *const GAActionConflict;
extern NSString *const GAActionRename;
extern NSString *const GAActionViewDetail;
extern NSString *const GAActionTap;
extern NSString *const GAActionSwipe;
extern NSString *const GAActionExport;
extern NSString *const GAActionImport;
extern NSString *const GAActionAddEntry;
extern NSString *const GAActionPurchase;
extern NSString *const GAActionTrial;
extern NSString *const GAActionRestore;
extern NSString *const GAActionShare;

extern NSString *const GALabelCategoryRank;
extern NSString *const GALabelAmountTypeToggleRegion;
extern NSString *const GALabelQuestViewRegion;
extern NSString *const GALabelPreviousMonth;
extern NSString *const GALabelNextMonth;

@interface GAI (MonnyExtension)

+ (void) sendOpenScreenWithName:(NSString *)screenName;
+ (void) sendEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value;

@end
