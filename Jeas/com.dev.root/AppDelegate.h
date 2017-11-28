//
//  AppDelegate.h
//  Jeas
//
//  Created by 邸超 on 2017/3/13.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic,strong) SXSetManager *mpSetManager;
@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)shareInstance;
@end

