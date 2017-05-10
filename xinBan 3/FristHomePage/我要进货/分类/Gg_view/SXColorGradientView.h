//
//  SXColorGradientView.h
//  Wonderful
//
//  Created by dongshangxian on 15/11/1.
//  Copyright © 2015年 Sankuai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SXGradientDirection) {
    SXGradientToTop    = 1,
    SXGradientToLeft   = 2,
    SXGradientToBottom = 3,
    SXGradientToRight  = 4,
};

@interface SXColorGradientView : UIView


+ (instancetype)createWithColor:(UIColor *)color frame:(CGRect)frame direction:(SXGradientDirection)direction;


+ (instancetype)createWithFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor frame:(CGRect)frame direction:(SXGradientDirection)direction;

+ (instancetype)createWithColorArray:(NSArray *)colorArray frame:(CGRect)frame direction:(SXGradientDirection)direction;

@end
