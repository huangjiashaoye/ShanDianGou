//
//  OrderWCTableViewCell.h
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderWCTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *TimeLabel;
@property(nonatomic,strong)UILabel *StateLabel;
@property(nonatomic,strong)NSArray *productArray;
@property(nonatomic,strong)UIButton *PayButton;

@end
