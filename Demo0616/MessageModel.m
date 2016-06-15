//
//  MessageModel.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "MessageModel.h"

@interface MessageModel()
@property (nonatomic, copy, readwrite) NSString *nickname;
@property (nonatomic, copy, readwrite) NSString *avatarUrl;
@property (nonatomic, copy, readwrite) NSString *desc;
@property (nonatomic, copy, readwrite) NSString *datetime;
@end

@implementation MessageModel

- (instancetype)initWithDictionary:(NSDictionary*)data{
    self = [super init];
    if (self) {
        _nickname = data[@"nickname"];
        _avatarUrl = data[@"avatarurl"];
        _desc = data[@"desc"];
        _datetime = data[@"datetime"];
    }
    return self;
}
@end
