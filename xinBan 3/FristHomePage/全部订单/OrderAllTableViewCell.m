//
//  OrderAllTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/4.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "OrderAllTableViewCell.h"

@implementation OrderAllTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.logo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 0.14 * KScreenWidth, 0.14 * KScreenWidth)];
        
        [self.logo setImage:[UIImage imageNamed:@"logo_picKuai"]];
        [self.contentView addSubview:self.logo];
        
        //
        self.Name = [[UILabel alloc]initWithFrame:CGRectMake(self.logo.frame.size.width + self.logo.frame.origin.x + 10, self.logo.frame.origin.y, 0.4 * KScreenWidth, 20)];
        
        self.Name.text = @"快来集运";
        self.Name.font = [UIFont fontWithName:@"ArialHebrew" size:17.0f];
        [self.contentView addSubview:self.Name];
        
        //
//
        
        self.Price = [[UIImageView alloc]init];
        self.Price.frame = CGRectMake(KScreenWidth - 0.2 * KScreenWidth - 10, self.Name.frame.origin.y, 65, 15);
        
      
        [self.contentView addSubview:self.Price];
        
        //
        self.Pin = [[UILabel alloc]initWithFrame:CGRectMake(self.Name.frame.origin.x, self.Name.frame.origin.y + self.Name.frame.size.height + 4, self.Name.frame.size.width + 0.2 * KScreenWidth, 20)];
        
        self.Pin.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0f];
        
        self.Pin.text = @"订单号：V2016120167635218";
        self.Pin.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.Pin];
        
        //
        self.Fan = [[UILabel alloc]initWithFrame:CGRectMake(self.Name.frame.origin.x, self.Pin.frame.origin.y + self.Pin.frame.size.height + 4, self.Name.frame.size.width + 0.2 * KScreenWidth, 20)];
        
        self.Fan.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0f];
        
   //     self.Fan.text = @"百事可乐600ml*24瓶 等9件商品";
    //    self.Fan.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.Fan];
        //
        self.AllPay = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 0.2 * KScreenWidth - 10, self.Pin.frame.origin.y + self.Pin.frame.size.height + 4, self.Price.frame.size.width + 10, 20)];
        
        self.AllPay.textColor = [UIColor colorWithRed:242/255.0 green:90/255.0 blue:90/255.0 alpha:1.0f];
        
        self.AllPay.text = @"￥9999";
        self.AllPay.font = [UIFont systemFontOfSize:15.0f];
        self.AllPay.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.AllPay];
        
        //
        self.Back_pic = [[UILabel alloc]initWithFrame:CGRectMake(self.Name.frame.origin.x, self.Fan.frame.size.height + self.Fan.frame.origin.y + 30, 0.4 * KScreenWidth, 16)];
        self.Back_pic.text = @"2016/12/01   11:22:33";
        self.Back_pic.textColor = [UIColor colorWithRed:181/255.0 green:181/255.0 blue:181/255.0 alpha:1.0f];
        self.Back_pic.font = [UIFont systemFontOfSize:13.0f];
        [self.contentView addSubview:self.Back_pic];
        
        //
        self.SjBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.SjBtn.frame = CGRectMake(self.Back_pic.frame.size.width + self.Back_pic.frame.origin.x , self.Back_pic.frame.origin.y - 10, 0.15 * KScreenWidth, 0.059 * KScreenWidth);
     //   [self.SjBtn setBackgroundImage:[UIImage imageNamed:@"SJ_PHONE_VIEW"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.SjBtn];
      
        
        self.OredrDetailBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.OredrDetailBtn.frame = CGRectMake(KScreenWidth - 0.15 * KScreenWidth - 10 , self.Back_pic.frame.origin.y - 10, 0.15 * KScreenWidth, 0.059 * KScreenWidth);
        [self.OredrDetailBtn setBackgroundImage:[UIImage imageNamed:@"detail_picture"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.OredrDetailBtn];
        
     
        
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
