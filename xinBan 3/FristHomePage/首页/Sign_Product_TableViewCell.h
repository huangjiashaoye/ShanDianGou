//
//  Sign_Product_TableViewCell.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/2/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sign_Product_TableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *Left_Img;
@property(nonatomic,strong)UILabel *Top_Title;

@property(nonatomic,strong)UILabel *Left_left_Title;
@property(nonatomic,strong)UILabel *Left_right_Title;
@property(nonatomic,strong)UILabel *Right_Title;
@property(nonatomic,strong)UILabel *Bottom_Left_Title;
@property(nonatomic,strong)UILabel *Bottom_Right_Title;
@property(nonatomic,strong)UIButton *Btn_Img;
@property (assign, nonatomic) NSInteger foodId;

@property (copy, nonatomic) void (^ChangeBlock)(NSString *productId,BOOL animated);

@end
