//
//  OrderDetailXiangFristTableViewCell.h
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailXiangFristTableViewCell : UITableViewCell <UITextViewDelegate>

@property(nonatomic,strong)UITextView *Feild;
@property(nonatomic,strong)UILabel *time;

@property (copy, nonatomic) void (^TextView)(NSString * count);

@end
