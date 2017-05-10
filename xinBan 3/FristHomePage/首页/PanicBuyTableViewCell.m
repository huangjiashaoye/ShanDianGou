//
//  PanicBuyTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "PanicBuyTableViewCell.h"

@implementation PanicBuyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        

        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(8, 0.04 * KScreenWidth, KScreenWidth * 0.4 , 0.06 * KScreenWidth)];
        
        [image setImage:[UIImage imageNamed:@"brainBuy"]];
        [self.contentView addSubview:image];
        
        UIImageView *time = [[UIImageView alloc]initWithFrame:CGRectMake(image.frame.size.width + image.frame.origin.x + 15, image.frame.origin.y + 0.001 * KScreenWidth, 0.054 * KScreenWidth, 0.058 * KScreenWidth)];
        
        [time setImage:[UIImage imageNamed:@"time_pic"]];
        [self.contentView addSubview:time];
        
        //
        UILabel *month = [[UILabel alloc]initWithFrame:CGRectMake(time.frame.size.width + time.frame.origin.x , time.frame.origin.y + 2, 0.5 * KScreenWidth, time.frame.size.height)];
        
        month.text = @"   月   日早   点开抢!";
        month.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:15.0F];
        
        [self.contentView addSubview:month];
        
        
        
        UIButton *bg = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        bg.frame = CGRectMake(time.frame.size.width + time.frame.origin.x + 3, month.frame.origin.y + 2, time.frame.size.height , time.frame.size.height* 0.76);
        [bg setBackgroundImage:[UIImage imageNamed:@"Black_BG"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:bg];
        
        UIButton *bg1 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        bg1.frame = CGRectMake(bg.frame.size.width + bg.frame.origin.x + 20, month.frame.origin.y + 2, time.frame.size.height , time.frame.size.height* 0.76);
        [bg1 setBackgroundImage:[UIImage imageNamed:@"Black_BG"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:bg1];
        
        UIButton *bg2 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        bg2.frame = CGRectMake(bg1.frame.size.width + bg1.frame.origin.x + 3 + 32, month.frame.origin.y + 2, time.frame.size.height , time.frame.size.height* 0.76);
        [bg2 setBackgroundImage:[UIImage imageNamed:@"Black_BG"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:bg2];
        
        NSString *urlString = [NSString stringWithFormat:@"%@WebAdvertising",LinkerAddress];
        PostUrl_view *postUrl = [[PostUrl_view alloc]init];
        [postUrl PostGetAdvertisingTime:urlString];
        
        postUrl.UrlStrAry =^(NSArray *Count){
            
           
            NSDictionary *dic = [Count valueForKey:@"msg"];
           
            
            
            [bg setTitle:[NSString stringWithFormat:@"%@",[dic valueForKey:@"Month"]] forState:UIControlStateNormal];
            [bg1 setTitle:[NSString stringWithFormat:@"%@",[dic valueForKey:@"Day"]] forState:UIControlStateNormal];
            [bg2 setTitle:[NSString stringWithFormat:@"%@",[dic valueForKey:@"Hour"]] forState:UIControlStateNormal];
            [bg setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [bg1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [bg2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        };

        
        
        
    }
    return self;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
