//
//  ProductDetailCollectionViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/12/5.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "ProductDetailCollectionViewCell.h"

@implementation ProductDetailCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 2.0f;
        self.picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (KScreenWidth - 24) * 0.5, (KScreenWidth - 16) * 0.5)];
        
        [_picture setImage:[UIImage imageNamed:@"defalut_4_5.jpg"]];
        [self.contentView addSubview:_picture];
        
        
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(2, self.picture.frame.origin.y + self.picture.frame.size.height, self.contentView.frame.size.width -4 , 20)];
        self.name.font = [UIFont systemFontOfSize:15.0f];
//        self.name.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.name];
        
        
        self.price = [[UILabel alloc]initWithFrame:CGRectMake(2, self.name.frame.origin.y + self.name.frame.size.height + 12, self.contentView.frame.size.width * 0.33 , 20)];
        self.price.font = [UIFont systemFontOfSize:13.5f];
        self.price.textColor = [UIColor redColor];
//        self.price.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.price];
    
    }
    return self;
}
@end
