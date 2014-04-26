#import "UIColor+MonnyColor.h"

@implementation UIColor (MonnyColor)

+(NSDictionary *) mn_defaultColorByNames
{
    static NSDictionary *_defaultColorByNames = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _defaultColorByNames = @{@"backgroundGray":@"0xf0,0xf1,0xf1,0xff",
                                 @"closedGray":@"227,227,227,255",
                                 @"monnyRed":@"239,114,112,255",
                                 @"monnyBlue":@"184,225,225,255",
                                 @"monnyGreen":@"197,225,184,255",
                                 @"seperatorGray":@"210,210,210,255",
                                 @"menuHeaderGray":@"181,182,182,255",
                                 @"menuBackgroundGray":@"0xa7,0xa6,0xa6,0xff",
                                 @"textGray":@"138,135,127,255",  //@"168,165,157,255",
                                 @"textGray2":@"168,165,157,255",
                                 @"textBlack":@"58,52,38,255",
                                 @"textBlack2":@"195,195,195,255",
                                 @"textRed":@"200,99,98,255",
                                 @"textLightBlack":@"160,157,148,255",
                                 @"textLightRed":@"240,155,154,255",
                                 @"textWhite":@"255,255,255,255",
                                 @"milkWhite":@"250,247,247,255",
                                 @"trendWhite":@"232,235,235,255",
                                 @"titleStartBlack":@"83,77,61,255",
                                 @"titleEndBlack":@"158,154,145,255",
                                 @"gradientStartRed":@"226,114,112,255",
                                 @"gradientEndRed":@"240,156,155,255",
                                 @"gradientStartFadeRed":@"226,114,112,55",
                                 @"gradientEndFadeRed":@"240,156,155,55",
                                 @"gradientStartGray":@"173,173,173,255",
                                 @"gradientEndGray":@"207,207,207,255",
                                 @"dropboxBlue":@"49,154,227,255",
                                 @"facebookColor":@"111,149,228,255",
                                 @"twitterColor":@"132,204,233,255",
                                 @"sinaweiboColor":@"249,111,104,255",
                                 };
    });
    return _defaultColorByNames;
}

+ (UIColor*) colorWithMonnyName: (NSString*) name
{
    NSDictionary *colorByNames = [UIColor mn_defaultColorByNames];
    NSArray* comp = [colorByNames[name] componentsSeparatedByString: @","];
    unsigned int r,g,b,a;
    if([comp[0] rangeOfString: @"x"].location != NSNotFound)
    {
        [[NSScanner scannerWithString: comp[0]] scanHexInt: &r];
        [[NSScanner scannerWithString: comp[1]] scanHexInt: &g];
        [[NSScanner scannerWithString: comp[2]] scanHexInt: &b];
        [[NSScanner scannerWithString: comp[3]] scanHexInt: &a];
    }
    else
    {
        r = [comp[0] intValue];
        g = [comp[1] intValue];
        b = [comp[2] intValue];
        a = [comp[3] intValue];
    }

return [UIColor colorWithRed: r/255.0f
                       green: g/255.0f
                        blue: b/255.0f
                       alpha: a/255.0f];
}

+ (UIColor*) mn_dropboxBlue
{
    return [UIColor colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_backgroundGray
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_monnyRed
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_monnyBlue
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_monnyGreen
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_seperatorGray
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_menuHeaderGray
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_menuBackgroundGray
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_milkWhite
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_trendWhite
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_titleStartBlack
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_titleEndBlack
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_gradientStartFadeRed
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_gradientEndFadeRed
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_gradientStartRed
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_gradientEndRed
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_gradientStartGray
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_gradientEndGray
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textGray
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textGray2
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textBlack
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textBlack2
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textRed
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textLightBlack
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textLightRed
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_textWhite
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_facebookColor
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_twitterColor
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

+ (UIColor*) mn_sinaweiboColor
{
    return [self colorWithMonnyName: [NSStringFromSelector(_cmd) substringFromIndex: 3]];
}

@end
