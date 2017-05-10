//
//  SignOneCollectionViewCell.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/9.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignOneCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *img_bg;
@property(nonatomic,strong)UILabel *pointOrage;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UIButton *Bule_btn;

@property (copy, nonatomic) void (^SignChange)(NSInteger count);

@end
