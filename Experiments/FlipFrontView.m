//
//  FlipFrontView.m
//  Monny
//
//  Created by Jason Chang on 2/27/13.
//  Copyright (c) 2013 Greamer. All rights reserved.
//

#import "FlipFrontView.h"
#import "MonnyFlipInputButton.h"

@implementation FlipFrontView

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

- (void) customInit
{

}

@end
