//
//  CatDayCellView.m
//  Catlendar
//
//  Created by Jason Chang on 6/29/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CatDayCellView.h"
#import "UIColor+MonnyColor.h"

@interface CatDayCellView ()

@property (nonatomic,strong) UIColor *midNightColor;
@property (nonatomic,strong) UIColor *morningColor;
@property (nonatomic,strong) UIColor *noonColor;
@property (nonatomic,strong) UIColor *dawnColor;


@end

@implementation CatDayCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
        
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void) setup {
    //Create a layer that holds your background image and add it as sublayer of your self.layer
//    CALayer *layer = [CALayer layer];
//    layer.backgroundColor = [UIColor redColor].CGColor;
//    layer.frame = self.layer.bounds;
////    layer.contents = (id)[UIImage imageNamed:@"background.png"].CGImage;
//    [self.layer addSublayer:layer];
    
    //Create your CAGradientLayer
    CAGradientLayer *gradientOverlay = [CAGradientLayer layer];
//    gradientOverlay.backgroundColor = [UIColor greenColor].CGColor;
    self.midNightColor = [UIColor colorWithRed: 46/255. green: 46/255. blue:49/255. alpha: 1];
    self.morningColor = [UIColor colorWithRed: 137/255. green: 237/255. blue: 255/255. alpha: 1];
    self.noonColor = [UIColor colorWithRed: 255/255. green: 243/255. blue:137/255. alpha: 1];
    self.dawnColor = [UIColor colorWithRed: 45/255. green: 82/255. blue:167/255. alpha: 1];
    gradientOverlay.colors = @[(id)self.midNightColor.CGColor,
                               (id)self.morningColor.CGColor,
                               (id)self.noonColor.CGColor,
                               (id)self.dawnColor.CGColor,
                               (id)self.midNightColor.CGColor];
    gradientOverlay.locations = @[@(0.0f),@(0.25f),@(0.5f),@(0.75f),@(1.0f)];
//    CGPoint startPoint = CGPointMake(0,0);
//    CGPoint endPoint = CGPointMake(0,60);
    
//    gradientOverlay.startPoint = startPoint;
    gradientOverlay.frame = self.layer.bounds;
//    gradientOverlay.endPoint = endPoint;
    //set its opacity from 0 ~ 1
    gradientOverlay.opacity = 0.2f;
    //add it as sublayer of self.layer (it will be over the layer with the background image
    [self.layer addSublayer:gradientOverlay];
    
    UILabel * test = [UILabel new];
    test.text = @"25";
    test.frame = (CGRect) {10,5,30,30};
    [self addSubview: test];
}

- (void) setHour:(NSUInteger)hour {
//    UIView *kid = [self viewWithTag: 123];
//    [kid removeFromSuperview];
    CGFloat baneHeight = self.bounds.size.height/24;
    CGFloat start = hour * baneHeight;
    UIView *view = [UIView new];
    view.frame = (CGRect) {0,start,CGRectGetWidth(self.bounds),baneHeight};
    view.tag = 123;
    view.backgroundColor = [UIColor blueColor];
    [self addSubview: view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
