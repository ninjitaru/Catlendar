//
//  GAI+MonnyExtension.m
//  Monny
//
//  Created by Jason Chang on 4/8/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "GAI+MonnyExtension.h"

NSString *const GACategoryQuest = @"Quest";
NSString *const GACategoryCategory = @"Category";
NSString *const GACategoryPremiumReport = @"PremiumReport";
NSString *const GACategoryDashboard = @"Dashboard";
NSString *const GACategoryReport = @"Report";
NSString *const GACategorySetting = @"Setting";
NSString *const GACategoryIAP = @"IAP";
NSString *const GACategorySocial = @"Social";

NSString *const GAActionAccept = @"Accept";
NSString *const GAActionComplete = @"Complete";
NSString *const GAActionConflict = @"Conflict";
NSString *const GAActionRename = @"Rename";
NSString *const GAActionViewDetail = @"ViewDetail";
NSString *const GAActionTap = @"Tap";
NSString *const GAActionSwipe = @"Swipe";
NSString *const GAActionExport = @"Export";
NSString *const GAActionImport = @"Import";
NSString *const GAActionAddEntry = @"AddEntry";
NSString *const GAActionPurchase = @"Purchase";
NSString *const GAActionTrial = @"Trial";
NSString *const GAActionRestore = @"Restore";
NSString *const GAActionShare = @"Share";

NSString *const GALabelCategoryRank = @"CategoryRank";
NSString *const GALabelAmountTypeToggleRegion = @"AmountTypeToggleRegion";
NSString *const GALabelQuestViewRegion = @"QuestViewRegion";
NSString *const GALabelPreviousMonth = @"PreviousMonth";
NSString *const GALabelNextMonth = @"NextMonth";

@implementation GAI (MonnyExtension)

+ (void) sendOpenScreenWithName:(NSString *)screenName {
    [[GAI sharedInstance].defaultTracker send:[[[GAIDictionaryBuilder createAppView]
                                                set:screenName forKey:kGAIScreenName] build]];
}

+ (void) sendEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value {
    if(!category || !action) {
        return;
    }
    [[GAI sharedInstance].defaultTracker send:
     [
      [GAIDictionaryBuilder createEventWithCategory: category
                                             action: action
                                              label: label
                                              value: value]
      build]];
}
@end
