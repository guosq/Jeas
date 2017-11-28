//
//  MainController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/15.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "MainController.h"

#import "SectionAController.h"
#import "SectionBController.h"
#import "SectionCController.h"

@interface MainController ()<UITabBarControllerDelegate>
{

    UINavigationController *nav1,*nav2,*nav3;
    SectionAController *sectionA;
    SectionBController *sectionB;
    SectionCController *sectionC;
}
@end

@implementation MainController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setTabbarView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
// 初始化数据加载
- (void)defaultDataLoading{
    [super defaultDataLoading];
}
// 设置导航栏 appearance
- (void)setupNavigationBarAppearance{
    [super setupNavigationBarAppearance];
    self.navigationItem.title = @"主页";
}
// 设置子控价UI
- (void)setupSubviewsUI{
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor redColor];
  
}



#pragma mark --- private method
- (void)setTabbarView {

    tabBarController=[[UITabBarController alloc]init];
    tabBarController.delegate = self;
    
    sectionA = [[SectionAController alloc] init];
    nav1=[[UINavigationController alloc]initWithRootViewController:sectionA];
    [self setNavigation:nav1 andBarTopTitle:@"学习" andBarTitle:@"学习" andImage:@"ic_study_nor.png" andSelectImage:@"ic_study_pre.png" andItemTag:1];
    
    
    sectionB =[[SectionBController alloc]init];
    nav2=[[UINavigationController alloc]initWithRootViewController:sectionB];
    [self setNavigation:nav2 andBarTopTitle:@"专题" andBarTitle:@"专题" andImage:@"ic_ques_nor.png" andSelectImage:@"ic_ques_pre.png" andItemTag:2];
    
    // 我的
    sectionC =[[SectionCController alloc]init];
    nav3=[[UINavigationController alloc]initWithRootViewController:sectionC];
    [self setNavigation:nav3 andBarTopTitle:@"更多" andBarTitle:@"更多" andImage:@"ic_more_nor.png" andSelectImage:@"ic_more_pre.png" andItemTag:3];

    tabBarController.viewControllers=[NSArray arrayWithObjects:nav1,nav2, nav3,nil];
    tabBarController.view.frame = self.view.bounds;
    [self.view addSubview:tabBarController.view];
    
    [tabBarController setSelectedIndex:2];
    
}

// 设置tab 与 nav
-(void)setNavigation:(UINavigationController*)nav andBarTopTitle:(NSString*)title andBarTitle:(NSString*)barTitle andImage:(NSString*)norImage andSelectImage:(NSString*)selectImage andItemTag:(NSInteger)itemTag{
    
    //设置头部标题
    nav.navigationBar.topItem.title=title;
    
    UITabBarItem*item=[[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:norImage] tag:itemTag];
    [item setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    //未选择图片
    [item setImage:[[UIImage imageNamed:norImage ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //选择后图片
    [item setSelectedImage:[[UIImage imageNamed:selectImage ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setTitle:barTitle];
    //[item setBadgeValue:@"10"];
    nav.tabBarItem = item;
}


#pragma mark --- tabbar delegate
- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC {
    
    UINavigationController *NAV1 = (UINavigationController *)fromVC;
    UINavigationController *NAV2 = (UINavigationController *)toVC;

    return nil;
}

@end
