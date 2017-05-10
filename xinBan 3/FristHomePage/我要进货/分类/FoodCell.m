//
//  FoodCell.m
//  ZFShoppingCart
//
//  Created by macOne on 15/11/3.
//  Copyright © 2015年 WZF. All rights reserved.
//

#import "FoodCell.h"

@implementation FoodCell

- (void)awakeFromNib {
    // Initialization code
   // self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0f];
    
    

    
    
    self.backgroundColor = [UIColor whiteColor];
    self.foodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 70, 70)];
    [self.contentView addSubview:self.foodImageView];
    
    
    _food_btn_View = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _food_btn_View.frame = CGRectMake(15, 10, 70, 70);
    [_food_btn_View addTarget:self action:@selector(food_Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_food_btn_View];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(self.foodImageView.frame.size.width + self.foodImageView.frame.origin.x + 10, self.frame.origin.y , 0.52 * KScreenWidth,  self.foodImageView.frame.size.width * 0.65)];
    self.name.font = [UIFont systemFontOfSize:14.0f];
    self.name.numberOfLines = 0;
   
    
  
    [self.contentView addSubview:self.name];
    
    self.month_saled = [[UILabel alloc]initWithFrame:CGRectMake(self.name.frame.origin.x, self.name.frame.origin.y + self.name.frame.size.height - 8, self.name.frame.size.width, 20)];
    self.month_saled.font = [UIFont systemFontOfSize:12.0f];
    self.month_saled.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.month_saled];
    
    
    
    self.price = [[UILabel alloc]initWithFrame:CGRectMake(self.foodImageView.frame.size.width + self.foodImageView.frame.origin.x + 10, self.name.frame.origin.y + self.name.frame.size.height + 20, self.frame.size.width * 0.2, 20)];
    
//    self.price.text = @"￥33.29";
    self.price.font = [UIFont systemFontOfSize:14.0f];
    self.price.textColor = [UIColor redColor];
    [self.contentView addSubview:self.price];
    
    self.minus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.minus.frame = CGRectMake(self.price.frame.origin.x + self.price.frame.size.width - 20, self.price.frame.origin.y, 20, 20);
    [self.minus setBackgroundImage:[UIImage imageNamed:@"Purch_pic"] forState:UIControlStateNormal];
    [self.minus addTarget:self action:@selector(minus:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.minus];
    
    
    self.orderCount = [[UILabel alloc]init];
    self.orderCount.frame = CGRectMake(self.minus.frame.origin.x + self.minus.frame.size.width + 5, self.minus.frame.origin.y, 40, 20);
    self.orderCount.textAlignment = NSTextAlignmentCenter;
    self.orderCount.textColor = [UIColor redColor];
    self.orderCount.font = [UIFont systemFontOfSize:13.0f];
    [self.contentView addSubview:self.orderCount];
   
    self.plus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.plus.frame = CGRectMake(self.orderCount.frame.origin.x + self.orderCount.frame.size.width + 5, self.orderCount.frame.origin.y, 20, 20);
    [self.plus setBackgroundImage:[UIImage imageNamed:@"Add_pic"] forState:UIControlStateNormal];
    [self.plus addTarget:self action:@selector(plus:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.plus];
    
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, SDCellView - 1, self.frame.size.width, 1.0)];
    line.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0f];
    [self.contentView addSubview:line];
    
    
    //    self.minus.backgroundColor = self.plus.backgroundColor = [UIColor cyanColor];
    
  //  self.amount = [self.orderCount.text integerValue];
    
    
    
    self.foodImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.foodImageView.layer.cornerRadius = 5;
    self.foodImageView.layer.masksToBounds = YES;
  
    [self.minus setHidden:YES];
    [self.orderCount setHidden:YES];
   // self.orderCount.backgroundColor = [UIColor redColor];
    [self bringSubviewToFront:self.plusImageView];
    
     [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)plus:(UIButton *)sender {
    
//加减一

    
    self.amount =[self.orderCount.text intValue];
    
    if (self.amount >= [_Stock integerValue]) {
        
        [SKAutoHideMessageView showMessage:@"达到购买上限" inView:self];
        
        //关闭加号按钮
        return ;
    }
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] valueForKey:@"DictPurch_Pic"];
    
    //限购
    NSDictionary *Limit = [[NSUserDefaults standardUserDefaults] valueForKey:@"LimitNumber_Pic"];
    
    NSString *AddNum = [NSString stringWithFormat:@"%@",[dic valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    NSString *LimitNum = [NSString stringWithFormat:@"%@",[Limit valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    self.amount += [AddNum integerValue];
    

    
    if (self.amount > [LimitNum integerValue]) {
        
        [SKAutoHideMessageView showMessage:@"达到购买上线" inView:self];
        return;
    }

    self.plusBlock(self.amount,[NSString stringWithFormat:@"%ld",(long)self.foodId],YES);
    
    [self showOrderNumbers:self.amount];

}
- (void)minus:(UIButton *)sender {
    
    
    
    self.amount =[self.orderCount.text intValue];
   
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] valueForKey:@"DictPurch_Pic"];
    

    
    
    NSString *AddNum = [NSString stringWithFormat:@"%@",[dic valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    
    
    self.amount -= [AddNum integerValue];
    
    self.plusBlock(self.amount,[NSString stringWithFormat:@"%ld",(long)self.foodId],NO);
    
    [self showOrderNumbers:self.amount];
}


-(void)layoutSubviews
{
    [super layoutSubviews];

   // [self showOrderNumbers:self.amount];

}


-(void)setmaintablecell:(NSDictionary *)dic{
    
    
    
    float price = [dic[@"Price"] floatValue];
 
    self.name.text = [NSString stringWithFormat:@"%@",dic[@"ProductName"]];
    self.price.text = [NSString stringWithFormat:@"￥%.2f",price];


    
    [self.foodImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dic[@"PicUrl"]]] placeholderImage:[UIImage imageNamed:@"ic_goods_default"]];
    
    
}

-(void)showOrderNumbers:(NSUInteger)count
{
    self.orderCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.amount];
    if (self.amount > 0)
    {
        [self.minus setHidden:NO];
        [self.orderCount setHidden:NO];
    }
    else
    {
        [self.minus setHidden:YES];
        [self.orderCount setHidden:YES];
    }
}


-(void)showOrderNumbers_Pic:(NSUInteger)count
{
    self.amount = count;
    self.orderCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.amount];
    if (self.amount > 0)
    {
        [self.minus setHidden:NO];
        [self.orderCount setHidden:NO];
    }
    else
    {
        [self.minus setHidden:YES];
        [self.orderCount setHidden:YES];
    }
}


-(void)showOrderNumberTwos:(NSUInteger)count
{

    if (count> 0)
    {
        [self.minus setHidden:NO];
        [self.orderCount setHidden:NO];
        self.orderCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)count];
    }
    else
    {
        [self.minus setHidden:YES];
        [self.orderCount setHidden:YES];
    }
}


//

-(void)food_Click:(UIButton *)sender
{
  self.btn_Click([NSString stringWithFormat:@"%ld",(long)self.foodId]);
}

@end
