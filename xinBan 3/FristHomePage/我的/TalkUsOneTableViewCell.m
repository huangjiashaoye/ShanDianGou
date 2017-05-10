//
//  TalkUsOneTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/9.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "TalkUsOneTableViewCell.h"

@implementation TalkUsOneTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.MessageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(16, (MessageOneCell - 34)*0.5, 34, 34)];
        
        [self.contentView addSubview:self.MessageLogo];
        
        //
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(self.MessageLogo.frame.origin.x + self.MessageLogo.frame.size.width + 16, self.MessageLogo.frame.origin.y - 6, 0.6 * KScreenWidth, self.MessageLogo.frame.size.height * 0.5)];
      self.title.font =  [UIFont fontWithName:@"CourierNewPSMT" size:18.0F];
        [self.contentView addSubview:self.title];
        
        self.time = [[UILabel alloc]initWithFrame:CGRectMake(self.title.frame.origin.x, self.title.frame.origin.y + self.title.frame.size.height + 10, self.title.frame.size.width, self.title.frame.size.height + 10)];
        self.time.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.time];
        
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
