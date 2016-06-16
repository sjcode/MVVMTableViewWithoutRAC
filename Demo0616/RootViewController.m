//
//  RootViewController.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "RootViewController.h"
#import "RootTableViewCell.h"
#import "ImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface RootViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
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
    cell.imageCollectionView.delegate = self;
    cell.imageCollectionView.dataSource = self;
    //NSLog(@"configureCell %p tag == %ld",cell,indexPath.row);
    cell.imageCollectionView.tag = indexPath.row;
    
    [cell configCell:object];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPath.row = %ld",indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakself = self;
    return [tableView fd_heightForCellWithIdentifier:@"RootTableViewCell" configuration:^(RootTableViewCell *cell) {
        MessageModel *model = weakself.viewModel.dataSource[indexPath.row];
        //cell.content.text = model.desc;
        [cell configCell:model];
    }];
}

- (void)willDeleteCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath withObject:(id)object{
    
}

#pragma mark - UICollectionView Delegate & DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    MessageModel *model = self.viewModel.dataSource[collectionView.tag];
    return model.images ? model.images.count : 0;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"collectionView = %p tag = %ld indexPath.row = %ld",collectionView,collectionView.tag,indexPath.row);
    MessageModel *model = self.viewModel.dataSource[collectionView.tag];
    
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCell" forIndexPath:indexPath];
    ImageModel *imageModel = model.images[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageModel.imageUrl]];
    return cell;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
