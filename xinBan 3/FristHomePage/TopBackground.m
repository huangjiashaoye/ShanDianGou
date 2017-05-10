//
//  TopBackground.m
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/18.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//


#import "TopBackground.h"

@implementation TopBackground

+(void)setBackground:(UIView *)view  {

    UIImageView *top = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.112 * KScreenHeight)];
    [top setImage:[UIImage imageNamed:@"backTopColor"]];
    [view addSubview:top];
}
+(void)setBackground:(UIView *)view color:(NSString *)color {
    
    UIImageView *top = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.1127 * KScreenHeight)];
    [top setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",color]]];
    [view addSubview:top];
}

+(void)setBackgroundTwo:(UIView *)view color:(NSString *)color {
    
    UIImageView *top = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.1 * KScreenHeight)];
    [top setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",color]]];
    [view addSubview:top];
}

+(void)setBackgroundThree:(UIView *)view  color:(UIColor *)color{
    
    UIView *top = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.1 * KScreenHeight - 0.5)];
   
   // top.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0f];
    
    top.backgroundColor = color;
    
    [view addSubview:top];
}

@end
