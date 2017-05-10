//
//  DetailProductTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "DetailProductTableViewCell.h"

@implementation DetailProductTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //必须抢的图片
        self.Left_Img = [[UIImageView alloc]initWithFrame:CGRectMake(8, 15, 0.31 * KScreenWidth, CellProductHeight - 30)];
        
        [self.Left_Img setImage:[UIImage imageNamed:@"defalut_4_5.jpg"]];
        [self.contentView addSubview:self.Left_Img];
        
        //
        UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0.333 * KScreenWidth * 0.36,(CellProductHeight - 30)* 0.36)];
        
        [logo setImage:[UIImage imageNamed:@"Go_Logo"]];
        [self.Left_Img addSubview:logo];
        
        //商品名字
        self.Top_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_Img.frame.size.width + self.Left_Img.frame.origin.x + 10 , self.Left_Img.frame.origin.y + 10 - self.Left_Img.frame.size.height * 0.2, 0.64 * KScreenWidth, self.Left_Img.frame.size.height * 0.4)];
        
        self.Top_Title.text = @"百事可乐600ML*24 瓶";
        
        self.Top_Title.numberOfLines = 0;
        self.Top_Title.font = [UIFont systemFontOfSize:16.0f];
        [self.contentView addSubview:self.Top_Title];
        
        
        //原价
        self.Left_left_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Top_Title.frame.origin.x, self.Top_Title.frame.origin.y + self.Top_Title.frame.size.height + 10, 0.26 * KScreenWidth, 20)];
        
        self.Left_left_Title.text = @"99元";
        self.Left_left_Title.textColor = [UIColor grayColor];
        self.Left_left_Title.font = [UIFont systemFontOfSize:13.5f];
        [self.contentView addSubview:self.Left_left_Title];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_left_Title.frame.origin.x, self.Left_left_Title.frame.origin.y + self.Left_left_Title.frame.size.height * 0.5 - 0.2, self.Left_left_Title.frame.size.width * 0.9, 0.4f)];
        
        line.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:line];
        
        //时间
        self.Left_right_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_left_Title.frame.origin.x + self.Left_left_Title.frame.size.width, self.Left_left_Title.frame.origin.y, self.Left_left_Title.frame.size.width * 1.6, 20)];
        
        self.Left_right_Title .textColor = [UIColor orangeColor];
        
        self.Left_right_Title.text = @"";
        [self.contentView addSubview:self.Left_right_Title];
        
        self.Right_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_right_Title.frame.size.width + self.Left_right_Title.frame.origin.x, self.Left_right_Title.frame.origin.y, self.Left_right_Title.frame.size.width, 20)];
        
        
        self.Right_Title.text = @"后恢复原价";
        //   [self.contentView addSubview:self.Right_Title];
        self.Left_right_Title.font = self.Right_Title.font = [UIFont systemFontOfSize:13.0f];
        
        self.Right_Title.textColor = [UIColor grayColor];
        
        //限时抢购
        self.Bottom_Left_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.Left_left_Title.frame.origin.x, self.Left_left_Title.frame.origin.y + self.Left_left_Title.frame.size.height , self.Left_Img.frame.size.width * 0.6, self.Top_Title.frame.size.height)];
        
        self.Bottom_Left_Title.text = @"限时抢购:";
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
        
        
        self.minus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.minus.frame = CGRectMake(self.Btn_Img.frame.origin.x + self.Btn_Img.frame.size.width - 82, self.Btn_Img.frame.origin.y + 4, 20, 20);
        [self.minus setBackgroundImage:[UIImage imageNamed:@"Purch_pic"] forState:UIControlStateNormal];
        [self.minus addTarget:self action:@selector(minus:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.contentView addSubview:self.minus];
        
        
        self.orderCount = [[UILabel alloc]init];
        self.orderCount.frame = CGRectMake(self.minus.frame.origin.x + self.minus.frame.size.width + 5, self.minus.frame.origin.y, 32, 20);
        self.orderCount.textAlignment = NSTextAlignmentCenter;
        self.orderCount.textColor = [UIColor redColor];
        self.orderCount.font = [UIFont systemFontOfSize:13.0f];
        [self.contentView addSubview:self.orderCount];
        
        self.plus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.plus.frame = CGRectMake(self.orderCount.frame.origin.x + self.orderCount.frame.size.width + 5, self.orderCount.frame.origin.y, 20, 20);
        [self.plus setBackgroundImage:[UIImage imageNamed:@"Add_pic"] forState:UIControlStateNormal];
        
        [self.plus addTarget:self action:@selector(plus:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.plus];
        
        [self.plus setHidden:YES];
        [self.orderCount setHidden:YES];
        [self.minus setHidden:YES];
        
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

- (void)plus:(UIButton *)sender {
    
    //加减一
    //倍增倍减   限购个数
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]valueForKey:@"PurchaseMultiple_bg"];
    
    NSString *PurchaseMultiple = [NSString stringWithFormat:@"%@",[dic valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    //LimitAccount_bg
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults]valueForKey:@"LimitAccount_bg"];
    
    NSString *LimitAccount = [NSString stringWithFormat:@"%@",[dict valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    
    
    self.amount = [self.orderCount.text intValue];
    self.amount += [PurchaseMultiple integerValue];
    
    if (self.amount > [_Stock integerValue]) {
        
        [SKAutoHideMessageView showMessage:@"达到购买上限" inView:self];
        
        //关闭加号按钮
        return ;
    }
    
    if (self.amount > [LimitAccount integerValue]) {
        
        [SKAutoHideMessageView showMessage:@"达到购买上限" inView:self];
        
        //关闭加号按钮
        return ;
    }
    
    
    self.plusBlock(self.amount,[NSString stringWithFormat:@"%ld",(long)self.foodId],YES);
    
    [self showOrderNumbers:self.amount];
    
}
- (void)minus:(UIButton *)sender {
    
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults]valueForKey:@"PurchaseMultiple_bg"];
    
    NSString *PurchaseMultiple = [NSString stringWithFormat:@"%@",[dict valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    self.amount =[self.orderCount.text intValue];
    self.amount -= [PurchaseMultiple integerValue];
    
    self.plusBlock(self.amount,[NSString stringWithFormat:@"%ld",(long)self.foodId],NO);
    
    [self showOrderNumbers:self.amount];
}

-(void)showOrderNumbers:(NSUInteger)count
{
    self.orderCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.amount];
    if (self.amount > 0)
    {
        [self.minus setHidden:NO];
        [self.orderCount setHidden:NO];
        [self.Btn_Img setHidden:YES];
        [self.plus setHidden:NO];
    }
    else
    {
        [self.minus setHidden:YES];
        [self.orderCount setHidden:YES];
        [self.Btn_Img setHidden:NO];
        [self.plus setHidden:YES];
    }
}


-(void)btn_img_clicker:(UIButton *)sender
{
    
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] valueForKey:@"StockDic_Id"];
    
    
    
    NSString *number = [NSString stringWithFormat:@"%@",[dic valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    
    
    if ([number isEqualToString:@"0"]) {
        
        [SKAutoHideMessageView showMessage:@"已被抢完" inView:self];
        
        return;
    }
    
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults]valueForKey:@"PurchaseMultiple_bg"];
    
    NSString *PurchaseMultiple = [NSString stringWithFormat:@"%@",[dict valueForKey:[NSString stringWithFormat:@"%ld",(long)self.foodId]]];
    
    self.orderCount.text = [NSString stringWithFormat:@"%@",PurchaseMultiple];
    
    self.plusBlock([PurchaseMultiple integerValue],[NSString stringWithFormat:@"%ld",(long)self.foodId],YES);
    
    [self.minus setHidden:NO];
    [self.orderCount setHidden:NO];
    [self.plus setHidden:NO];
    [self.Btn_Img setHidden:YES];
}




@end
