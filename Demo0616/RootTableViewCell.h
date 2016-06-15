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
@end
