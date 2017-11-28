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
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.1];
        _mbIsFull = YES;
        _mbIsResponed = YES;
        
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnself)];
                tap.numberOfTapsRequired = 1;
                [self addGestureRecognizer:tap];
    }
    return self;
}


/**
 * 监听隐藏方法
 1.添加手势
 2.监听触摸方法
 **/
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    //        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sxDismiss)];
//    //        tap.numberOfTapsRequired = 1;
//    //        [self addGestureRecognizer:tap];
//
//    if(_mbIsResponed){
//
//        [self sxDismiss];
//    }else{
//
//    }
//}

// 手势
- (void)tapOnself{
    
    if(_mbIsResponed){
        
        [self sxDismiss];
    }else{
        
    }
}


/**
 * 弹框消失
 1.干掉 subViews,清理内存
 2.如果是全局控件 进行数据更新
 **/
- (void)sxDismiss {
    
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    [self removeFromSuperview];
}

/**
 * 弹框展示
 **/
- (void)sxpShows {
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    
    DCWeakSelf(self);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.superview).insets(UIEdgeInsetsMake(_mbIsFull?0:64, 0, 0, 0));
    }];

    [self sxAddNewView];
}


/**
 * 添加简单子空间  view
 1.用Masonary 布局没有动画,直接设置 frame会有动画
 **/
- (void)sxAddNewView {
    
    UIView *view = [UIView new];
    view.userInteractionEnabled = YES;
    view.layer.cornerRadius = 30;
    view.layer.masksToBounds = YES;
    view.backgroundColor = [UIColor colorWithHexString:@"#ff33ff"];
    view.alpha = 1;
    view.frame = CGRectMake(0, 600, 200, 200);
    [self addSubview:view];
    
    DCWeakSelf(self);
    [UIView animateWithDuration:1.0 animations:^{
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakself);
            make.size.mas_equalTo(CGSizeMake(200, 200));
        }];
        
//        view.center = weakself.center;
    }];
}



@end

