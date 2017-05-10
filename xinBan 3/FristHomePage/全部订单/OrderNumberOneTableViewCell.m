//
//  OrderNumberOneTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "OrderNumberOneTableViewCell.h"

@implementation OrderNumberOneTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.OrderNumber = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 0.65 * KScreenWidth, 20)];
        self.OrderNumber.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.OrderNumber];
        
        //
        self.LogoSuce = [[UIImageView alloc]initWithFrame:CGRectMake(0.8 * KScreenWidth - 20, 10, 81, 19)];
        
        [self.contentView addSubview:self.LogoSuce];
        
        //
        self.OrderSucee = [[UILabel alloc]initWithFrame:CGRectMake(20, 20 + self.OrderNumber.frame.size.height, 0.65 * KScreenWidth, 20)];
        self.OrderSucee.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.OrderSucee];
        
        //
        
        self.BackS = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth - 20 - 20.25, self.OrderSucee.frame.origin.y, 20.25, 31.5)];
        [self.contentView addSubview:self.BackS];
        
        
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
