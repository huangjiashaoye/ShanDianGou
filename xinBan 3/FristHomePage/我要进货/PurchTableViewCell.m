//
//  PurchTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/4.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "PurchTableViewCell.h"

@implementation PurchTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
     
        self.logo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 0.17 * KScreenWidth, 0.17 * KScreenWidth)];
        self.logo.layer.masksToBounds = YES;
        self.logo.layer.cornerRadius = 3.0f;
        self.logo.layer.borderWidth = 0.5f;
        self.logo.layer.borderColor = [UIColor grayColor].CGColor;
        [self.logo setImage:[UIImage imageNamed:@"logo_picKuai"]];
        [self.contentView addSubview:self.logo];
        
        //
        self.Name = [[UILabel alloc]initWithFrame:CGRectMake(self.logo.frame.size.width + self.logo.frame.origin.x + 10, self.logo.frame.origin.y, 0.4 * KScreenWidth, 20)];
        
        self.Name.text = @"快来集运";
        self.Name.font = [UIFont fontWithName:@"ArialHebrew" size:17.0f];
        [self.contentView addSubview:self.Name];
        
        //
        self.Price = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 0.2 * KScreenWidth - 15, self.Name.frame.origin.y, 0.2 * KScreenWidth, 20)];
        
        self.Price.text = @"￥500 起价";
        self.Price.textColor = [UIColor redColor];
        self.Price.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:self.Price];
        
        //
        self.Pin = [[UILabel alloc]initWithFrame:CGRectMake(self.Name.frame.origin.x, self.Name.frame.origin.y + self.Name.frame.size.height + 4,KScreenWidth - self.logo.frame.size.width - 20, 20)];
        
        self.Pin.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0f];
        
        self.Pin.text = @"主营：饮料 零食等";
        self.Pin.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.Pin];
       
        //
        self.Fan = [[UILabel alloc]initWithFrame:CGRectMake(self.Name.frame.origin.x, self.Pin.frame.origin.y + self.Pin.frame.size.height + 4, self.Pin.frame.size.width, 20)];
        
        self.Fan.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0f];
        
        self.Fan.text = @"配送：上海市外环内";
        self.Fan.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.Fan];
        
        //
        self.Back_pic = [[UIImageView alloc]initWithFrame:CGRectMake(self.Name.frame.origin.x, self.Fan.frame.size.height + self.Fan.frame.origin.y + 20, 16, 16)];
        [self.Back_pic setImage:[UIImage imageNamed:@"back_pic"]];
    //    [self.contentView addSubview:self.Back_pic];
        
        //
        self.back_label = [[UILabel alloc]initWithFrame:CGRectMake(self.Back_pic.frame.size.height + self.Back_pic.frame.origin.x + 5, self.Back_pic.frame.origin.y,0.7 * KScreenWidth , self.Back_pic.frame.size.height)];
        
        self.back_label.text = @"当月下单累计达10000元返利30元";
        self.back_label.textColor = [UIColor colorWithRed:160/255.0 green:160/255.0 blue:160/255.0 alpha:1.0f];
        self.back_label.font = [UIFont systemFontOfSize:14.0f];
    //    [self.contentView addSubview:self.back_label];
        
        //
        self.Get_s = [[UIImageView alloc]initWithFrame:CGRectMake(self.Name.frame.origin.x, self.Back_pic.frame.size.height + self.Back_pic.frame.origin.y + 8, 16, 16)];
        [self.Get_s setImage:[UIImage imageNamed:@"GetS"]];
     //   [self.contentView addSubview:self.Get_s];
        
        
        self.Get_label = [[UILabel alloc]initWithFrame:CGRectMake(self.Back_pic.frame.size.height + self.Back_pic.frame.origin.x + 5, self.Get_s.frame.origin.y,0.7 * KScreenWidth , self.Back_pic.frame.size.height)];
        self.Get_label.text = @"活商品下单立送赠品";
        self.Get_label.textColor = [UIColor colorWithRed:160/255.0 green:160/255.0 blue:160/255.0 alpha:1.0f];
        self.Get_label.font = [UIFont systemFontOfSize:14.0f];
     //   [self.contentView addSubview:self.Get_label];
        
        
        //
        self.left_roan = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth - 15 - 0.05 * KScreenWidth, self.back_label.frame.origin.y - 10, 0.05 * KScreenWidth, 0.076 * KScreenWidth)];
        
        [self.left_roan setImage:[UIImage imageNamed:@"left_roan"]];
        
        [self.contentView addSubview:self.left_roan];
        
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
