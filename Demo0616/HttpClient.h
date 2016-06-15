//
//  HttpClient.h
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpClient : NSObject
+ (instancetype)sharedInstance;
- (void)fetchDataWithPage:(NSInteger)page withCompletion:(void (^)(NSInteger status, id response))completion;
@end
