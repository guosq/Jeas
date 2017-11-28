//
//  SXAlertView.m
//  Jeas
//
//  Created by 邸超 on 2017/11/27.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SXAlertView.h"

@interface SXAlertView()

@end

@implementation SXAlertView

- (instancetype)init {
    
    if (self == [super init]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];
        
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fucsDismiss)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];

    }
    return self;
}

- (void)funcsAddNewView {
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 600, 200, 200);
    
    [self addSubview:view];
    
    DCWeakSelf(self);
    [UIView animateWithDuration:1.0 animations:^{
        
        view.center = weakself.center;
    }];
}

- (void)fucsDismiss {
    
    [self removeFromSuperview];
}

- (void)fucpShows {
    
    
   
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    
    self.frame = window.bounds;
    self.frame = CGRectMake(0, 100, SCREEN_WIDTH, 500);
    
    [window addSubview:self];
    
    [self funcsAddNewView];
    
    
}

@end

