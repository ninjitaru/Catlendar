//
//  MonnyFlipInputButton.h
//  Monny
//
//  Created by Jason Chang on 2/27/13.
//  Copyright (c) 2013 Greamer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipFrontView.h"

@interface MonnyFlipInputButton : UIControl
{
    IBOutlet FlipFrontView* frontView;
    UITapGestureRecognizer* tap;
    BOOL _fliped;
    CGRect originFrame;
}

@property (strong, nonatomic) UIView* backView;
@property (assign) BOOL enableFlip;
@property (assign, nonatomic) id value;

- (void) reset;
- (void) test: (NSString*) text object: (id) stuff;
- (void) flip;

@end
