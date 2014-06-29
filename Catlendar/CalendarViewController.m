//
//  CalendarViewController.m
//  Catlendar
//
//  Created by Jason Chang on 4/26/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CalendarViewController.h"
#import "CatDayCellView.h"

@interface CalendarViewController ()

@property (nonatomic, strong) CatDayCellView *stuff;
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
    
    self.stuff = [[CatDayCellView alloc] initWithFrame: (CGRect){50,200,60,60}];
    [self.view addSubview: self.stuff];
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    [UIView animateWithDuration: 1.0 animations: ^{
        CGRect frame = self.navigationController.navigationBar.frame;
        frame.size.height = 120;
        self.navigationController.navigationBar.frame = frame;
    }];
    
    self.stuff.hour = 12;
    self.stuff.hour = 13;
    self.stuff.hour = 19;
    self.stuff.hour = 20;
    self.stuff.hour = 21;
    self.stuff.hour = 22;
}

@end
