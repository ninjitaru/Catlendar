//
//  UIImage+MonnyImage.m
//  Monny
//
//  Created by Jason Chang on 3/11/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "UIImage+MonnyImage.h"

@implementation UIImage (MonnyImage)

+ (UIImage*) mn_whiteRoundBackgroundImage
{
    return [[UIImage imageNamed:@"bg_white.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(12, 10, 12, 10)];
}

+ (UIImage*) mn_whiteRoundBackgroundTopImage
{
    return [[UIImage imageNamed:@"bg_white_top.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(12, 10, 1, 10)];
}

+ (UIImage*) mn_whiteRoundBackgroundBottomImage
{
    return [[UIImage imageNamed:@"bg_white_bottom.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(1, 10, 12, 10)];
}

+ (UIImage*) mn_redRoundBackgroundImage
{
    return [[UIImage imageNamed:@"bg_red.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(12, 10, 12, 10)];
}

+ (UIImage*) mn_blueRoundBackgroundImage
{
    return [[UIImage imageNamed:@"bg_blue.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(12, 10, 12, 10)];
}

+ (UIImage*) mn_greenRoundBackgroundImage
{
    return [[UIImage imageNamed:@"bg_green.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(12, 10, 12, 10)];
}

+ (UIImage*) mn_whiteBackgroundMidImage
{
    return [[UIImage imageNamed:@"bg_white_mid.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(1, 2, 1, 2)];
}

+ (UIImage*) mn_grayRoundBackgroundImage
{
    return [[UIImage imageNamed:@"bg_gray.png"]
            resizableImageWithCapInsets:UIEdgeInsetsMake(24, 18, 24, 18)];
}

+ (UIImage*) mn_resizeableRedBarImage
{
    return [UIImage imageNamed:@"rbar.png"];
}

+ (UIImage*) mn_resizeableBlueBarImage
{
    return [UIImage imageNamed:@"bbar.png"];
}

+ (UIImage*) mn_questPlaceHolderImage
{
    return [UIImage imageNamed: @"norequest.png"];
}

+ (UIImage*) mn_questPlaceHolderSmallImage
{
    return [UIImage imageNamed: @"noquestsmall.png"];
}

+ (UIImage*) mn_percentagePlaceHolderImage
{
    return [UIImage imageNamed: @"percentage_circle_placeholder.png"];
}

+ (UIImage*) mn_percentagePlaceHolderSmallImage
{
    return [UIImage imageNamed: @"percentage_circle_s.png"];
}

+ (UIImage*) mn_accountBookCoverPlaceholderImage
{
    return [UIImage imageNamed: [self mn_accountBookCoverPlaceholderImageName]];
}

+ (NSString*) mn_accountBookCoverPlaceholderImageName
{
    return @"bookcovereditplaceholder.png";
}

+ (UIImage*) mn_arrowImage
{
    return [UIImage imageNamed: @"DownArrow.png"];
}


@end
