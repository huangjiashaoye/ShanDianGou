//
//  MulChooseCell.m
//  MulChooseDemo
//
//  Created by L2H on 16/7/13.
//  Copyright © 2016年 ailk. All rights reserved.
//

#import "TableChooseCell.h"
#define HorizonGap 15
#define TilteBtnGap 10
#define ColorRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation TableChooseCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    CGContextSetStrokeColorWithColor(context, ColorRGB(0xf7f7f7).CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height - 0.5, rect.size.width, 0.5));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self MakeView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)MakeView{


    
    self.icon = [[UIImageView alloc]initWithFrame:CGRectMake(10 , 10, CellHeight - 20, CellHeight - 20)];
    
    [self.contentView addSubview:self.icon];

    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.icon.frame.size.width + self.icon.frame.origin.x + 15, self.icon.frame.origin.y, self.frame.size.width  * 0.5, self.icon.frame.size.height)];
    
    [self.contentView addSubview:self.titleLabel];
    
    self.SelectIconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.SelectIconBtn setImage:[UIImage imageNamed:@"GrayNoneSelect.png"] forState:UIControlStateNormal];
    [self.SelectIconBtn setImage:[UIImage imageNamed:@"GreenSelect.png"] forState:UIControlStateSelected];
    self.SelectIconBtn.userInteractionEnabled = NO;
    
    self.SelectIconBtn.frame = CGRectMake(KScreenWidth - 60, 20, CellHeight - 40, CellHeight - 40);
    
    [self.contentView addSubview:self.SelectIconBtn];
}


-(void)UpdateCellWithState:(BOOL)select{
    self.SelectIconBtn.selected = select;
    _isSelected = select;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    self.SelectIconBtn.selected = !self.SelectIconBtn.selected;

}

@end
