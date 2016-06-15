//
//  BaseTableViewModel.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface BaseTableViewModel()

@end

@implementation BaseTableViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)fetchDataWithPage:(NSInteger)page withCompletion:(void (^)(id dataArray))completion{

}
@end
