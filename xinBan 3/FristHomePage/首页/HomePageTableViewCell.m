//
//  HomePageTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "HomePageTableViewCell.h"




@implementation HomePageTableViewCell


-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier


{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //建立pageview

     
        NSString *urlString = [NSString stringWithFormat:@"%@WebAdvertising",LinkerAddress];
        PostUrl_view *postUrl = [[PostUrl_view alloc]init];
        [postUrl postRequestAction:urlString SaleChannelId:@"1" TopIndex:@"0" PageIndex:@"0" PageSize:@"0"];
        
        postUrl.UrlStrAry =^(NSArray *Count){
            
        NSMutableArray  *array = [NSMutableArray array];
            NSMutableArray *linkUrlAry = [NSMutableArray array];
            
            if ([[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]] isEqualToString:@"获取信息失败!"]) {
                _images = @[@"defalut_4_5.jpg",@"defalut_4_5.jpg"];
                
                
                // 创建不带标题的图片轮播器
                SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,KScreenWidth, SDCollectionView) imagesGroup:_images];
                cycleScrollView.delegate = self;
                
                cycleScrollView.TopMap =^(NSInteger count){
                    
                    
                    self.TopCellMap(_Link_images[count]);
                    
                };
                
                //cycleScrollView.autoScrollTimeInterval = 2.0;
                [self addSubview:cycleScrollView];
                
                
            }else{
            
        for (NSDictionary *map in Count) {
            
            
        NSString *str = [NSString stringWithFormat:@"%@",[map valueForKey:@"PicUrl"]];
            
        NSString *LinkUrl = [NSString stringWithFormat:@"%@",[map valueForKey:@"LinkUrl"]];
   
        [array addObject:str];
        [linkUrlAry addObject:LinkUrl];
            
        }
            
            
            
        _images = array;
        
    //    _images = @[@"Gg_view",@"Gg_view"];
            // 创建不带标题的图片轮播器
            SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,KScreenWidth, SDCollectionView) imagesGroup:_images];
            cycleScrollView.delegate = self;
            
            cycleScrollView.TopMap =^(NSInteger count){
                
                
                self.TopCellMap(_Link_images[count]);
                
            };
            
                //cycleScrollView.autoScrollTimeInterval = 2.0;
                [self addSubview:cycleScrollView];
        }

        
        
            

            
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

#pragma mark - post请求
 - (void)postRequestAction {
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
     

    NSString *urlString = [NSString stringWithFormat:@"%@WebAdvertising",LinkerAddress];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
     
    [dict setObject:@"0" forKey:@"SaleChannelId"];
    [dict setObject:@"0" forKey:@"TopIndex"];
    [dict setObject:@"0" forKey:@"PageIndex"];
    [dict setObject:@"0" forKey:@"PageSize"];
     
        // 参数1: url
         // 参数2: body体
         [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
             
 
             
              //   self.TopCell(1.00);
             
             } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
                 NSArray *arrayMap = responseObject;
                 
              NSMutableArray  *array = [NSMutableArray array];
                 
              for (NSDictionary *map in arrayMap) {
 
              NSString *str = [NSString stringWithFormat:@"%@",[map valueForKey:@"PicUrl"]];
              [array addObject:str];
                 
                 }
                 
                 _images = array;
                
                 // 创建不带标题的图片轮播器
                 SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,KScreenWidth, SDCollectionView) imagesGroup:_images];
                 cycleScrollView.delegate = self;
                 
                 cycleScrollView.TopMap =^(NSInteger count){
                     
                     NSDictionary *dic = _images[count];
                     
                     self.TopCellMap(dic);
                     
                 };
                 
                 //cycleScrollView.autoScrollTimeInterval = 2.0;
                 [self addSubview:cycleScrollView];

                 
                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     
                         NSLog(@"post请求失败:%@", error);
                     
                     }];
     }

@end
