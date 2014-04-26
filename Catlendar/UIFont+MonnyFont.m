//
//  UIFont+MonnyFont.m
//  Monny
//
//  Created by Jason Chang on 3/11/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "UIFont+MonnyFont.h"

@implementation UIFont (MonnyFont)

+(NSDictionary *) mn_fullFontNameByMonnyFontNames
{
    static NSDictionary *_defaultFontNames = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _defaultFontNames = @{
                              @"americantype":@"AmericanTypewriter-Bold",
                              @"futuraconfensed":@"Futura-CondensedMedium",
                              @"futura":@"Futura-Medium",
                              @"opensanregular":@"OpenSans",
                              @"opensansemibold":@"OpenSans-Semibold",
                              @"opensansbold":@"OpenSans-Bold",
                              @"opensanslight":@"OpenSans-Light",
                              @"lobster":@"Lobster 1.4",
                              @"opensansemibolditalic":@"OpenSans-SemiboldItalic",
                              @"opensansbolditalic":@"OpenSans-BoldItalic"
                                 };
    });
    return _defaultFontNames;
}

+ (UIFont *) mn_fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    NSString *fontFamilyName = [UIFont mn_fullFontNameByMonnyFontNames][fontName];
    if(fontFamilyName) {
        fontName = fontFamilyName;
    }
    return [UIFont fontWithName: fontName size: fontSize];
}

@end
