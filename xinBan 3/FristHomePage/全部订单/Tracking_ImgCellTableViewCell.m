//
//  Tracking_ImgCellTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Tracking_ImgCellTableViewCell.h"

@implementation Tracking_ImgCellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.location_red = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 15.5, 20)];
        
        [self.contentView addSubview:self.location_red];
        
        //
        self.line = [[UIImageView alloc]initWithFrame:CGRectMake(self.location_red.frame.origin.x + 0.5 * self.location_red.frame.size.width - 0.5, self.location_red.frame.origin.y + self.location_red.frame.size.height, 1, 0.16 * KScreenHeight - (self.location_red.frame.origin.y + self.location_red.frame.size.height))];
        
        [self.contentView addSubview:self.line];
        
        //
        self.Name = [[UILabel alloc]initWithFrame:CGRectMake(self.location_red.frame.origin.x + self.location_red.frame.size.width + 20, self.location_red.frame.origin.y, KScreenWidth * 0.8, 30)];
        
        [self.contentView addSubview:self.Name];
      //
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(self.location_red.frame.origin.x + self.location_red.frame.size.width + 20, self.Name.frame.origin.y + self.Name.frame.size.height + 10, KScreenWidth * 0.8, 30)];
        
        self.title.textColor = [UIColor grayColor];
        self.title.font = [UIFont systemFontOfSize:14.5f];
        [self.contentView addSubview:self.title];
        
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
