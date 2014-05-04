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

@interface AddEventViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation AddEventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview: self.tableView];
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
    [tableViewCell configWithItem: item];
    return tableViewCell;
}

- (UITableView *) tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerNib:[UINib nibWithNibName:@"CLDateTimePickerTableViewCell" bundle:nil] forCellReuseIdentifier:CLDateTimePickerTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CLTextInputTableViewCell" bundle:nil]  forCellReuseIdentifier:CLTextInputTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:@"CLOnOffTableViewCell" bundle:nil]  forCellReuseIdentifier:CLOnOffTableViewCellIdentifier];
    }
    return _tableView;
}

@end
