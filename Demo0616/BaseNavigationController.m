//
//  BaseNavigationController.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return [self.viewControllers.lastObject preferredStatusBarStyle];
}

@end
