//
//  UIImage+MonnyImage.h
//  Monny
//
//  Created by Jason Chang on 3/11/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (MonnyImage)

+ (UIImage*) mn_whiteRoundBackgroundTopImage;
+ (UIImage*) mn_whiteRoundBackgroundBottomImage;
+ (UIImage*) mn_whiteRoundBackgroundImage;
+ (UIImage*) mn_redRoundBackgroundImage;
+ (UIImage*) mn_greenRoundBackgroundImage;
+ (UIImage*) mn_blueRoundBackgroundImage;
+ (UIImage*) mn_whiteBackgroundMidImage;
+ (UIImage*) mn_grayRoundBackgroundImage;

+ (UIImage*) mn_resizeableRedBarImage;
+ (UIImage*) mn_resizeableBlueBarImage;

+ (UIImage*) mn_questPlaceHolderImage;
+ (UIImage*) mn_questPlaceHolderSmallImage;
+ (UIImage*) mn_percentagePlaceHolderImage;
+ (UIImage*) mn_percentagePlaceHolderSmallImage;

+ (UIImage*) mn_arrowImage;

+ (UIImage*) mn_accountBookCoverPlaceholderImage;
+ (NSString*) mn_accountBookCoverPlaceholderImageName;



@end
