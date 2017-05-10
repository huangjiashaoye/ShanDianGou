//
//  FoodCell.h
//  ZFShoppingCart
//
//  Created by macOne on 15/11/3.
//  Copyright © 2015年 WZF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodCell : UITableViewCell


//@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;//图片
//
//@property (weak, nonatomic) IBOutlet UILabel *name;//品名
//
//@property (weak, nonatomic) IBOutlet UILabel *price;//价格
//
//@property (weak, nonatomic) IBOutlet UILabel *month_saled;///////////删除
//
//@property (weak, nonatomic) IBOutlet UILabel *praise_num;///////////删除
//
//@property (weak, nonatomic) IBOutlet UIButton *minus;//减
//
//@property (weak, nonatomic) IBOutlet UIButton *plus;//加




@property (nonatomic, strong)  UIImageView *foodImageView;//图片
@property (nonatomic, strong)  UIButton *food_btn_View;//图片

@property (nonatomic, strong)  UILabel *name;//品名

@property (nonatomic, strong)  UILabel *price;//价格

@property (nonatomic, strong)  UILabel *month_saled;//规格

@property (nonatomic, strong)  UILabel *praise_num;///////////删除

@property (nonatomic, strong)  UIButton *minus;//减

@property (nonatomic, strong)  UIButton *plus;//加

@property (nonatomic, strong)  UILabel *orderCount;//个数

@property (assign, nonatomic) NSInteger foodId;
@property (assign, nonatomic) NSString * Stock;
@property (assign, nonatomic) NSUInteger amount;

@property(nonatomic,copy)NSString *productId;

@property(nonatomic,strong)NSDictionary *ProductDataArray;
//减少订单数量 不需要动画效果
@property (copy, nonatomic) void (^plusBlock)(NSInteger count,NSString *productId,BOOL animated);



@property (copy, nonatomic) void (^btn_Click)(NSString *productId);

//-(void)showOrderNumbers:(NSUInteger)count;

@property (weak, nonatomic) IBOutlet UIImageView *plusImageView;

-(void)showOrderNumberTwos:(NSUInteger)count;
-(void)setmaintablecell:(NSDictionary *)dic;
-(void)showOrderNumbers_Pic:(NSUInteger)count;
@end
