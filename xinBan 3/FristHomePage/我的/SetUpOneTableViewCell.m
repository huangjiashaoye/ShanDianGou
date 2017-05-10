//
//  SetUpOneTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/8.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "SetUpOneTableViewCell.h"

@implementation SetUpOneTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.labelName = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, KScreenWidth * 0.6, SetUpOneTableViewCellHeight - 10)];
        self.labelName.textColor = [UIColor colorWithRed:65/255.0 green:65/255.0 blue:65/255.0 alpha:1.0f];
        [self.contentView addSubview:self.labelName];
        
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
