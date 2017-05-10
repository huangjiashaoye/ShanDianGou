//
//  MeselfPageViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "MeselfPageViewController.h"

@interface MeselfPageViewController ()<UIScrollViewDelegate>
{
    UIScrollView *meselfScrollView;
    UIImageView *topImg;
    UILabel *nameLabe;
    
    
}

@end

@implementation MeselfPageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    //创建底层界面
    [self creatScrollView];
    [self addCellView];
}



-(void)creatScrollView
{
    meselfScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -20)];
    meselfScrollView.delegate = self;
    meselfScrollView.contentSize = CGSizeMake(KScreenWidth, KScreenHeight);
    meselfScrollView.showsVerticalScrollIndicator = NO;
    meselfScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:meselfScrollView];
    
    
}


//添加控件
-(void)addCellView
{
    topImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight * 0.33)];
    [topImg setImage:[UIImage imageNamed:@"bg_ground"]];
    [meselfScrollView addSubview:topImg];
    
    
    //底色
    UIView *view  = [[UIView alloc]initWithFrame:CGRectMake(0, topImg.frame.size.height + topImg.frame.origin.y, KScreenWidth, KScreenHeight + (topImg.frame.size.height + topImg.frame.origin.y))];
    view.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0f];
    [meselfScrollView addSubview:view];
    
    

    
    [self whiteButtonView];
    [self appLogo];
}

//头像
-(void)appLogo{
    UIButton *logo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logo.frame = CGRectMake(0.4 * KScreenWidth, 0.13 * KScreenWidth, 0.2 * KScreenWidth, 0.2 * KScreenWidth);
    [logo setBackgroundImage:[UIImage imageNamed:@"1004.jpg"] forState:UIControlStateNormal];
    logo.layer.masksToBounds = YES;
    logo.layer.cornerRadius = logo.frame.size.width / 2.0;
    logo.layer.borderWidth = 4.0f;
    logo.layer.borderColor = [UIColor whiteColor].CGColor;
    [logo addTarget:self action:@selector(logo:) forControlEvents:UIControlEventTouchUpInside];
    [meselfScrollView addSubview:logo];
    

    nameLabe = [[UILabel alloc]initWithFrame:CGRectMake(10, logo.frame.size.height + logo.frame.origin.y + 5 , KScreenWidth - 20, 24)];
    nameLabe.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserAccount"]];
    
    nameLabe.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:17.0F];
    nameLabe.textColor = [UIColor whiteColor];
    nameLabe.textAlignment = NSTextAlignmentCenter;
    [meselfScrollView addSubview:nameLabe];
    
    //地址 电话
    UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(10, nameLabe.frame.size.height + nameLabe.frame.origin.y + 8 , KScreenWidth - 20, 24)];
    address.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"DetailAddress_pic"]];
    address.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:15.0F];
    address.textColor = [UIColor whiteColor];
    address.textAlignment = NSTextAlignmentCenter;
    [meselfScrollView addSubview:address];
    
    UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake(10, address.frame.size.height + address.frame.origin.y , KScreenWidth - 20, 24)];
    
    NSString *userPhone = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserPhone"]];
    
    
    NSRange range = NSMakeRange(0, 4);
    NSRange rangeOne = NSMakeRange(4, 4);
    NSRange rangeTwo = NSMakeRange(8, 3);
    
    NSString *strge = [userPhone substringWithRange:range];
    NSString *strgeOne = [userPhone substringWithRange:rangeOne];
    NSString *strgeTwo = [userPhone substringWithRange:rangeTwo];
    
    
    phone.text = [NSString stringWithFormat:@"T:%@-%@-%@",strge,strgeOne,strgeTwo];
    
    
    phone.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:15.0F];
    phone.textColor = [UIColor whiteColor];
    phone.textAlignment = NSTextAlignmentCenter;
    [meselfScrollView addSubview:phone];
    
    UIButton *setLeft = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    setLeft.frame = CGRectMake(0.85 * KScreenWidth, 0.15 * KScreenHeight, 24, 24);
    
    [setLeft addTarget:self action:@selector(setLeft:) forControlEvents:UIControlEventTouchUpInside];
    [setLeft setBackgroundImage:[UIImage imageNamed:@"setLeft"] forState:UIControlStateNormal];
    [meselfScrollView addSubview:setLeft];
    
}

