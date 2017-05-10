//
//  OrderDetailXiangSectionTableViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "OrderDetailXiangSectionTableViewCell.h"

@implementation OrderDetailXiangSectionTableViewCell




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        UIImageView *location = [[UIImageView alloc]initWithFrame:CGRectMake(16, (SureOrderOneCell - 24)*0.5, 16, 24)];
        [location setImage:[UIImage imageNamed:@"Location"]];
        [self addSubview:location];
        
        _statue = [[UILabel alloc]initWithFrame:CGRectMake(location.frame.size.width + location.frame.origin.x + 10, 20, self.frame.size.width * 0.35, 30)];
        _statue.text  = @"皇家马德里";
        _statue.textColor = [UIColor blackColor];
       
        [self addSubview:_statue];
        
        _time = [[UILabel alloc]initWithFrame:CGRectMake(20 + _statue.frame.size.width,20, self.frame.size.width * 0.4, 30)];
        _time.text  = @"12345678900";
        _time.font  =[UIFont systemFontOfSize:14.0f];
        _time.textColor = [UIColor blackColor];
        _time.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_time];
        
        
        _address = [[UILabel alloc]initWithFrame:CGRectMake(_statue.frame.origin.x, 20 + _statue.frame.size.height, KScreenWidth - 40, 30)];
        _address.text  = @"上海 德必易园 3081";
        _address.font  =[UIFont systemFontOfSize:14.0f];
//        _address.textColor = [UIColor grayColor];
        _address.numberOfLines = 0;
        [self addSubview:_address];
        
        UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, SureOrderOneCell - 4, KScreenWidth, 4)];
        [line setImage:[UIImage imageNamed:@"fenline"]];
        [self.contentView addSubview:line];
        
        
        UIImageView *backLogo = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth - 16 - 20.25, 0.5 * (SureOrderOneCell - 31.5), 20.25, 31.5)];
        
        [backLogo setImage:[UIImage imageNamed:@"left_roan"]];
        [self addSubview:backLogo];
    }
    return self;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
