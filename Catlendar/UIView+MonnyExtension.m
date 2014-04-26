//
//  UIView+MonnyExtension.m
//  Monny
//
//  Created by Jason Chang on 4/5/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "UIView+MonnyExtension.h"
#import "UIColor+MonnyColor.h"

@interface EdgeLayer : CALayer
@end

@implementation EdgeLayer
@end

@implementation UIView (MonnyExtension)

- (void) mn_edgeWithWidth:(CGFloat)width inset:(CGFloat) insetWidth onEdge:(MonnyRectEdge) edge {
    for(CALayer *layer in self.layer.sublayers) {
        if([layer isKindOfClass:[EdgeLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
    switch(edge) {
        case MonnyRectEdgeRight:
        {
            CALayer *layer = [CALayer new];
            layer.frame = (CGRect) {
                CGRectGetWidth(self.bounds)-width,
                insetWidth,
                width,
                CGRectGetHeight(self.bounds)-insetWidth*2
            };
            layer.backgroundColor = [UIColor mn_seperatorGray].CGColor;
            [self.layer addSublayer: layer];
            break;
        }
        case MonnyRectEdgeBottom:
        {
            CALayer *layer = [CALayer new];
            layer.frame = (CGRect) {
                insetWidth,
                CGRectGetHeight(self.bounds)-width,
                CGRectGetWidth(self.bounds)-insetWidth*2,
                width
            };
            layer.backgroundColor = [UIColor mn_seperatorGray].CGColor;
            [self.layer addSublayer: layer];
            break;
        }
        case MonnyRectEdgeLeft:
            break;
        case MonnyRectEdgeTop:
            break;
        case MonnyRectEdgeAll:
            break;
        default:
            break;
    }
}

@end
