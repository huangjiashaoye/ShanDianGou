//
//  OrderDetailXiangFristTableViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "OrderDetailXiangFristTableViewCell.h"

@implementation OrderDetailXiangFristTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UILabel *statue = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, self.frame.size.width * 0.3, 30)];
        statue.text  = @"配送备注：";
        statue.textColor = [UIColor blackColor];
        [self addSubview:statue];
        
        _time = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.7, 5, self.frame.size.width * 0.2, 30)];
        _time.text  = @"点击添加";
        _time.font = statue.font =[UIFont systemFontOfSize:14.0f];
        _time.textColor = [UIColor grayColor];
        _time.textAlignment = NSTextAlignmentRight;
        [self addSubview:_time];
        
        self.Feild = [[UITextView alloc]initWithFrame:CGRectMake(KScreenWidth * 0.6, 5, self.frame.size.width * 0.3, 30)];
        self.Feild.delegate = self;
        self.Feild.font = [UIFont systemFontOfSize:14.0f];
        
        [self.contentView addSubview:self.Feild];
        
        
    }
    return self;
    
}


-(void)textViewDidChange:(UITextView *)textView
{
 
    [_time removeFromSuperview];
    self.TextView(textView.text);
    
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
