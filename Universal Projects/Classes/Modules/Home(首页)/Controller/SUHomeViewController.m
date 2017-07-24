//
//  SUHomeViewController.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/15.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUHomeViewController.h"

@interface SUHomeViewController () <UITableViewDelegate>

@end

@implementation SUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundColor = self.view.backgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.rowHeight = 94;
    tableView.frame = self.view.bounds;

    [self headerWithScrollView:tableView refreshingTarget:self refreshingAction:nil];

    [self.view addSubview:tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
