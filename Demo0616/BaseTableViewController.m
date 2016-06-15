//
//  BaseTableViewController.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MJRefresh.h"
#import "UIScrollView+EmptyDataSet.h"

@interface BaseTableViewController ()<DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>
@property (nonatomic, weak, readwrite) IBOutlet UITableView *tableView;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger currentPage;
@end

@implementation BaseTableViewController
@synthesize  viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.171 green:0.309 blue:0.378 alpha:1.000];;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onEdit:)];
    
    
    
    if (self.viewModel.shouldPullToRefresh) {
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshTriggered:)];
        header.lastUpdatedTimeLabel.hidden = YES;
        self.tableView.mj_header = header;
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshTriggered:)];
    }
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableFooterView = [UIView new];
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"viewModel.dataSource"];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

- (void)onEdit:(id)sender{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView dequeueReusableCellWithIdentifier:@"MRCTableViewCellStyleValue1" forIndexPath:indexPath];
    id model = self.viewModel.dataSource[indexPath.row];
    [self configureCell:cell atIndexPath:indexPath withObject:model];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [self tableView:tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        [self willDeleteCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath withObject:nil];
        
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.viewModel.dataSource];
        [array removeObjectAtIndex:indexPath.row];
        self.viewModel.dataSource = array;

        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)refreshTriggered:(id)sender {
    __weak typeof(self) weakSelf = self;
    NSInteger page = [sender isKindOfClass:[MJRefreshNormalHeader class]] ? 1 : self.page;
    
    [self.viewModel fetchDataWithPage:page withCompletion:^(id dataArray) {
        __strong typeof(self) strongself = weakSelf;
        if(page == 1){
            NSMutableArray *array = [[NSMutableArray alloc]initWithArray:dataArray];
            strongself.viewModel.dataSource = array;
        }else{
            NSMutableArray *array = [[NSMutableArray alloc]initWithArray:strongself.viewModel.dataSource];
            [array addObjectsFromArray:dataArray];
            strongself.viewModel.dataSource = array;
        }
        
        [strongself.tableView.mj_header endRefreshing];
        [strongself.tableView.mj_footer endRefreshing];
        
        [strongself.tableView reloadData];
    }];
}

- (void)willDeleteCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath withObject:(id)object{
    
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    return [[NSAttributedString alloc]initWithString:@"No Data"];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"404"];
}

@end
