//
//  OrderWCTableViewCell.m
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "OrderWCTableViewCell.h"

@implementation OrderWCTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _TimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, KScreenWidth, 0.05 * KScreenHeight)];
        _TimeLabel.text = @"剩余支付时间 00:11:23";
        _TimeLabel.font = [UIFont systemFontOfSize:14.0f];
        _TimeLabel.textColor = [UIColor redColor];
        [self addSubview:_TimeLabel];
        
        
        _StateLabel = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 60, 0, 50, 0.05 * KScreenHeight)];
        _StateLabel.text = @"待付款";
        _StateLabel.font = [UIFont systemFontOfSize:13.0f];
        _StateLabel.textColor = [UIColor orangeColor];
        [self addSubview:_StateLabel];
        
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.05 * KScreenHeight + 1, KScreenWidth, 1)];
        
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
        
        
        self.productArray = @[@"1001.jpg",@"1002.jpg"];
        
//        for (int i = 0; i < self.productArray.count; i++) {
            UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10 + 0.05 * KScreenHeight, 0.15 * KScreenHeight - 20, 0.15 * KScreenHeight - 20)];
            
            [image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.productArray[0]]]];
            
            [self addSubview:image];
            
            UILabel *Name = [[UILabel alloc]initWithFrame:CGRectMake(image.frame.origin.x + image.frame.size.width + 5, image.frame.origin.y, 0.35 * KScreenWidth, image.frame.size.width)];
            Name.text = @"百事可乐600ml*24瓶";
            Name.numberOfLines = 0;
            Name.textAlignment =NSTextAlignmentCenter;
            [self addSubview:Name];
            
            UILabel *Price = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 120, image.frame.origin.y + 20, 100, 20)];
            
            
            Price.text = @"￥12.80";
            Price.textAlignment = NSTextAlignmentRight;
            Price.textColor = [UIColor grayColor];
            Price.font = [UIFont systemFontOfSize:13.0f];
            [self addSubview:Price];
            
            UILabel *number = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 120, image.frame.origin.y + 20 + 30, 100, 20)];
            number.text = @"× 12";
            number.textAlignment = NSTextAlignmentRight;
            number.textColor = [UIColor blackColor];
            number.font = [UIFont systemFontOfSize:14.0f];
            [self addSubview:number];
            
//            if (i < self.productArray.count - 1) {
        
//                UILabel *lineImage = [[UILabel alloc]initWithFrame:CGRectMake(image.frame.size.width + 15, image.frame.size.width + image.frame.origin.y + 20, KScreenWidth - 20 - image.frame.size.width, 1)];
//                
//                lineImage.backgroundColor = grayer;
//                [self addSubview:lineImage];
          //  }
          
            
            
    //    }
        
        //商品数量  支付金额  去支付


        UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.05 * KScreenHeight + 1 + 0.15 * KScreenHeight, KScreenWidth, 1)];
        
        line2.backgroundColor = [UIColor grayColor];
        [self addSubview:line2];
        
        
        UILabel *allnumber = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.55, line2.frame.origin.y + 11, KScreenWidth * 0.35, 20)];
        allnumber.text = @"共 12 件商品   应付：";
        allnumber.textColor = [UIColor blackColor];
        allnumber.font = [UIFont systemFontOfSize:13.0f];
        [self addSubview:allnumber];
        
        UILabel *allprice = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.86, line2.frame.origin.y + 11, KScreenWidth * 0.2, 20)];
        allprice.text = @"￥300";
        allprice.textColor = [UIColor redColor];
        allprice.font = [UIFont systemFontOfSize:13.0f];
     //   allprice.backgroundColor = [UIColor orangeColor];
        [self addSubview:allprice];
        
        _PayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _PayButton.frame = CGRectMake(KScreenWidth - 85, line2.frame.origin.y + 33, 75, 26);
        [_PayButton setBackgroundImage:[UIImage imageNamed:@"backTopColor"] forState:UIControlStateNormal];
        [_PayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _PayButton.layer.masksToBounds = YES;
        _PayButton.layer.cornerRadius = 2.0f;
        [_PayButton setTitle:@"去支付" forState:UIControlStateNormal];
        
        [self addSubview:_PayButton];
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
