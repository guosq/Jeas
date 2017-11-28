//
//  SectionCController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/15.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SectionCController.h"
#import "SectionCModel.h"

@interface SectionCController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray *maData;
@property(nonatomic,strong) UITableView *mvTableView;
@end

@implementation SectionCController


- (NSMutableArray *)maData {
    if (_maData == nil) {
        _maData = [[NSMutableArray alloc] initWithCapacity:0];
        
        SectionCModel *model10 = [SectionCModel modelWith:@"我的" msIconName:@"ic_ques_pre"];
        
        SectionCModel *model20 = [SectionCModel modelWith:@"学习" msIconName:@"ic_ques_pre"];
        SectionCModel *model21 = [SectionCModel modelWith:@"培训" msIconName:@"ic_ques_pre"];
        SectionCModel *model22 = [SectionCModel modelWith:@"考试" msIconName:@"ic_ques_pre"];
        SectionCModel *model23 = [SectionCModel modelWith:@"调查" msIconName:@"ic_ques_pre"];
        
        SectionCModel *model30 = [SectionCModel modelWith:@"设置" msIconName:@"ic_ques_pre"];
        SectionCModel *model31 = [SectionCModel modelWith:@"关于" msIconName:@"ic_ques_pre"];
        
        NSMutableArray *arr1 = [[NSMutableArray alloc] initWithCapacity:0];
        NSMutableArray *arr2 = [[NSMutableArray alloc] initWithCapacity:0];
        NSMutableArray *arr3 = [[NSMutableArray alloc] initWithCapacity:0];
        
        [arr1 addObject:model10];
        
        [arr2 addObject:model20];
        [arr2 addObject:model21];
        [arr2 addObject:model22];
        [arr2 addObject:model23];
        
        [arr3 addObject:model30];
        [arr3 addObject:model31];
        
        [_maData addObject:arr1];
        [_maData addObject:arr2];
        [_maData addObject:arr3];
        
    }
    return _maData;
}

- (UITableView *)mvTableView {
    if (_mvTableView == nil) {
        
        _mvTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _mvTableView.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        
        _mvTableView.delegate = self;
        _mvTableView.dataSource = self;
        _mvTableView.estimatedRowHeight = 50.0f;
        _mvTableView.rowHeight = UITableViewAutomaticDimension;
        
        
        _mvTableView.separatorColor = [UIColor colorWithHexString:@"#cccccc"];
        _mvTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_mvTableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
        //[_mvTableView setLayoutMargins:UIEdgeInsetsZero];
        
        _mvTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //_mvTableView.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        
        _mvTableView.showsVerticalScrollIndicator =NO;
        
        _mvTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
        _mvTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
        
    }
    return _mvTableView;
}

- (void)dealloc {
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)defaultDataLoading{
    [super defaultDataLoading];
}

- (void)setupNavigationBarAppearance{
    [super setupNavigationBarAppearance];
    
    self.navigationItem.title = @"更多";
    
    UIBarButtonItem *send = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(send)];
    
    self.navigationItem.rightBarButtonItem = send;
}
- (void)send {
    
    SXAlertView *alert = [[SXAlertView alloc] init];
    [alert fucpShows];
}
- (void)setupSubviewsUI{
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mvTableView];
    [_mvTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark --- TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    

    return self.maData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSMutableArray *arr = [self.maData objectAtIndex:section];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *sign = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sign];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sign];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSMutableArray *arr = [self.maData objectAtIndex:indexPath.section];
    SectionCModel *model = (SectionCModel *)[arr objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:model.msIconName];
    cell.textLabel.text = model.msTitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



@end
