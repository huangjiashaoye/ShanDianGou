//
//  HeardTopLikeCollectionViewCell.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/12/12.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "HeardTopLikeCollectionViewCell.h"

@implementation HeardTopLikeCollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 1.0f;
        
                self.backgroundColor = [UIColor whiteColor];
        
              //  NSDictionary *dic = itemListTopText[indexPath.row];
        
                _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
                [_image sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"defalut_4_5.jpg"]];
        
                [self.contentView addSubview:_image];
        
                _label = [[UILabel alloc]initWithFrame:CGRectMake(4, _image.frame.size.height , _image.frame.size.width - 8, 20)];
        
//                label.text = [NSString stringWithFormat:@"%@ %@",[dic valueForKey:@"itemBrand"],[dic valueForKey:@"itemName"]];
                _label.font = [UIFont systemFontOfSize:14.0f];
                [self.contentView addSubview:_label];
        
        
                UILabel *grayLabel = [[UILabel alloc]initWithFrame:CGRectMake(_label.frame.origin.x, _label.frame.size.height + _label.frame.origin.y , _label.frame.size.width, _label.frame.size.height)];
        
//                grayLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"property"]];
                grayLabel.font = [UIFont systemFontOfSize:12.5f];
                grayLabel.textColor = [UIColor grayColor];
                [self.contentView addSubview:grayLabel];
        
//                 NSString *spuId = [NSString stringWithFormat:@"%@",[dic valueForKey:@"spuId"]];
                //价格
                _price = [[UILabel alloc]initWithFrame:CGRectMake(grayLabel.frame.origin.x, grayLabel.frame.origin.y + grayLabel.frame.size.height, 0.35 * grayLabel.frame.size.width, 30)];
        
        
                _price.textColor = [UIColor redColor];
                _price.font = [UIFont systemFontOfSize:13.5f];
//                _price.text = [NSString stringWithFormat:@"￥%.2f",[priceItem floatValue] / 100];
        
                [self.contentView addSubview:_price];
        
        
                //加减按钮
                _reduce = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                _reduce.frame = CGRectMake(_price.frame.origin.x + _price.frame.size.width + 20, _price.frame.origin.y + 8, 16, 16);
                [_reduce setBackgroundImage:[UIImage imageNamed:@"cart_cutBtn_nomal@2x"] forState:UIControlStateNormal];
        
        [_reduce addTarget:self action:@selector(minus:) forControlEvents:UIControlEventTouchUpInside];
        
        
                [_reduce setHidden:YES];
        
//                reduce.tag = [spuId intValue] + indexPath.row;
                [self.contentView addSubview:_reduce];
                //个数
        
                _count2 = [[UILabel alloc]initWithFrame:CGRectMake(_reduce.frame.size.width + _reduce.frame.origin.x, _reduce.frame.origin.y, _price.frame.size.width - 16, _reduce.frame.size.height)];
                _count2.textColor = [UIColor redColor];
//                count.tag = [spuId intValue] + 3000 + indexPath.row;
                _count2.textAlignment = NSTextAlignmentCenter;
                [self.contentView addSubview:_count2];
        
        
        
                //加号按钮
                _add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                _add.frame = CGRectMake(_count2.frame.origin.x + _count2.frame.size.width , _count2.frame.origin.y , 16, 16);
                [_add setBackgroundImage:[UIImage imageNamed:@"cart_addBtn_nomal@2x"] forState:UIControlStateNormal];
//                add.tag = [spuId intValue] + indexPath.row + 100000;
                [_add addTarget:self action:@selector(plus:) forControlEvents:UIControlEventTouchUpInside];
                
                [self.contentView addSubview:_add];
        
//        self.amount = [self.count2.text integerValue];
        
    }
    return self;
    
}

- (void)plus:(UIButton *)sender {
    
    self.amount =[self.count2.text intValue];
    self.amount += 1;
    
    self.plusBlock(self.amount,self.productId,YES);
    
    [self showOrderNumbers:self.amount];
    
}
- (void)minus:(UIButton *)sender {
    
    self.amount =[self.count2.text intValue];
    self.amount -= 1;
    
    self.plusBlock(self.amount,self.productId,NO);
    
    [self showOrderNumbers:self.amount];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
        
}


-(void)showOrderNumbers:(NSUInteger)count
{
    _count2.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.amount];
    if (self.amount > 0)
    {
        [self.reduce setHidden:NO];
        [self.count2 setHidden:NO];
    }
    else
    {
        [self.reduce setHidden:YES];
        [self.count2 setHidden:YES];
    }
}


-(void)setmaintablecell:(NSDictionary *)dic{
    
    
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"imgUrl"]]] placeholderImage:[UIImage imageNamed:@"defalut_4_5.jpg"]];
    
    self.label.text = [NSString stringWithFormat:@"%@ %@",[dic valueForKey:@"itemBrand"],[dic valueForKey:@"itemName"]];
    
    
    NSString *priceItem = [NSString stringWithFormat:@"%@",[dic valueForKey:@"itemPrice"]];
    
    self.price.text = [NSString stringWithFormat:@"￥%.2f",[priceItem floatValue] / 100];

}


-(void)showOrderNumberTwos:(NSUInteger)count
{
   
    if (count > 0)
    {
        [self.reduce setHidden:NO];
        [self.count2 setHidden:NO];
    }
    else
    {
        [self.reduce setHidden:YES];
        [self.count2 setHidden:YES];
    }
}

@end
