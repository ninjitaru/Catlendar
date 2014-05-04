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
#import "CLOnOffTableViewCell.h"
#import "CLTextInputTableViewCell.h"
#import "CLUIDatePickerTableViewCell.h"

@interface AddEventViewController () <UITableViewDataSource,UITableViewDelegate,CLOnOffTableViewCellDelegate,CLTextInputTableViewCellDelegate,CLUIDatePickerTableViewCellDelegate>

@property (nonatomic,strong) UITableView *tableView;
#warning TODO do not mofidy this directly
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
        [_event hasChanges];
        [_event MR_deleteEntity];
    }
    [self.navigationController popViewControllerAnimated: YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddEventTableItem *item = ((AddEventTableSectionItem *)[AddEventViewController addEventTableSectionData][indexPath.section]).items[indexPath.row];
    if([item.key isEqualToString: cat_AddEventNote]) {
        return 132;
    } else if([item.key isEqualToString: cat_AddEventDatePicker]) {
        return 217;
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
    [tableViewCell configWithItem: item event: self.event delegate:self];
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

#pragma mark - delegate

- (void) onOffCell:(CLOnOffTableViewCell *)cell onOffValueChanged:(UISwitch *) onOffSwitch {
    self.event.isAllDay = @(onOffSwitch.on);
}

- (void) textInputCell:(CLTextInputTableViewCell *)cell withItemKey:(NSString *)key textValueChanged:(NSString *)text {
    if([key isEqualToString: cat_AddEventTitle]) {
        self.event.title = text;
    } else if([key isEqualToString: cat_AddEventNote]) {
        self.event.note = text;
    }
}

- (void) datePickerCell:(CLUIDatePickerTableViewCell *)cell withItemKey:(NSString *)key datePickerValueChanged:(UIDatePicker *)datePicker {
    if([key isEqualToString: cat_AddEventStartDate]) {
        self.event.startDate = datePicker.date;
    } else if([key isEqualToString: cat_AddEventEndDate]) {
        self.event.endDate = datePicker.date;
    }
    [self.tableView beginUpdates];
    NSIndexPath *indexPath = [self.tableView indexPathForCell: cell];
    NSIndexPath *parentIndexPath = [NSIndexPath indexPathForRow: indexPath.row-1 inSection: indexPath.section];
    [self.tableView reloadRowsAtIndexPaths:@[parentIndexPath] withRowAnimation: UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (CatlendarEvent *) event {
    if(!_event) {
        _event = [CatlendarEvent MR_createEntity];
    }
    return _event;
}

@end
