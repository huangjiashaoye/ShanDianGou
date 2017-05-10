//
//  Top_View_BG.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/4.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Top_View_BG : UIView


@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UILabel *label;
-(void)TopView:(UIView *)view str:(NSString *)str;
-(void)TopView:(UIView *)view;
-(void)TopView:(UIView *)view Clear:(NSString *)Clear;
-(void)TopView:(UIView *)view Sure:(NSString *)sure;

@end
