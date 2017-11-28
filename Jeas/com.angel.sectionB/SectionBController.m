//
//  SectionBController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/15.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SectionBController.h"
#import "SBMainTableViewController.h"
@interface SectionBController ()
{
    UICollectionView *_collectionV;
}
@property (strong, nonatomic) SBMainTableViewController *sbTableviewC;
@end

@implementation SectionBController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // gsq commit
    [self addChildViewController:self.sbTableviewC];
    [self.view addSubview:self.sbTableviewC.tableView];
}

// 初始化数据加载
- (void)defaultDataLoading{
    [super defaultDataLoading];
}
// 设置导航栏 appearance
- (void)setupNavigationBarAppearance{
    [super setupNavigationBarAppearance];
    self.navigationItem.title = @"培训";
}
// 设置子控价UI
- (void)setupSubviewsUI{
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout alloc] ini
    
}
#pragma mark - Get
- (SBMainTableViewController *)sbTableviewC
{
    if (!_sbTableviewC) {
        _sbTableviewC = [[SBMainTableViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    return _sbTableviewC;
}
@end
