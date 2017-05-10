//
//  PayAliayOrWeathTableViewCell.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayAliayOrWeathTableViewCell : UITableViewCell

@property(nonatomic,strong)SingleChooseTable * MyTable;

@property (copy, nonatomic) void (^TopCellMapCount)(NSInteger count);


@property(nonatomic,strong)NSArray *title;
@property(nonatomic,strong)NSArray *images;

@end
