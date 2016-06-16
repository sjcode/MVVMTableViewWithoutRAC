//
//  MessageModel.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "MessageModel.h"
@interface ImageModel()
@property (nonatomic, copy, readwrite) NSString *imageUrl;
@property (nonatomic, copy, readwrite) NSString *desc;
@end

@implementation ImageModel
- (instancetype)initWithDictionary:(NSDictionary*)data{
    self = [super init];
    if (self) {
        _imageUrl = data[@"imageurl"];
        _desc = data[@"desc"];
    }
    return self;
}
@end

@interface MessageModel()
@property (nonatomic, copy, readwrite) NSString *nickname;
@property (nonatomic, copy, readwrite) NSString *avatarUrl;
@property (nonatomic, copy, readwrite) NSString *desc;
@property (nonatomic, copy, readwrite) NSString *datetime;
@property (nonatomic, strong, readwrite) NSArray *images;
@end

@implementation MessageModel

- (instancetype)initWithDictionary:(NSDictionary*)data{
    self = [super init];
    if (self) {
        _nickname = data[@"nickname"];
        _avatarUrl = data[@"avatarurl"];
        _desc = data[@"desc"];
        _datetime = data[@"datetime"];
        
        NSArray *images = [data objectForKey:@"images"];
        NSMutableArray *imageArray = [NSMutableArray array];
        if (images) {
            for (NSDictionary *item in images) {
                ImageModel *model = [[ImageModel alloc]initWithDictionary:item];
                [imageArray addObject:model];
            }
            _images = imageArray;
        }
    }
    return self;
}

@end


