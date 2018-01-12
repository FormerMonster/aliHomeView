//
//  ViewController.m
//  仿支付宝首页
//
//  Created by Aventador on 2018/1/12.
//  Copyright © 2018年 Anonymous. All rights reserved.
//

#import "ViewController.h"
#import "topView.h"
#import "NavView.h"


/** 屏幕宽 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
/** 屏幕高 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 表单 */
@property(nonatomic, strong) UITableView *tableView;
/** topView   未滑动 */
@property(nonatomic, strong) UIView *topView;
/** 顶部导航View 滑动后 */
@property(nonatomic, strong) UIView *navView;

/** topView收款按钮 */
@property(nonatomic, strong) UIButton *receiptBtn;
/** topView扫码按钮 */
@property(nonatomic, strong) UIButton *scanBtn;

/** 虚拟导航栏收款按钮 */
@property(nonatomic, strong) UIButton *navRecetiptBtn;
/** 虚拟导航栏扫码按钮 */
@property(nonatomic, strong) UIButton *navScanBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addUI];
}

- (void)addUI{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];

    
    if (@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
    }
    
    // 用于显示给用户的假headerView占位
    UIView *placeHoldView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 238)];
    placeHoldView.backgroundColor = [UIColor clearColor];
    tableView.tableHeaderView = placeHoldView;
    
    //未滑动时的头部
    topView *homeTopView = [[topView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, 238)];
    [tableView addSubview:homeTopView];
    self.topView = homeTopView;
    
    self.receiptBtn = homeTopView.receiptBtn;
    self.scanBtn = homeTopView.scanBtn;
    
    //滑动时的头部
    NavView *slideTopView = [[NavView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 80)];
    slideTopView.hidden = YES;
    [self.view addSubview:slideTopView];
    
    self.navView = slideTopView;
    self.navRecetiptBtn = slideTopView.receiptBtn;
    self.navScanBtn = slideTopView.scanBtn;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];

    cell.textLabel.text = @"XXXX";
    return cell;
}

//通过此方法 去监听 tableView的滚动 偏移量 通过偏移量去设置顶部的两个view的显示和隐藏

#pragma mark - UIScrollView delegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.tableView.contentSize = CGSizeMake(0,SCREEN_HEIGHT +160);
    
    CGFloat tableViewoffsetY = scrollView.contentOffset.y;
    NSLog(@"%f",tableViewoffsetY);
    
    if (tableViewoffsetY <50) {
        
        self.topView.hidden = NO;
        self.navView.hidden = YES;

        self.topView.alpha = 1;
        
    }else if (tableViewoffsetY >=50 && tableViewoffsetY <150) {
        
        self.navView.hidden = NO;
        self.navView.alpha = 0.5;
        
        self.topView.hidden = NO;
        self.topView.alpha = 0.5;
        
    }else  if (tableViewoffsetY >=155) {
        
        self.topView.hidden = YES;
        
        self.navView.alpha = 1;
        self.navView.hidden = NO;

    }
    /* topView联动 */
    if (tableViewoffsetY > 0) {
        self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 238);
    }
    else{
        self.topView.frame = CGRectMake(0, tableViewoffsetY, SCREEN_WIDTH, 238);
    }
    
}
@end
