//
//  RootTableViewCell.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "RootTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface RootTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UIImageView *avatavImageView;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *datetime;

@end

@implementation RootTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)configCell:(MessageModel*)model{
    self.nickname.text = model.nickname;
    self.content.text = model.desc;
    self.datetime.text = model.datetime;
    [self.avatavImageView sd_setImageWithURL:[NSURL URLWithString:model.avatarUrl]];
}

@end
