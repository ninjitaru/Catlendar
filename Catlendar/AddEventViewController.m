//
//  AddEventViewController.m
//  Catlendar
//
//  Created by Jason Chang on 4/26/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "AddEventViewController.h"
#import "AddEventViewController+Data.h"
#import "AddEventTableItem.h"
#import "UITableViewCell+AddEvent.h"
#import "CatlendarEvent.h"

@interface AddEventViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) CatlendarEvent *event;

@end

@implementation AddEventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview: self.tableView];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) cancel {
    if(_event) {
        [_event MR_deleteEntity];
    }
    [self.navigationController popViewControllerAnimated: YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddEventTableItem *item = ((AddEventTableSectionItem *)[AddEventViewController addEventTableSectionData][indexPath.section]).items[indexPath.row];
    if([item.key isEqualToString: cat_AddEventNote]) {
        return 132;
    } else if([item.key isEqualToString: cat_AddEventDatePicker]) {
        return 163;
    }
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [AddEventViewController addEventTableSectionData].count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *items = ((AddEventTableSectionItem *)[AddEventViewController addEventTableSectionData][section]).items;
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddEventTableItem *item = ((AddEventTableSectionItem *)[AddEventViewController addEventTableSectionData][indexPath.section]).items[indexPath.row];
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier: item.cellIdentifier forIndexPath: indexPath];
    [tableViewCell configWithItem: item event: self.event];
    return tableViewCell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    [UITableViewCell handleCellSelectedWithTableView: tableView selectRowAtIndexPath:indexPath event:self.event];
}

- (UITableView *) tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerNib:[UINib nibWithNibName:@"CLDateTimePickerTableViewCell" bundle:nil] forCellReuseIdentifier:CLDateTimePickerTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CLTextInputTableViewCell" bundle:nil]  forCellReuseIdentifier:CLTextInputTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CLOnOffTableViewCell" bundle:nil]  forCellReuseIdentifier:CLOnOffTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CLUIDatePickerTableViewCell" bundle:nil] forCellReuseIdentifier:CLUIDatePickerTableViewCellIdentifier];
    }
    return _tableView;
}

- (void)keyboardWillShow:(NSNotification *)sender {
    CGSize kbSize = [[[sender userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSTimeInterval duration = [[[sender userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGFloat height = UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation]) ? kbSize.height : kbSize.width;
    
    [UIView animateWithDuration:duration animations:^{
        UIEdgeInsets edgeInsets = [[self tableView] contentInset];
        edgeInsets.bottom = height;
        [[self tableView] setContentInset:edgeInsets];
        edgeInsets = [[self tableView] scrollIndicatorInsets];
        edgeInsets.bottom = height;
        [[self tableView] setScrollIndicatorInsets:edgeInsets];
    }];
}

- (void)keyboardWillHide:(NSNotification *)sender {
    NSTimeInterval duration = [[[sender userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        UIEdgeInsets edgeInsets = [[self tableView] contentInset];
        edgeInsets.bottom = 0;
        [[self tableView] setContentInset:edgeInsets];
        edgeInsets = [[self tableView] scrollIndicatorInsets];
        edgeInsets.bottom = 0;
        [[self tableView] setScrollIndicatorInsets:edgeInsets];
    }];
}

- (CatlendarEvent *) event {
    if(!_event) {
        _event = [CatlendarEvent MR_createEntity];
    }
    return _event;
}

@end
