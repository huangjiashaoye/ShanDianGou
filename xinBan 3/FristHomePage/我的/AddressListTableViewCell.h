//
//  AddressListTableViewCell.h
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/21.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressListTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *NamePhone;
@property(nonatomic,strong)UILabel *DetailLabel;

@property(nonatomic,strong)UIButton *Del;
@property(nonatomic,strong)UIButton *BianJi;

@property(nonatomic,strong)UIButton *SelectAddress;
@property(nonatomic,strong)UILabel *SelectAddress_label;

@end
