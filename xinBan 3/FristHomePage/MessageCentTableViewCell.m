//
//  MessageCentTableViewCell.m
//  FristHomePage
//
//  Created by huangfu on 17/1/9.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "MessageCentTableViewCell.h"

@implementation MessageCentTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:0.6f];

        self.time = [[UILabel alloc]initWithFrame:CGRectMake(0.25 * KScreenWidth, 10, KScreenWidth * 0.5, 20)];
        self.time.backgroundColor = [UIColor colorWithRed:143/255.0 green:152/255.0 blue:160/255.0 alpha:1.0f];
        self.time.textColor = [UIColor whiteColor];
        self.time.textAlignment = NSTextAlignmentCenter;
        self.time.layer.masksToBounds = YES;
        self.time.layer.cornerRadius = 10;
        self.time.font = [UIFont systemFontOfSize:13.0f];
        [self.contentView addSubview:self.time];
        
        
        self.logo_img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10 + self.time.frame.origin.y + self.time.frame.size.height, KScreenWidth - 20, MessageCell * 0.7)];
        
        [self.contentView addSubview:self.logo_img];
        
        
        UIView *white_view = [[UIView alloc]initWithFrame:CGRectMake(self.logo_img.frame.origin.x, self.logo_img.frame.size.height + self.logo_img.frame.origin.y, self.logo_img.frame.size.width, MessageCell * 0.5 - 40)];
        
        white_view.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:white_view];
        
        //
        self.Title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, KScreenWidth - 40, 20)];
        self.Title.textAlignment  = NSTextAlignmentLeft;
        [white_view addSubview:self.Title];
        
        //
        
        self.Detail = [[UILabel alloc]initWithFrame:CGRectMake(self.Title.frame.origin.x, self.Title.frame.origin.y + 5 + self.Title.frame.size.height, self.Title.frame.size.width, 40)];
        self.Detail.numberOfLines = 0;
        self.Detail.textColor = [UIColor grayColor];
        self.Detail.font = [UIFont systemFontOfSize:15.0f];
        [white_view addSubview:self.Detail];
        
        
        //
        UILabel *btn_title = [[UILabel alloc]initWithFrame:CGRectMake(self.Detail.frame.origin.x, self.Detail.frame.origin.y + self.Detail.frame.size.height + 8, KScreenWidth * 0.16, 20)];
        btn_title.text = @"查看详细";
        btn_title.font = [UIFont systemFontOfSize:14.0f];
        btn_title.textColor = [UIColor blueColor];
        [white_view addSubview:btn_title];
       
        //
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(btn_title.frame.origin.x, btn_title.frame.size.height + btn_title.frame.origin.y, btn_title.frame.size.width, 1.0f)];
        line.backgroundColor = [UIColor blueColor];
        [white_view addSubview:line];
        
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
