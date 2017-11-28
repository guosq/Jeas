//
//  SectionAController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/15.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SectionAController.h"
#import "VerticallyAlignedLabel.h"





@interface SectionAController ()
{

    UIButton *_btn;
}
@end

@implementation SectionAController

- (BOOL)prefersStatusBarHidden {
    
    return NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *delegate = [AppDelegate shareInstance];
    delegate.mpSetManager.mbIsRotation = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    AppDelegate *delegate = [AppDelegate shareInstance];
    delegate.mpSetManager.mbIsRotation = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    _btn = [[UIButton alloc] init];
    _btn.frame = CGRectMake(0, 0, 100, 100);
    _btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_btn];
    [_btn addTarget:self action:@selector(assetDownlosadcfas) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *_lab = [[UILabel alloc] init];
    _lab.text = @"siugdisadgof";
    _lab.frame = CGRectMake(0,200 ,200, 50);
    _lab.backgroundColor = DCcolorRGB(255, 0, 0);
    [self.view addSubview:_lab];
    
//    VerticallyAlignedLabel *label = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 300, 200, 50)];
//    [label setVerticalAlignment:VerticalAlignmentTop];
//    label.backgroundColor = DCcolorRGB(255, 0, 0);
//    label.text = @"siugdisadgof";
//    [self.view addSubview:label];

//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view).offset(300);
//        make.bottom.equalTo(self.view);
//    }];
 
    
    
}

- (void)defaultDataLoading{
    [super defaultDataLoading];
}

- (void)setupNavigationBarAppearance{
    [super setupNavigationBarAppearance];
    self.navigationItem.title = @"学习";
}

- (void)setupSubviewsUI{
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor whiteColor];
    
}


#pragma mark --- action
- (void)assetDownlosadcfas{

}

@end