-(void)setLeft:(UIButton *)sender
{
    self.hidesBottomBarWhenPushed=YES;
    
    SetUpOneViewController *clas = [[SetUpOneViewController alloc]init];
    
    [self.navigationController pushViewController:clas animated:NO];
    
    self.hidesBottomBarWhenPushed=NO;
}

//头像设置
-(void)logo:(UIButton *)sender
{
    NSLog(@"头像设置");
}


-(void)whiteButtonView
{
    
    NSArray *Img = @[@"SetUpOne",@"OrderPicOne",@"SignBtn_bg",@"message_bg",@"children_bg",@"KeFuOne"];
    NSArray *title = @[@"店铺设置",@"发货订单",@"签到有礼",@"消息中心",@"走失儿童登记",@"联系我们"];
    
    for (int i = 0; i < Img.count / 3; i++) {
        for (int j = 0; j < 3; j ++) {
            
            UIButton *white = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            white.frame = CGRectMake((KScreenWidth / 3) * j, (topImg.frame.size.height + topImg.frame.origin.y ) + (KScreenWidth ) / 3 * i, (KScreenWidth) / 3 - 1, (KScreenWidth) / 3 - 1);
            
            white.backgroundColor = [UIColor whiteColor];
            [white addTarget:self action:@selector(whiteButton:) forControlEvents:UIControlEventTouchUpInside];
            white.tag = 4*i+j;
            [meselfScrollView addSubview:white];
            
       //     [white setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",Img[4*i+j]]] forState:UIControlStateNormal];
            
            //小图标按钮
            UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake((0.33333 * KScreenWidth - 0.086 * KScreenWidth)*0.5, 0.06 * KScreenHeight,0.086 * KScreenWidth, 0.086 * KScreenWidth)];
            [icon setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",Img[3*i+j]]]];
            [white addSubview:icon];
            //字体
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.08 * KScreenHeight + 0.08125 * KScreenWidth,(KScreenWidth) / 3 - 1 , 0.08125 * KScreenWidth)];
            
            label.text = [NSString stringWithFormat:@"%@",title[3*i+j]];
            
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont fontWithName:@"Arial" size:12.0f];
            
            [white addSubview:label];
            
        }
    }
    
}

-(void)whiteButton:(UIButton *)sender
{

    NSLog(@"%ld",(long)sender.tag);
    
     if (sender.tag == 0) {
         
         [SKAutoHideMessageView showMessage:@"正在玩命开发中，敬请期待！！！" inView:self.view];
         return;
     }
    
    if (sender.tag == 1) {
        
        [SKAutoHideMessageView showMessage:@"正在玩命开发中，敬请期待！！！" inView:self.view];
        return;

    }
    
    if (sender.tag == 2) {
        
        self.hidesBottomBarWhenPushed=YES;
        
        Sign_ViewController *clas = [[Sign_ViewController alloc]init];
        
        [self.navigationController pushViewController:clas animated:NO];
        
        self.hidesBottomBarWhenPushed=NO;
    }

    if (sender.tag == 4) {
        self.hidesBottomBarWhenPushed=YES;
        
        MessageCentViewController *clas = [[MessageCentViewController alloc]init];
        
        [self.navigationController pushViewController:clas animated:NO];
        
        self.hidesBottomBarWhenPushed=NO;
    }
    
    if (sender.tag == 5) {
        
        [SKAutoHideMessageView showMessage:@"正在玩命开发中，敬请期待！！！" inView:self.view];
        return;

    }
    
    if (sender.tag == 6) {
        
        self.hidesBottomBarWhenPushed=YES;
        
        TalkUsOneViewController *clas = [[TalkUsOneViewController alloc]init];
        
        [self.navigationController pushViewController:clas animated:NO];
        
        self.hidesBottomBarWhenPushed=NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}




@end
