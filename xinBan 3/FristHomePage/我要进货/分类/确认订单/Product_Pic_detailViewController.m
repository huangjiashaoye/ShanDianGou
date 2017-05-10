//
//  Product_Pic_detailViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/16.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Product_Pic_detailViewController.h"

@interface Product_Pic_detailViewController ()<UIGestureRecognizerDelegate>

@end

@implementation Product_Pic_detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self Top_View];
    [self creatUI];
    [self PayBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)PayBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 0.8 * KScreenHeight, KScreenWidth - 40,  KScreenWidth * 0.13);
    [btn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Top_BG"]]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"立即付款" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
}

-(void)btnClick:(UIButton *)sender
{
    
    NSDictionary *dic = self.DetailAry[0];
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@PayMent",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    [Post PostPayOrder:urlString OrderNum:[NSString stringWithFormat:@"%@",[dic valueForKey:@"OrderNum"]] view:self.view];
    
    
    Post.UrlStrAry =^(NSArray *Count){

        
        NSString *Name = [NSString stringWithFormat:@"%@",[Count valueForKey:@"Name"]];
        if ([Name isEqualToString:@"支付宝"]) {
            
            NSString *appScheme = @"FristHomePage";
            // 跳转到掌上快来了
            [[AlipaySDK defaultService] payOrder:[NSString stringWithFormat:@"%@",[Count valueForKey:@"LinkUrl"]]fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                
                if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                    
                    
                    [SKAutoHideMessageView showMessage:@"支付成功" inView:self.view];
                    
                }
            }];

            
        }
        if ([Name isEqualToString:@"微信"]) {
         
//            
//            if (![WXApi isWXAppInstalled]) {
//                
//                [SKAutoHideMessageView showMessage:@"未安装微信" inView:self.view];
//                
//                return;
//                
//                
//            }
            
            NSDictionary *dict = [Count valueForKey:@"LinkUrl"];
//            NSDictionary *dict = [res valueForKey:@"Info"][0];
            
            if(dict != nil){
                NSMutableString *retcode = [dict objectForKey:@"retcode"];
                
                if (retcode.intValue == 0){
                    NSString *stamp  = [NSString stringWithFormat:@"%@",[dict objectForKey:@"timestamp"]];
                    
                    
                    //调起微信支付
                    PayReq* request  = [[PayReq alloc] init];
                    request.partnerId  =[NSString stringWithFormat:@"%@",[dict objectForKey:@"partnerid"]];
                    
                    request.prepayId            =[NSString stringWithFormat:@"%@", [dict objectForKey:@"prepayid"]];
                    
                    request.nonceStr            = [NSString stringWithFormat:@"%@",[dict objectForKey:@"noncestr"]];
                    
                    request.timeStamp           =stamp.intValue;
                    
                    NSString *str = @"Sign=WXPay";
                    request.package             = [NSString stringWithFormat:@"%@",str];
                    
                    request.sign                = [NSString stringWithFormat:@"%@",[dict objectForKey:@"sign"]];
                    
                    [WXApi sendReq:request];
                    //日志输出
                    
                    
                    return ;
                    
                }
            }

            
        }
        
      
        
        
     
        
    };
    
    
    
  
//
//    [[BudayangAPI sharedAPI].userService GetVendorWeiXinPaySignInfo:self.OrderNumber target:self action:@selector(GetVendorWeiXinPaySignInfo:)];

}

-(void)creatUI{

    NSArray *ary = @[@"订单编号：",@"支付方式：",@"收获验证码：",@"应付金额："];
    
    for (int i = 0; i < ary.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10 , 0.112 * KScreenHeight + 30 * i + 10,  0.3 * KScreenWidth, 20)];
        
        label.text = [NSString stringWithFormat:@"%@",ary[i]];

        [self.view addSubview:label];
 
        UILabel *OrderLabel = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width , label.frame.origin.y, 0.5 * KScreenWidth, 20)];
        
        
        
       
        
        NSDictionary *dic = self.DetailAry[0];
        
       
        [self.view addSubview:OrderLabel];
        
        OrderLabel.font = label.font = [UIFont systemFontOfSize:15.0f];
        
        if (i == 2 || i == 3) {
            OrderLabel.textColor = [UIColor redColor];
        }
        if (i == 0) {
            OrderLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"OrderNum"]];
        }
        if (i == 1) {
            OrderLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"PayTypeName"]];
        }
        if (i == 2) {
            OrderLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"OrderRandom"]];
        }
        if (i == 3) {
            OrderLabel.text = [NSString stringWithFormat:@"￥ %@",[dic valueForKey:@"ActualPayPrice"]];
        }
        
    }
    
    

}

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"支付订单"];
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(10, 0.1 * KScreenWidth - 3, 30, 30);
    [back setBackgroundImage:[UIImage imageNamed:@"back_pic_view.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
}

-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBarHidden = YES;
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    
    self.navigationController.navigationBarHidden = NO;
    
    [super viewWillDisappear:animated];
}


@end
