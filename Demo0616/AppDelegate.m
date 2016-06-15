//
//  AppDelegate.m
//  Demo0616
//
//  Created by sujian on 16/6/15.
//  Copyright © 2016年 sujian. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewModel.h"
#import "RootViewController.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>
#import "BaseNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    RootViewModel *rootViewModel = [[RootViewModel alloc]init];
    RootViewController *viewController = [[RootViewController alloc]init];
    viewController.viewModel = rootViewModel;
    BaseNavigationController *navigationController = [[BaseNavigationController alloc]initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    [self installStubs];
    return YES;
}

- (void)installStubs{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"api/find_user?userid="].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        NSString* fixture = OHPathForFile(@"response.json", self.class);
        return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
}

@end
