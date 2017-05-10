//
//  SignOneCollectionViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/9.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "SignOneCollectionViewCell.h"

@implementation SignOneCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.img_bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SignCell, SignCell)];
        
        [self.contentView addSubview:self.img_bg];
        
        //
        self.pointOrage = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.5 * KScreenWidth - 1 + 10, 0.5 * KScreenWidth - 1, 30)];
        
        self.pointOrage.textColor = [UIColor orangeColor];
        self.pointOrage.textAlignment =NSTextAlignmentCenter;
        self.pointOrage.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.pointOrage];
        
        //
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(0,0.5 * KScreenWidth - 1 + 10 + 30, 0.5 * KScreenWidth - 1, 30)];
        
        self.name.textAlignment =NSTextAlignmentCenter;
        self.name.font = [UIFont systemFontOfSize:16.0f];
        [self.contentView addSubview:self.name];
        
        //
        self.Bule_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.Bule_btn.frame = CGRectMake(0.1 * KScreenWidth, 0.5 * KScreenWidth - 1 + 10 + 60 + 10,(0.5 * KScreenWidth - 1 - 0.2 * KScreenWidth) , (0.5 * KScreenWidth - 1 - 0.2 * KScreenWidth) * 0.34);
        self.Bule_btn.backgroundColor = [UIColor colorWithRed:10/255.0 green:131/255.0 blue:235/255.0 alpha:1.0f];
        self.Bule_btn.layer.masksToBounds = YES;
        self.Bule_btn.layer.cornerRadius = (0.5 * KScreenWidth - 1 - 0.2 * KScreenWidth) * 0.17;
        [self.Bule_btn setTitle:@"兑换" forState:UIControlStateNormal];
        [self.Bule_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.Bule_btn];
        [self.Bule_btn addTarget:self action:@selector(buleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return self;
}


-(void)buleClick:(UIButton *)sender
{
    self.SignChange(sender.tag);
}

@end
