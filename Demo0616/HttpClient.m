//
//  HttpClient.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "HttpClient.h"
#import <AFNetworking.h>

static NSString *const APIClientDefaultEndpoint = @"http://www.quandi.com/";

@interface HttpClient()
@property (nonatomic, strong) AFHTTPRequestOperationManager *requestManager;
@end

@implementation HttpClient

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static HttpClient *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class]alloc]init];
    });
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _requestManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:APIClientDefaultEndpoint]];
        _requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _requestManager.requestSerializer.timeoutInterval = 10;
    }
    return self;
}

- (void)fetchDataWithPage:(NSInteger)page withCompletion:(void (^)(NSInteger status, id response))completion{
    [self.requestManager GET:@"/api/find_user?userid=" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        completion(0, responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        completion(-1, nil);
    }];
}

@end
