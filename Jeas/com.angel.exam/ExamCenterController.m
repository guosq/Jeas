//
//  ExamCenterController.m
//  Jeas
//
//  Created by 邸超 on 2017/11/28.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "ExamCenterController.h"
#import "SXSigieView.h"

@interface ExamCenterController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong) NSMutableArray *maData;
@property (nonatomic,strong) UICollectionViewFlowLayout *mpFlowLayout;
@property(nonatomic,strong) UICollectionView *mvCollectionView;

@end

@implementation ExamCenterController


- (NSMutableArray *)maData {
    if (_maData == nil) {
        _maData = [[NSMutableArray alloc] initWithCapacity:0];
        
//        DownModel *model = [DownModel modelWithTitle:@"语文资料"
//                                                date:@"2017-11" url:@"jjjj"];
//        DownModel *mode2 = [DownModel modelWithTitle:@"数学资料"
//                                                date:@"2016-1" url:@"jjjj"];
//        DownModel *mode3 = [DownModel modelWithTitle:@"英语资料"
//                                                date:@"2015-6" url:@"jjjj"];
//
//        [_maData addObject:model];
//        [_maData addObject:mode2];
//        [_maData addObject:mode3];
        
        for (int i = 0; i < 10; i ++) {
            [_maData addObject:@1];
        }
        
    }
    return _maData;
}

- (UICollectionView *)mvCollectionView{
    
    if (_mvCollectionView ==nil) {
       
        _mpFlowLayout=[[UICollectionViewFlowLayout alloc] init];
        [_mpFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//        int col = 1;
//        float width = (SCREEN_WIDTH-20)/col;
//        float height = 120;
        _mpFlowLayout.itemSize=CGSizeMake(290, 290);
        _mpFlowLayout.minimumLineSpacing = 10;// 列间距
        _mpFlowLayout.minimumInteritemSpacing = 100;// 行间距
        
        
        _mvCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0,0, 10, 10) collectionViewLayout:_mpFlowLayout];
        _mvCollectionView.delegate = self;
        _mvCollectionView.dataSource = self;
        _mvCollectionView.bounces = NO;
        _mvCollectionView.showsHorizontalScrollIndicator = YES;
        _mvCollectionView.backgroundColor = [UIColor brownColor];
        
        _mvCollectionView.pagingEnabled = YES;
        _mvCollectionView.contentInset = UIEdgeInsetsMake(0,0, 10, 0);
        
        
        [_mvCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
//        [_mvCollectionView registerClass:[SectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
//        [_mvCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    }
    
    return _mvCollectionView;
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
    self.navigationItem.title = @"考试中心";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(reduce)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(add)];
    
    self.navigationItem.rightBarButtonItems = @[item2,item1];
}

- (void)reduce {
    
}

- (void)add {
    
}

- (void)defaultDataLoading {
    [super defaultDataLoading];
}

- (void)setupSubviewsUI {
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mvCollectionView];
    
    DCWeakSelf(self);
    [self.mvCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakself.view).offset(100);
        make.left.equalTo(weakself.view).offset(30);
        make.width.equalTo(@300);
        make.height.equalTo(@300);
        //make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(100, 10, 100, 10));
    }];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidScroll %d",scrollView.tracking);
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.maData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *sign = @"UICollectionViewCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:sign forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    view.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    view.font = [UIFont systemFontOfSize:20];
    view.textColor = [UIColor blackColor];
    view.backgroundColor = [UIColor greenColor];
    [cell addSubview:view];
    
    
    SXSigieView *single = [[SXSigieView alloc] init];
    [cell addSubview:single];
    [single mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(cell).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    return cell;
}



@end
