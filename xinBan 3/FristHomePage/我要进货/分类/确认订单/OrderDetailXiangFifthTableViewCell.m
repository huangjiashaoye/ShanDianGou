//
//  OrderDetailXiangFifthTableViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "OrderDetailXiangFifthTableViewCell.h"

@implementation OrderDetailXiangFifthTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        

        NSArray *title = @[@"订单编号",@"下单时间",@"付款方式",@"留言"];
        NSArray *priceM = @[@"123456677899",@"2016-11-28 13:44:42",@"在线支付 － 微信支付",@"无"];
        
        for (int i = 0; i < title.count; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10 + 160 / 4 * i, KScreenWidth * 0.25, 160 / 4)];
            label.text = [NSString stringWithFormat:@"%@",title[i]];
            label.textColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:13.0f];
            [self addSubview:label];
            
            
            UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(10 + KScreenWidth * 0.25 * 1, 10 + 160 / 4 * i, KScreenWidth * 0.5, 160 / 4)];
            price.text = [NSString stringWithFormat:@"%@",priceM[i]];
            price.textColor = [UIColor blackColor];
            price.font = [UIFont systemFontOfSize:13.0f];
            [self addSubview:price];
            
        }
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
