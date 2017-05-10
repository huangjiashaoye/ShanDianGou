//
//  Top_View_BG.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/4.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Top_View_BG.h"

@implementation Top_View_BG

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/

-(void)TopView:(UIView *)view{
    
    UIImageView *top_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.112 * KScreenHeight)];
    [top_view setImage:[UIImage imageNamed:@"Top_BG"]];
    [view addSubview:top_view];
    
}

-(void)TopView:(UIView *)view str:(NSString *)str{
    
    UIImageView *top_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.112 * KScreenHeight)];
    [top_view setImage:[UIImage imageNamed:@"Top_BG"]];
    [view addSubview:top_view];
    
    //标题
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.065 * KScreenHeight, KScreenWidth, 20)];
    self.label.text = [NSString stringWithFormat:@"%@",str];
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:22.0f];
    [view addSubview:self.label];
    
    //消息中心
    
    NSArray *array = @[@"MessageOne"];
    
    for (int i = 0; i < array.count; i++) {
        _btn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        _btn.frame = CGRectMake(15 + (KScreenWidth - 30 - 1 * 0.06 * KScreenWidth) * 1, 0.065 * KScreenHeight, 20, 20);
        [_btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",array[i]]] forState:UIControlStateNormal];
       
        
        [view addSubview:_btn];
        
        //标记
        UILabel *Red = [[UILabel alloc]initWithFrame:CGRectMake(0.03 * KScreenWidth,- 0.02 * KScreenWidth, 0.05 * KScreenWidth, 0.04 * KScreenWidth)];
        Red.backgroundColor = [UIColor redColor];
        Red.text = @"";
        Red.font = [UIFont systemFontOfSize:13.0f];
        Red.textAlignment = NSTextAlignmentCenter;
        Red.textColor = [UIColor whiteColor];
        Red.layer.masksToBounds = YES;
        Red.layer.cornerRadius = 0.02 * KScreenWidth;
      //  [_btn addSubview:Red];
        
        
    }
    
    
}

-(void)TopView:(UIView *)view Clear:(NSString *)Clear{
    
    UIImageView *top_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.112 * KScreenHeight)];
    [top_view setImage:[UIImage imageNamed:@"Top_BG"]];
    [view addSubview:top_view];
    
    //标题
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.065 * KScreenHeight, KScreenWidth, 20)];
    self.label.text = [NSString stringWithFormat:@"%@",Clear];
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:22.0f];
    [view addSubview:self.label];
    
    //消息中心
    

        _btn2 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        _btn2.frame = CGRectMake(KScreenWidth - 60 ,0.065 * KScreenHeight, 50, 20);
        
        [_btn2 setTitle:@"清空" forState:UIControlStateNormal];
        
        [_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        [view addSubview:_btn2];

   
    
    
}

-(void)TopView:(UIView *)view Sure:(NSString *)sure{
    
    UIImageView *top_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.112 * KScreenHeight)];
    [top_view setImage:[UIImage imageNamed:@"Top_BG"]];
    [view addSubview:top_view];
    
    //标题
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.065 * KScreenHeight, KScreenWidth, 20)];
    self.label.text = [NSString stringWithFormat:@"%@",sure];
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:22.0f];
    [view addSubview:self.label];

}

@end
