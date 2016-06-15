//
//  RootViewModel.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "RootViewModel.h"
#import "MessageModel.h"
#import "HttpClient.h"

@interface RootViewModel()

@end

@implementation RootViewModel
@synthesize title = _title;
@synthesize shouldPullToRefresh = _shouldPullToRefresh;
@synthesize dataSource = _dataSource;

- (instancetype)init{
    self = [super init];
    if (self) {
        _title = @"MVVM_TableView without RAC";
        _shouldPullToRefresh = YES;
        id array = @[
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://img5.duitang.com/uploads/item/201409/28/20140928224358_Vi3fE.jpeg",
                          @"nickname":@"娃娃",
                          @"desc":@"吃货",
                          @"datetime":@"2016-03-11 13:11"},
                        
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://img5.duitang.com/uploads/item/201409/28/20140928224358_Vi3fE.jpeg",
                          @"nickname":@"娃娃",
                          @"desc":@"吃货",
                          @"datetime":@"2016-03-11 13:11"},
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://img5.duitang.com/uploads/item/201409/28/20140928224358_Vi3fE.jpeg",
                          @"nickname":@"娃娃",
                          @"desc":@"吃货",
                          @"datetime":@"2016-03-11 13:11"},
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://img5.duitang.com/uploads/item/201409/28/20140928224358_Vi3fE.jpeg",
                          @"nickname":@"娃娃",
                          @"desc":@"吃货",
                          @"datetime":@"2016-03-11 13:11"},
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://img5.duitang.com/uploads/item/201409/28/20140928224358_Vi3fE.jpeg",
                          @"nickname":@"娃娃",
                          @"desc":@"吃货",
                          @"datetime":@"2016-03-11 13:11"},
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://img5.duitang.com/uploads/item/201409/28/20140928224358_Vi3fE.jpeg",
                          @"nickname":@"娃娃",
                          @"desc":@"吃货",
                          @"datetime":@"2016-03-11 13:11"},
                        @{@"avatarurl":@"http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg",
                          @"nickname":@"August",
                          @"desc":@"software engineer",
                          @"datetime":@"2016-06-16 16:09"},
                        
                        @{@"avatarurl":@"http://img5.duitang.com/uploads/item/201409/28/20140928224358_Vi3fE.jpeg",
                          @"nickname":@"娃娃",
                          @"desc":@"吃货",
                          @"datetime":@"2016-03-11 13:11"},
                     ];
        
        NSMutableArray *list = [NSMutableArray array];
        for (id data in array) {
            MessageModel *model = [[MessageModel alloc]initWithDictionary:data];
            [list addObject:model];
        }
        
        //_dataSource = list;
    }
    return self;
}

- (void)fetchDataWithPage:(NSInteger)page withCompletion:(void (^)(id response))completion{
    [[HttpClient sharedInstance]fetchDataWithPage:page withCompletion:^(NSInteger status, id response) {
        if (status == 0 && response) {
            NSArray *list = response[@"list"];
            NSMutableArray *array = [NSMutableArray array];
            for (id item in list) {
                MessageModel *model = [[MessageModel alloc]initWithDictionary:item];
                [array addObject:model];
            }
            completion(array);
        }else{
            completion(@[]);
        }
    }];
}


@end
