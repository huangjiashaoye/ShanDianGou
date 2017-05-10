//
//  AddressListTableViewCell.m
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/21.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "AddressListTableViewCell.h"

@implementation AddressListTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
   
        self.backgroundColor = [UIColor whiteColor];
        
        self.NamePhone = [[UILabel alloc]initWithFrame:CGRectMake(12, 5, KScreenWidth - 24, 20)];
        [self addSubview:self.NamePhone];
        
        
        self.DetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, 30, KScreenWidth - 24, 40)];
        self.DetailLabel.font = [UIFont systemFontOfSize:14.0f];
        self.DetailLabel.numberOfLines = 0;
        [self addSubview:self.DetailLabel];
        
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(12, 0.115 * KScreenHeight, KScreenWidth - 20, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
        [self addSubview:line];
        
        //默认地址选择按钮
        self.SelectAddress = [UIButton buttonWithType:UIButtonTypeCustom];
        self.SelectAddress.frame = CGRectMake(20, line.frame.origin.y + 6 + 0.01 * KScreenHeight, 20 , 20);
      //  [self.SelectAddress setImage:[UIImage imageNamed:@"NoSelectOne"] forState:UIControlStateNormal];
     //   self.SelectAddress.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
      //  [self.SelectAddress setTitle:@"默认地址" forState:UIControlStateNormal];
        self.SelectAddress.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        
        [self addSubview:self.SelectAddress];
        
        self.SelectAddress_label = [[UILabel alloc]initWithFrame:CGRectMake(self.SelectAddress.frame.origin.x + self.SelectAddress.frame.size.width + 10, self.SelectAddress.frame.origin.y, 60, 20)];
        
      //  self.SelectAddress_label.text = @"默认地址";
        self.SelectAddress_label.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:self.SelectAddress_label];
        //
        
        self.BianJi = [UIButton buttonWithType:UIButtonTypeCustom];
        self.BianJi.frame = CGRectMake(0.68 * KScreenWidth, line.frame.origin.y + 6 + 0.01 * KScreenHeight, 50 , 20);
        [self.BianJi setImage:[UIImage imageNamed:@"BianJi"] forState:UIControlStateNormal];
        self.BianJi.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self.BianJi setTitle:@"修改" forState:UIControlStateNormal];
        self.BianJi.titleLabel.font = [UIFont systemFontOfSize:12.0f];
 
        [self addSubview:self.BianJi];
        
        self.Del = [UIButton buttonWithType:UIButtonTypeCustom];
        self.Del.frame = CGRectMake(0.68 * KScreenWidth + 60, line.frame.origin.y + 6 + 0.01 * KScreenHeight, 50 , 20);
        [self.Del setImage:[UIImage imageNamed:@"delbutton"] forState:UIControlStateNormal];
        self.Del.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self.Del setTitle:@"删除" forState:UIControlStateNormal];
        self.Del.titleLabel.font = [UIFont systemFontOfSize:12.0f];

        [self addSubview:self.Del];
        
        [self.Del setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.BianJi setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        
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
