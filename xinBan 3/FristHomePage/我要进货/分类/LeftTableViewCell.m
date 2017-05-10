//
//  LeftTableViewCell.m
//  Linkage
//
//  Created by LeeJay on 16/8/22.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "LeftTableViewCell.h"

#define defaultColor rgba(253, 212, 49, 1)

@interface LeftTableViewCell ()

@property (nonatomic, strong) UIView *yellowView;

@end

@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 70, 30)];
        self.name.numberOfLines = 0;
        self.name.font = [UIFont systemFontOfSize:13.5];
        self.name.textColor = rgba(130, 130, 130, 1);
     //   self.name.highlightedTextColor = defaultColor;
        
        self.name.layer.masksToBounds = YES;
        self.name.layer.cornerRadius = 16.0f;
        self.name.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.name];

//        self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 5, 45)];
//        self.yellowView.backgroundColor = defaultColor;
//        [self.contentView addSubview:self.yellowView];
    }
    return self;
}

- (void)awakeFromNib
{
 
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state

  //  self.contentView.backgroundColor = selected ? [UIColor colorWithWhite:0 alpha:0.1] : [UIColor colorWithWhite:0 alpha:0.1];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:242/255.0 green:244/255.0 blue:246/255.0 alpha:1.0f];

    
  //  self.highlighted = selected;
   // self.name.highlighted = selected;
    

    self.name.backgroundColor = selected ? [UIColor colorWithRed:255.0/255.0 green:169/255.0 blue:0.0 alpha:1.0f]:[UIColor clearColor];

    self.name.textColor = selected ? [UIColor whiteColor]:[UIColor grayColor];
   
    
  //  self.yellowView.hidden = !selected;
}

@end
