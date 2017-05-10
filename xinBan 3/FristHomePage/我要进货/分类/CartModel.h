//
//  CartModel.h
//  ArtronUp
//
//  Created by Artron_LQQ on 16/1/7.
//  Copyright © 2016年 ArtronImages. All rights reserved.
//
/**
 *  @author LQQ, 16-01-08 19:01:03
 *
 *  购物车商品模型
 *
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CartModel : NSObject

@property (nonatomic,copy) NSString *ProductId;
@property (nonatomic,copy) NSString *ProductName;
@property (nonatomic,copy) NSString *dateStr;
@property (nonatomic,assign) NSInteger ProductCount;
@property (nonatomic,copy) NSString *ProductPrice;
@property (nonatomic,retain)NSString *ProductPic;
@property (nonatomic,copy)NSString * Stock;
@property (nonatomic,copy)NSString * LimitAount;
@property (nonatomic,copy)NSString * PurchaseMultiple;

@property (nonatomic,assign) BOOL isSelect;

@end
