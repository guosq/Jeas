//
//  AppDelegate.m
//  Jeas
//
//  Created by 邸超 on 2017/3/13.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

static AppDelegate *appDelegate = nil;

+ (AppDelegate *)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    });
    
    return appDelegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    

    /* 在这里进行状态栏的设置 当然也可以写在单例方法中去设置 */
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
    /* 数据的初始化加载 */
    _mpSetManager = [SXSetManager sharedInstance];
    
    
    /* 初始化 UI */
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController*ugc = nil;
    LoginController *loadVC = [[LoginController alloc] init];
    ugc = [[UINavigationController alloc] initWithRootViewController:loadVC];
    self.window.rootViewController=ugc;
    //ugc.navigationBarHidden=YES;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


/**
 * 关于屏幕 旋转
   设置 屏幕允许旋转方向
 **/
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    if (self.mpSetManager.mbIsRotation) {
    
        return UIInterfaceOrientationMaskAll;
    }

    return UIInterfaceOrientationMaskPortrait;
}


@end
