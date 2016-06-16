//
//  RootTableViewCell.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "RootTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ImageCollectionViewCell.h"
@interface RootTableViewCell()
//@property (nonatomic, weak) IBOutlet UICollectionView *imageCollectionView;
@end

@implementation RootTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.imageCollectionView registerNib:[UINib nibWithNibName:@"ImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCollectionViewCell"];
}

- (void)configCell:(MessageModel*)model{
    self.nickname.text = model.nickname;
    self.content.text = model.desc;
    self.datetime.text = model.datetime;
    [self.avatavImageView sd_setImageWithURL:[NSURL URLWithString:model.avatarUrl]];
}

- (CGSize)sizeThatFits:(CGSize)size{
    CGFloat totalHeight = 0;
    totalHeight += [self.nickname sizeThatFits:size].height;
    totalHeight += [self.content sizeThatFits:size].height;
    totalHeight += [self.imageCollectionView sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}

+ (UICollectionViewLayout*)collectionViewLayout{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumLineSpacing:10];
    flowLayout.itemSize = CGSizeMake(100, 70);
    return flowLayout;
}
@end
