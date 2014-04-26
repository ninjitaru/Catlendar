//
//  CalendarViewController.m
//  Catlendar
//
//  Created by Jason Chang on 4/26/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    if([self respondsToSelector: @selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    [UIView animateWithDuration: 1.0 animations: ^{
        CGRect frame = self.navigationController.navigationBar.frame;
        frame.size.height = 120;
        self.navigationController.navigationBar.frame = frame;
    }];
}

@end
