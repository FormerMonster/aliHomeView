//
//  topView.m
//  仿支付宝首页
//
//  Created by Aventador on 2018/1/12.
//  Copyright © 2018年 Anonymous. All rights reserved.
//

#import "topView.h"


/** 屏幕宽 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
/** 屏幕高 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation topView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
        self.backgroundColor = [UIColor blueColor];;

        UIButton *receiptBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH/2, 100)];
        receiptBtn.backgroundColor = [UIColor blueColor];
        [receiptBtn setImage:[UIImage imageNamed:@"home_icon_gather"] forState:UIControlStateNormal];
        [self addSubview:receiptBtn];
        self.receiptBtn = receiptBtn;
        //扫码按钮
        UIButton *scanBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(receiptBtn.frame), 80, SCREEN_WIDTH/2, 100)];
        scanBtn.backgroundColor = [UIColor blueColor];
        [scanBtn setImage:[UIImage imageNamed:@"hong_icon_scan"] forState:UIControlStateNormal];
        [self addSubview:scanBtn];
        
        self.scanBtn = scanBtn;
    }
    return self;
}

@end
