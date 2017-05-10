//
//  PurchTableViewCell.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/4.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *logo;
@property(nonatomic,strong)UILabel *Name;
@property(nonatomic,strong)UILabel *Price;
@property(nonatomic,strong)UILabel *Pin;
@property(nonatomic,strong)UILabel *Fan;

@property(nonatomic,strong)UIImageView *Back_pic;
@property(nonatomic,strong)UILabel *back_label;

@property(nonatomic,strong)UIImageView *Get_s;
@property(nonatomic,strong)UILabel *Get_label;

@property(nonatomic,strong)UIImageView *left_roan;

@end
