//
//  MessageModel.h
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
@property (nonatomic, copy, readonly) NSString *imageUrl;
@property (nonatomic, copy, readonly) NSString *desc;
@end

@interface MessageModel : NSObject
- (instancetype)initWithDictionary:(NSDictionary*)data;

@property (nonatomic, copy, readonly) NSString *nickname;
@property (nonatomic, copy, readonly) NSString *avatarUrl;
@property (nonatomic, copy, readonly) NSString *desc;
@property (nonatomic, copy, readonly) NSString *datetime;
@property (nonatomic, strong, readonly) NSArray *images;
@end
