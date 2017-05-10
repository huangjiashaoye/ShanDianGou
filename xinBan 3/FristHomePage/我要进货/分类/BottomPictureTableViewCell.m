//
//  BottomPictureTableViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/12/7.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "BottomPictureTableViewCell.h"

@implementation BottomPictureTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.bottom = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth - 80 - 0.2 * KScreenWidth) * 0.5,(90 - 0.2* KScreenWidth) * 0.6,0.2 * KScreenWidth , 0.125 * KScreenWidth)];
        
        [self.contentView addSubview:self.bottom];
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
