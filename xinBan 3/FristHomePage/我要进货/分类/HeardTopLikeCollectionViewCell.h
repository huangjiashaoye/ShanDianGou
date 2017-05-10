//
//  HeardTopLikeCollectionViewCell.h
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/12/12.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeardTopLikeCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UIButton *reduce;
@property(nonatomic,strong)UILabel *count2;
@property(nonatomic,strong)UIButton *add;
@property(nonatomic,copy)NSString *productId;

@property (assign, nonatomic) NSUInteger amount;

-(void)showOrderNumberTwos:(NSUInteger)count;
//减少订单数量 不需要动画效果
@property (copy, nonatomic) void (^plusBlock)(NSInteger count,NSString *procutid,BOOL animated);

-(void)setmaintablecell:(NSDictionary *)dic;

@end
