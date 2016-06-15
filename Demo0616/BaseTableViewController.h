//
//  BaseTableViewController.h
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableViewModel.h"
@interface BaseTableViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak, readonly) UITableView *tableView;
@property (nonatomic, strong) BaseTableViewModel *viewModel;
@property (assign, nonatomic, readonly) UIEdgeInsets contentInset;
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;

- (void)willDeleteCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath withObject:(id)object;
@end
