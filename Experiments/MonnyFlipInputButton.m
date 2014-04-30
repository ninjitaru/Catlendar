//
//  MonnyFlipInputButton.m
//  Monny
//
//  Created by Jason Chang on 2/27/13.
//  Copyright (c) 2013 Greamer. All rights reserved.
//

#import "MonnyFlipInputButton.h"
#import "CategoryPickerView.h"
#import <QuartzCore/QuartzCore.h>
#import "EntryManager.h"
#import "PickerViewDelegate.h"

@implementation MonnyFlipInputButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    if(self)
    {
        [self customInit];
    }
    return self;
}

- (void) setBackView:(UIView *)backView
{
    [_backView removeFromSuperview];
    _backView = nil;
    _backView = backView;
    [self addSubview: _backView];
    id<PickerViewDelegate> pickerView = (id<PickerViewDelegate>)_backView;
    pickerView.delegate = self;
    _backView.center = CGPointMake(_backView.frame.size.width/2, _backView.frame.size.height/2);
    _backView.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - private methods

- (void) customInit
{
    self.clipsToBounds = YES;
    tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(clicked)];
    tap.numberOfTapsRequired = 1;
    tap.cancelsTouchesInView = NO;
    [self addGestureRecognizer: tap];
    originFrame = self.frame;
}

- (void) rotateViewAnimated:(UIView*)view
               withDuration:(CFTimeInterval)duration
                    byAngle:(CGFloat)angle
{
    [CATransaction begin];
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.byValue = [NSNumber numberWithFloat:angle];
    rotationAnimation.duration = duration;
    rotationAnimation.removedOnCompletion = YES;
    
    [CATransaction setCompletionBlock:^{
        view.transform = CGAffineTransformRotate(view.transform, angle);
    }];
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [CATransaction commit];
}

- (void) rotateViewAnimated: (UIView*) front to: (UIView*) back withDuration: (CFTimeInterval) duration withAngle: (CGFloat) angle onComplete: (void (^)(void))completeBlock
{
    UIColor* c1 = front.backgroundColor;
    UIColor* c2 = back.backgroundColor;

    [UIView animateWithDuration: duration*(2.0f/3) animations: ^{
        self.layer.transform = CATransform3DMakeRotation(angle/2, 1, 0, 0);
        front.backgroundColor = [UIColor grayColor];
    } completion: ^(BOOL finished) {
        back.layer.transform = CATransform3DRotate(CATransform3DMakeRotation(M_PI, 0, 0, 1),M_PI,0,1,0);
        back.backgroundColor = [UIColor grayColor];
        back.hidden = NO;
        
        front.backgroundColor = c1;
        front.hidden = YES;
        
        [UIView animateWithDuration: duration*(1.0f/3) animations: ^{
            self.layer.transform = CATransform3DMakeRotation(angle, 1, 0, 0);
            back.backgroundColor = c2;
        } completion: ^(BOOL finished){
            completeBlock();
        }]; // finish the rotation
    }]; // first rotate half
}

- (void) clicked
{
    if(!self.enableFlip)
    {
        
        return;
    }
    
    _fliped = !_fliped;
    tap.enabled = !_fliped;
    if(!_fliped)
    {
        [UIView animateWithDuration: 0.2f animations: ^{
            self.frame = originFrame;
        } completion: ^(BOOL finished) {
            [self rotateViewAnimated: self.backView to: frontView withDuration: 0.3f withAngle: -M_PI onComplete: ^{
                self.layer.transform = CATransform3DIdentity;
                frontView.layer.transform = CATransform3DIdentity;
            }];
        }];
    }
    else
    {
        [self rotateViewAnimated: frontView to: self.backView withDuration: 0.3f withAngle: -M_PI onComplete: ^{
            [UIView animateWithDuration: 0.2f animations: ^{
                CGRect rect = self.backView.frame;
                rect.origin.y = originFrame.origin.y;
                rect.origin.x = 0;
                self.frame = rect;
            } completion: ^(BOOL finished){
                self.layer.transform = CATransform3DIdentity;
                self.backView.layer.transform = CATransform3DIdentity;
            }]; // flip to identity
        }];
    }
}

- (void) flip
{
    [self clicked];
}

- (void) test: (NSString*) text object: (id) stuff
{
    _value = stuff;
    frontView.value.text = text;
}

- (void) setValue:(id)value
{
    [(id<PickerViewDelegate>)_backView setValue: value];
}

- (void) reset
{
    [(id<PickerViewDelegate>)_backView reset];
}

@end
