//
//  SXSigieView.m
//  Jeas
//
//  Created by 邸超 on 2017/11/28.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SXSigieView.h"
#import "SectionCModel.h"


@interface SXSigieView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *maData;
@property(nonatomic,strong) UITableView *mvTableView;

@end
@implementation SXSigieView

- (NSMutableArray *)maData {
    if (_maData == nil) {
        _maData = [[NSMutableArray alloc] initWithCapacity:0];
      
        SectionCModel *model20 = [SectionCModel modelWith:@"学习" msIconName:@"ic_ques_pre"];
        SectionCModel *model21 = [SectionCModel modelWith:@"培训" msIconName:@"ic_ques_pre"];
        SectionCModel *model22 = [SectionCModel modelWith:@"考试" msIconName:@"ic_ques_pre"];
        SectionCModel *model23 = [SectionCModel modelWith:@"调查" msIconName:@"ic_ques_pre"];
        SectionCModel *model24 = [SectionCModel modelWith:@"小视频" msIconName:@"ic_ques_pre"];
        
 
        [_maData addObject:model20];
        [_maData addObject:model21];
        [_maData addObject:model22];
        [_maData addObject:model23];
        [_maData addObject:model24];

        
    }
    return _maData;
}

- (UITableView *)mvTableView {
    if (_mvTableView == nil) {
        
        _mvTableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        _mvTableView.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        
        _mvTableView.delegate = self;
        _mvTableView.dataSource = self;
        _mvTableView.estimatedRowHeight = 50.0f;
        _mvTableView.rowHeight = UITableViewAutomaticDimension;
        
        _mvTableView.separatorColor = [UIColor colorWithHexString:@"#cccccc"];
        _mvTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_mvTableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
        //[_mvTableView setLayoutMargins:UIEdgeInsetsZero];
        
        _mvTableView.showsVerticalScrollIndicator =YES;
        
//        _mvTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //_mvTableView.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        
        
        
//        _mvTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
//        _mvTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
        
    }
    return _mvTableView;
}

- (instancetype)init {
    if (self == [super init]) {
        
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    [self addSubview:self.mvTableView];
    
    DCWeakSelf(self);
    [self.mvTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(weakself);
    }];
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.maData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *sign = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sign];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sign];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    SectionCModel *model = (SectionCModel *)[self.maData objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:model.msIconName];
    cell.textLabel.text = model.msTitle;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSLog(@" click the index number :%ld",indexPath.row);

}




@end
