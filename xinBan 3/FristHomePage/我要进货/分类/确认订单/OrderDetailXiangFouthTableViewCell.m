//
//  OrderDetailXiangFouthTableViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "OrderDetailXiangFouthTableViewCell.h"

@implementation OrderDetailXiangFouthTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
//        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.5 - 0.5, 10, 1, 100)];
//        line.backgroundColor = [UIColor grayColor];
//        [self addSubview:line];
//        
//        NSArray *title = @[@"商品总额",@"＋运费",@"－返利"];
//        NSArray *priceM = @[@"￥26.00",@"￥5.00",@"￥-6.00"];
//        
//        for (int i = 0; i < title.count; i++) {
//            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10 + 100 / 3 * i, KScreenWidth * 0.25, 100 / 3)];
//            label.text = [NSString stringWithFormat:@"%@",title[i]];
//            label.textColor = [UIColor grayColor];
//            label.font = [UIFont systemFontOfSize:13.0f];
//            [self addSubview:label];
//           
//            
//            UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(10 + KScreenWidth * 0.25 * 1, 10 + 100 / 3 * i, KScreenWidth * 0.25, 100 / 3)];
//            price.text = [NSString stringWithFormat:@"%@",priceM[i]];
//            price.textColor = [UIColor blackColor];
//            price.font = [UIFont systemFontOfSize:13.0f];
//            [self addSubview:price];
//            
//        }
//        
//        UILabel *AllName = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.5 * 1, 24, KScreenWidth * 0.5, 100 / 3)];
//        AllName.text = @"订单金额";
//        AllName.textAlignment = NSTextAlignmentCenter;
//        AllName.textColor = [UIColor grayColor];
//        
//        AllName.font = [UIFont systemFontOfSize:14.0f];
//        [self addSubview:AllName];
//        
//        UILabel *Allprice = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.5 * 1, 100 / 3 + 20, KScreenWidth * 0.5, 100 / 3)];
//        Allprice.text = @"￥25.00";
//        Allprice.textColor = [UIColor redColor];
//        Allprice.textAlignment = NSTextAlignmentCenter;
//        Allprice.font = [UIFont systemFontOfSize:19.0f];
//        [self addSubview:Allprice];
        
        
       NSArray *title = @[@"商品总额",@"＋运费",@"－返利"];
        for (int i = 0; i < title.count; i++) {
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20,20 + 30 * i, 0.4 * KScreenWidth, 20)];
            
            label.text = [NSString stringWithFormat:@"%@",title[i]];
            label.font = [UIFont systemFontOfSize:14.5f];
            [self.contentView addSubview:label];
        
            if (i == title.count - 1) {
                
                UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y + label.frame.size.height + 10, KScreenWidth - label.frame.origin.x, 0.5f)];
                line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
                
                [self.contentView addSubview:line];
                
            }
        }
        
        self.AllPriceOne = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 20 - 0.25 * KScreenWidth,20 + 30 * 0, 0.25 * KScreenWidth, 20)];
        
        
        self.FeiOne = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 20 - 0.25 * KScreenWidth,20 + 30 * 1, 0.25 * KScreenWidth, 20)];
        
        
        self.BackPriceOne = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 20 - 0.25 * KScreenWidth,20 + 30 * 2, 0.25 * KScreenWidth, 20)];
        
        
        self.AllPriceOne.textAlignment = self.FeiOne.textAlignment = self.BackPriceOne.textAlignment = NSTextAlignmentRight;
        
        self.AllPriceOne.font = self.BackPriceOne.font = self.FeiOne.font = [UIFont systemFontOfSize:14.5];
        
        [self.contentView addSubview:self.AllPriceOne];
        [self.contentView addSubview:self.FeiOne];
        [self.contentView addSubview:self.BackPriceOne];
        
        
        self.Price = [[UILabel alloc]initWithFrame:CGRectMake(0, PriceCell - 40, KScreenWidth - 20, 40)];
        
        self.Price.textAlignment = NSTextAlignmentRight;
        self.Price.textColor = [UIColor redColor];
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
