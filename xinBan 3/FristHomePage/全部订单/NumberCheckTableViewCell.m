//
//  NumberCheckTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "NumberCheckTableViewCell.h"

@implementation NumberCheckTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, KScreenWidth * 0.4, NumberCheckCell)];
        label.text = @"收货验证码：";
        [self.contentView addSubview:label];
        
        //
        self.number = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, 0, KScreenWidth * 0.4, NumberCheckCell)];
        self.number.textColor = [UIColor orangeColor];
        [self.contentView addSubview:self.number];
        
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
