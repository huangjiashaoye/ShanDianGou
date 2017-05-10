//
//  OrderDetailOneViewController.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailOneViewController : UIViewController
@property(nonatomic,strong)NSArray *productArray;

@property(nonatomic,copy)NSString *OrderNumber;

@property(nonatomic,copy)NSString *PayTypeName;

@property(nonatomic,copy)NSString *OrderStatusName;

@property(nonatomic,copy)NSString *PayStatusName;
@end
