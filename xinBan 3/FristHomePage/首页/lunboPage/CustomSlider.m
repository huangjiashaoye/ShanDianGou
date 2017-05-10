//
//  CustomSlider.m
//  自制下载进度条
//
//  Created by 华相强 on 16/4/13.
//  Copyright © 2016年 华相强. All rights reserved.
//

#import "CustomSlider.h"

@implementation CustomSlider
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor colorWithRed:100/255.0 green:202/255.0 blue:17/255.0 alpha:1.0f].CGColor;
    
    self.leftView = [[UIImageView alloc]init];
    self.leftView.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    self.leftView.backgroundColor = [UIColor colorWithRed:100/255.0 green:202/255.0 blue:17/255.0 alpha:1.0f];

    [self addSubview:self.leftView];
    
    
    self.ValueLabel = [[UILabel alloc]initWithFrame:self.bounds];
    self.ValueLabel.textAlignment = NSTextAlignmentCenter;
    self.ValueLabel.font = [UIFont systemFontOfSize:17];
    self.ValueLabel.textColor = [UIColor blackColor];
    [self addSubview:self.ValueLabel];
    
    return self;
}
-(void)setLeftFrame:(float)tempValue{
  
    if (tempValue == 0) {
        _ValueLabel.text = @"0%";
        self.leftView.frame = CGRectMake(0, 0, self.frame.size.width * (tempValue / 100.0), self.frame.size.height);
    }
    _ValueLabel.text = [NSString stringWithFormat:@"%.2f%%", tempValue];
    self.leftView.frame = CGRectMake(0, 0, self.frame.size.width * (tempValue / 100.0), self.frame.size.height);
}




@end
