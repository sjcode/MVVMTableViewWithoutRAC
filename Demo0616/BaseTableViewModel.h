//
//  BaseTableViewModel.h
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
@interface BaseTableViewModel : BaseViewModel
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, assign) BOOL shouldPullToRefresh;

- (void)fetchDataWithPage:(NSInteger)page withCompletion:(void (^)(id response))completion;
@end
