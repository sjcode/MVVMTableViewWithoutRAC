//
//  RootTableViewCell.h
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface RootTableViewCell : UITableViewCell
- (void)configCell:(MessageModel*)model;
//+ (CGFloat)calculateHeight:(MessageModel*)model;

@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UIImageView *avatavImageView;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *datetime;
@property (nonatomic, strong) IBOutlet UICollectionView *imageCollectionView;
@end
