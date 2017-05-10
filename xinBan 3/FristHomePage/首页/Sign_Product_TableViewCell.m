//
//  Sign_Product_TableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/2/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Sign_Product_TableViewCell.h"

@implementation Sign_Product_TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //必须抢的图片
        self.Left_Img = [[UIImageView alloc]initWithFrame:CGRectMake(8, 15, 0.31 * KScreenWidth, CellProductHeight - 30)];
        
        [self.Left_Img setImage:[UIImage imageNamed:@"defalut_4_5.jpg"]];
        [self.contentView addSubview:self.Left_Img];
        

        
        //商品名字
        self.Top_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_Img.frame.size.width + self.Left_Img.frame.origin.x + 10 , self.Left_Img.frame.origin.y + 10 - self.Left_Img.frame.size.height * 0.2, 0.64 * KScreenWidth, self.Left_Img.frame.size.height * 0.4)];
        
        self.Top_Title.text = @"百事可乐600ML*24 瓶";
        
        self.Top_Title.numberOfLines = 0;
        self.Top_Title.font = [UIFont systemFontOfSize:16.0f];
        [self.contentView addSubview:self.Top_Title];
        
        
        //原价
        self.Left_left_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Top_Title.frame.origin.x, self.Top_Title.frame.origin.y + self.Top_Title.frame.size.height + 10, 0.26 * KScreenWidth, 20)];
        
    //    self.Left_left_Title.text = @"99元";
    //    self.Left_left_Title.textColor = [UIColor grayColor];
    //    self.Left_left_Title.font = [UIFont systemFontOfSize:13.5f];
      //  [self.contentView addSubview:self.Left_left_Title];
        

        
        //时间
        self.Left_right_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_left_Title.frame.origin.x + self.Left_left_Title.frame.size.width, self.Left_left_Title.frame.origin.y, self.Left_left_Title.frame.size.width * 1.6, 20)];
        
      //  self.Left_right_Title .textColor = [UIColor orangeColor];
        
      //  self.Left_right_Title.text = @"";
     //   [self.contentView addSubview:self.Left_right_Title];
        
        self.Right_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_right_Title.frame.size.width + self.Left_right_Title.frame.origin.x, self.Left_right_Title.frame.origin.y, self.Left_right_Title.frame.size.width, 20)];
        
        
      //  self.Right_Title.text = @"后恢复原价";
        //   [self.contentView addSubview:self.Right_Title];
      //  self.Left_right_Title.font = self.Right_Title.font = [UIFont systemFontOfSize:13.0f];
        
    //    self.Right_Title.textColor = [UIColor grayColor];
        
        //限时抢购
        self.Bottom_Left_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_left_Title.frame.origin.x, self.Left_left_Title.frame.origin.y + self.Left_left_Title.frame.size.height , self.Left_Img.frame.size.width * 0.6, self.Top_Title.frame.size.height)];
        
        self.Bottom_Left_Title.text = @"兑换积分:";
        [self.contentView addSubview:self.Bottom_Left_Title];
        self.Bottom_Left_Title.font = [UIFont systemFontOfSize:14.6f];
        
        //价格
        self.Bottom_Right_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Bottom_Left_Title.frame.size.width + self.Bottom_Left_Title.frame.origin.x, self.Bottom_Left_Title.frame.origin.y + 8, 0.2 * KScreenWidth, 0.2 * CellProductHeight)];
        
        //   self.Bottom_Right_Title.text = @"47.79元";
        self.Bottom_Right_Title.textColor = [UIColor colorWithRed:244/255.0 green:29/255.0 blue:79/255.0 alpha:1.0f];
        [self.contentView addSubview:self.Bottom_Right_Title];
        self.Bottom_Right_Title.font = [UIFont systemFontOfSize:15.0f];
        
        //按钮
        self.Btn_Img = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.Btn_Img.frame = CGRectMake(self.Bottom_Right_Title.frame.size.width + self.Bottom_Right_Title.frame.origin.x + 5, self.Bottom_Right_Title.frame.origin.y, self.Bottom_Right_Title.frame.size.height * 3, self.Bottom_Right_Title.frame.size.height);
        
        
        [self.Btn_Img addTarget:self action:@selector(btn_img_clicker:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.Btn_Img];
        
        
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CellProductHeight - 0.5, KScreenWidth, 0.5f)];
        
        lineLabel.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0f];
        [self.contentView addSubview:lineLabel];
        
    }
    return self;
}

-(void)btn_img_clicker:(UIButton *)sender
{
    
    self.ChangeBlock([NSString stringWithFormat:@"%ld",(long)self.foodId],YES);

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
