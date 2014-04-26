//
//  UIView+MonnyExtension.h
//  Monny
//
//  Created by Jason Chang on 4/5/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, MonnyRectEdge) {
    MonnyRectEdgeNone   = 0,
    MonnyRectEdgeTop    = 1 << 0,
    MonnyRectEdgeLeft   = 1 << 1,
    MonnyRectEdgeBottom = 1 << 2,
    MonnyRectEdgeRight  = 1 << 3,
    MonnyRectEdgeAll    = MonnyRectEdgeTop | MonnyRectEdgeLeft | MonnyRectEdgeBottom | MonnyRectEdgeRight
};

@interface UIView (MonnyExtension)

- (void) mn_edgeWithWidth:(CGFloat)width inset:(CGFloat) insetWidth onEdge:(MonnyRectEdge) edge;

@end
