//
//  DetailProductTableViewCell.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailProductTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *Left_Img;
@property(nonatomic,strong)UILabel *Top_Title;
@property(nonatomic,strong)UILabel *Left_left_Title;
@property(nonatomic,strong)UILabel *Left_right_Title;
@property(nonatomic,strong)UILabel *Right_Title;
@property(nonatomic,strong)UILabel *Bottom_Left_Title;
@property(nonatomic,strong)UILabel *Bottom_Right_Title;
@property(nonatomic,strong)UIButton *Btn_Img;
@property (assign, nonatomic) NSUInteger amount;

@property (nonatomic, strong)  UIButton *minus;//减

@property (nonatomic, strong)  UIButton *plus;//加
@property (assign, nonatomic) NSInteger foodId;
@property (nonatomic, strong)  UILabel *orderCount;//个数
@property (nonatomic, copy)  NSString *Stock;//总个数

//减少订单数量 不需要动画效果
@property (copy, nonatomic) void (^plusBlock)(NSInteger count,NSString *productId,BOOL animated);

//+(void)btn_img_clicker_nete:(NSString *)mout;

@end
