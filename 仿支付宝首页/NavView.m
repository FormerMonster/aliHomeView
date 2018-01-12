//
//  NavView.m
//  仿支付宝首页
//
//  Created by Aventador on 2018/1/12.
//  Copyright © 2018年 Anonymous. All rights reserved.
//

#import "NavView.h"

@implementation NavView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor blueColor];
        
        UIButton *receiptBtn = [[UIButton alloc] initWithFrame:CGRectMake(22, 30, 22, 22)];
        [receiptBtn setImage:[UIImage imageNamed:@"home_icon_gather"] forState:UIControlStateNormal];
        receiptBtn.adjustsImageWhenHighlighted = NO;
        [self addSubview:receiptBtn];
        
        self.receiptBtn = receiptBtn;
        
        UIButton *scanBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(receiptBtn.frame)+30, 30, 22, 22)];
        [scanBtn setImage:[UIImage imageNamed:@"hong_icon_scan"] forState:UIControlStateNormal];
        scanBtn.adjustsImageWhenHighlighted = NO;
        [self addSubview:scanBtn];

        self.scanBtn = scanBtn;
    }
    return self;
}


@end
