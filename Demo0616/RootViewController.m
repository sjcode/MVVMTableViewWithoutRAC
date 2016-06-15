//
//  RootViewController.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "RootViewController.h"
#import "RootTableViewCell.h"
@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.viewModel.title;
    [self.tableView registerNib:[UINib nibWithNibName:@"RootTableViewCell" bundle:nil] forCellReuseIdentifier:@"RootTableViewCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:@"RootTableViewCell" forIndexPath:indexPath];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
    [((RootTableViewCell*)cell)configCell:object];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;
}

- (void)willDeleteCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath withObject:(id)object{
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
