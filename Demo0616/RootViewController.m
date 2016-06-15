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
@property (nonatomic, retain) UITableViewCell *prototypeCell;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.viewModel.title;
    [self.tableView registerNib:[UINib nibWithNibName:@"RootTableViewCell" bundle:nil] forCellReuseIdentifier:@"RootTableViewCell"];
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:@"RootTableViewCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:@"RootTableViewCell" forIndexPath:indexPath];
}

- (void)configureCell:(RootTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
    [cell configCell:object];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RootTableViewCell *cell = (RootTableViewCell *)self.prototypeCell;
    MessageModel *model = self.viewModel.dataSource[indexPath.row];
    cell.content.text = model.desc;
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return 1  + size.height;
}

- (void)willDeleteCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath withObject:(id)object{
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
