//
//  DownCenterController.m
//  Jeas
//
//  Created by 邸超 on 2017/11/24.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "DownCenterController.h"
#import "DownCell.h"

@interface DownCenterController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *maData;
@property(nonatomic,strong) UITableView *mvTableView;
@end

@implementation DownCenterController


- (NSMutableArray *)maData {
    if (_maData == nil) {
        _maData = [[NSMutableArray alloc] initWithCapacity:0];
        
        DownModel *model = [DownModel modelWithTitle:@"语文资料"
                                                date:@"2017-11" url:@"jjjj"];
        DownModel *mode2 = [DownModel modelWithTitle:@"数学资料"
                                                date:@"2016-1" url:@"jjjj"];
        DownModel *mode3 = [DownModel modelWithTitle:@"英语资料"
                                                date:@"2015-6" url:@"jjjj"];
        
        [_maData addObject:model];
        [_maData addObject:mode2];
        [_maData addObject:mode3];
        
    }
    return _maData;
}

- (UITableView *)mvTableView {
    if (_mvTableView == nil) {
        
        _mvTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _mvTableView.delegate = self;
        _mvTableView.dataSource = self;
        _mvTableView.estimatedRowHeight = 50.0f;
        _mvTableView.rowHeight = UITableViewAutomaticDimension;
        _mvTableView.backgroundColor=[UIColor colorWithHexString:@"#EEEEEE" alpha:1.0];
        
        _mvTableView.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        
        [_mvTableView setSeparatorInset:UIEdgeInsetsZero];
        [_mvTableView setLayoutMargins:UIEdgeInsetsZero];

        _mvTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mvTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return _mvTableView;
}

- (void)dealloc {
    
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNavigationBarAppearance {
    [super setupNavigationBarAppearance];
    
    self.navigationItem.title = @"下载中心";
}

- (void)defaultDataLoading {
    [super defaultDataLoading];
}


- (void)setupSubviewsUI {
    [super setupSubviewsUI];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mvTableView];
    [_mvTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
    }];
    
}


#pragma mark --- TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.maData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *sign = @"UITableViewCell";
    DownCell *cell = [tableView dequeueReusableCellWithIdentifier:sign];
    
    if (!cell) {
        cell = [[DownCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:sign];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.mpModel = self.maData[indexPath.row];

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
