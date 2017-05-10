//
//  OrderDetailXiangThridTableViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "OrderDetailXiangThridTableViewCell.h"

@implementation OrderDetailXiangThridTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
//        _image = [[UIImageView alloc]initWithFrame:CGRectMake(15, 0 * KScreenHeight, 0.15 * KScreenHeight - 20, 0.15 * KScreenHeight - 20)];
//        
//        [_image setImage:[UIImage imageNamed:@"1002.jpg"]];
//        
//        [self addSubview:_image];
//        
//        _Name = [[UILabel alloc]initWithFrame:CGRectMake(_image.frame.origin.x + _image.frame.size.width + 5, _image.frame.origin.y, 0.35 * KScreenWidth, _image.frame.size.width)];
//        _Name.text = @"百事可乐600ml*24瓶";
//        _Name.numberOfLines = 0;
//        _Name.textAlignment =NSTextAlignmentCenter;
//        [self addSubview:_Name];
//        
//        _Price = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 120, _image.frame.origin.y + 20, 100, 20)];
//        
//        
//        _Price.text = @"￥12.80";
//        _Price.textAlignment = NSTextAlignmentRight;
//        _Price.textColor = [UIColor grayColor];
//        _Price.font = [UIFont systemFontOfSize:13.0f];
//        [self addSubview:_Price];
//        
//        _number = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 120, _image.frame.origin.y + 20 + 30, 100, 20)];
//        _number.text = @"× 12";
//        _number.textAlignment = NSTextAlignmentRight;
//        _number.textColor = [UIColor blackColor];
//        _number.font = [UIFont systemFontOfSize:14.0f];
//        [self addSubview:_number];
//        
//        
//        //商品数量  支付金额  去支付
//        
//        
//        UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0,  0.15 * KScreenHeight - 8, KScreenWidth, 1)];
//        
//        line2.backgroundColor = [UIColor grayColor];
//        [self addSubview:line2];
// 

      
        self.Name = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 0.45 * KScreenWidth, PrdouctCell - 10)];
        self.Name.textAlignment = NSTextAlignmentLeft;
        self.Name.font = [UIFont systemFontOfSize:14.0f];
        
        [self.contentView addSubview:self.Name];
        
        
        //
        self.number = [[UILabel alloc]initWithFrame:CGRectMake(0.48 * KScreenWidth + 20, 5, 0.2 * KScreenWidth, PrdouctCell - 10)];
        self.number.font = [UIFont systemFontOfSize:12.5f];
        self.number.textColor = [UIColor grayColor];
        self.number.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.number];
        
        //
        self.Price = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.75, 5, 0.2 * KScreenWidth, PrdouctCell - 10)];
        self.Price.font = [UIFont systemFontOfSize:12.5f];
        self.Price.textColor = [UIColor grayColor];
        self.Price.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.Price];
        
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
