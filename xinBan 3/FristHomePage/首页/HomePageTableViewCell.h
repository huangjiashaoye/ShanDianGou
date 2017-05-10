//
//  HomePageTableViewCell.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomePageTableViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property(nonatomic,copy)NSArray *images;
@property(nonatomic,copy)NSArray *Link_images;
@property (copy, nonatomic) void (^TopCellMap)(NSDictionary *count);

@property (copy, nonatomic) void (^TopCell)(float count);

@end
