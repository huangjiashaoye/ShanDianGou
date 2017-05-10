//
//  Sign_one_ViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/11.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Sign_one_ViewController.h"

@interface Sign_one_ViewController ()<UITextFieldDelegate,MBProgressHUDDelegate>

@end

@implementation Sign_one_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bg_logoin];
    [self CreatUI];
    
    NSString *str = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"UserCount"]];
    

    if ([self.ComeInge isEqualToString:@"Sign_one_ViewController"]) {
    }else{
    if (![str isEqualToString:@"(null)"]) {
      [self logn_motal];
      }
    }
    
    if ([self.Sign_type isEqualToString:@"Sign_type"]) {
        
        [SKAutoHideMessageView showMessage:self.Sign inView:self.view];
        
    }
}

-(void)bg_logoin
{
    UIImageView *bg_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
    [bg_view setImage:[UIImage imageNamed:@"Login_in_bg2"]];
    [self.view addSubview:bg_view];
    
    UIImageView *Top_logo = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth * 0.35, 0.1 * KScreenHeight, 0.3 * KScreenWidth, 0.31 * KScreenWidth)];
    
    [Top_logo setImage:[UIImage imageNamed:@"top_logo"]];
    [self.view addSubview:Top_logo];
    
    

}

-(void)CreatUI
{
    NSArray *ary = @[@"preson_logo2",@"Password_pg2"];
    NSArray *titAry = @[@"用户名／手机号",@"密码"];
    for (int i = 0; i < ary.count; i++) {
        UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0.38 * KScreenHeight + 50 * i, 20, 20)];
        [logo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",ary[i]]]];
        [self.view addSubview:logo];
        
        //
        UITextField *textFeild = [[UITextField alloc]initWithFrame:CGRectMake(logo.frame.origin.x + logo.frame.size.width + 10, logo.frame.origin.y, KScreenWidth * 0.8, logo.frame.size.height)];
        textFeild.delegate = self;
        textFeild.borderStyle = UITextBorderStyleNone;
        textFeild.placeholder = [NSString stringWithFormat:@"%@",titAry[i]];
        
        [textFeild setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        textFeild.textColor = [UIColor whiteColor];
        textFeild.tag = 120 + i;
        [textFeild setValue:[UIFont systemFontOfSize:15.0f] forKeyPath:@"_placeholderLabel.font"];
        
        [self.view addSubview:textFeild];
        
        //
        
        UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(logo.frame.origin.x, logo.frame.origin.y + logo.frame.size.height +5, KScreenWidth - 2 * logo.frame.origin.x, 6)];
        [line setImage:[UIImage imageNamed:@"line_bg2"]];
        
        [self.view addSubview:line];
     
        
    if (i == 1) {
        
     textFeild.secureTextEntry = YES;
     UIButton *btn_logn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn_logn.frame = CGRectMake(line.frame.origin.x, line.frame.origin.y + 0.05 * KScreenHeight, line.frame.size.width, 45);
    btn_logn.backgroundColor = [UIColor colorWithRed:235/255.0 green:142/255.0 blue:10/255.0 alpha:1.0f];
            
    [btn_logn setTitle:@"登录" forState:UIControlStateNormal];
    [btn_logn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_logn addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
    [self.view addSubview:btn_logn];
        
        }
        
    }
    
    NSArray *Two_Btn = @[@"用户注册",@"忘记密码"];
    for (int i = 0; i < Two_Btn.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if (i == 0) {
            btn.frame = CGRectMake(10 , KScreenHeight - 50, 80, 50);
            
        }else{
        btn.frame = CGRectMake(KScreenWidth - 10 - 80, KScreenHeight - 50, 80, 50);
            
        }

        [btn setTitle:[NSString stringWithFormat:@"%@",Two_Btn[i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 200 + i;
        [self.view addSubview:btn];
        
        
        
    }
    
}


-(void)btnClick:(UIButton *)sender
{
    if (sender.tag == 200) {
        Regist_one_ViewController *clas = [[Regist_one_ViewController alloc]init];
        
        [self presentViewController:clas animated:YES completion:nil];
    }
 
    
    if (sender.tag == 201) {
        Forget_one_ViewController *clas = [[Forget_one_ViewController alloc]init];
        
        [self presentViewController:clas animated:YES completion:nil];
    }
    
}


-(void)button:(UIButton *)sender
{
    
    UITextField *textField = (UITextField *)[self.view viewWithTag:120];
    
    UITextField *textField2 = (UITextField *)[self.view viewWithTag:121];
    
   
    //存储账号密码
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",textField.text] forKey:@"UserCount"];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",textField2.text] forKey:@"UserPassWord"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    if ([[NSString stringWithFormat:@"%@",textField.text] isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"请输入账号" inView:self.view];
        
        return;
    }
    if ([[NSString stringWithFormat:@"%@",textField2.text] isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"请输入密码" inView:self.view];
        return;
    }
    
    NSString *urlString = @"http://112.124.9.13:8088/Api/Vendor";
    
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    [postUrl postLogin:urlString UserAccount:[NSString stringWithFormat:@"%@",textField.text] Password:[NSString stringWithFormat:@"%@",textField2.text]];
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
    
        
    
        
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",[Count valueForKey:@"Name"]] forKey:@"UserAccount"];
    
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",[Count valueForKey:@"Phone"]] forKey:@"UserPhone"];
        
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",[Count valueForKey:@"Id"]] forKey:@"UserId"];
        
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",[Count valueForKey:@"DetailAddress"]] forKey:@"DetailAddress_pic"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        KuaiLaiViewController *tabBar = [[KuaiLaiViewController alloc] init];
    
        [self presentViewController:tabBar animated:NO completion:nil];
        
    
    };
  
    //登陆失败
    postUrl.UrlStrFail =^(NSString *Count){
        
        
        [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",Count] inView:self.view];
        
        
    };
    
    
    
 
}

//自动登录
-(void)logn_motal{


    UITextField *textField = (UITextField *)[self.view viewWithTag:120];
    
    UITextField *textField2 = (UITextField *)[self.view viewWithTag:121];
    


    NSString *strLd = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"UserCount"]];
    NSString *strLp = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"UserPassWord"]];
    
    if (![strLd isEqualToString:@"(null)"]) {
        
        textField.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserCount"]];
    
    
    if (![strLp isEqualToString:@"(null)"]) {
        
          textField2.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserPassWord"]];
        
        //

        
        NSString *urlString = @"http://112.124.9.13:8088/Api/Vendor";
        
        PostUrl_view *postUrl = [[PostUrl_view alloc]init];
        
        [postUrl postLogin:urlString UserAccount:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserCount"]] Password:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserPassWord"]]];
        
    

        
        postUrl.UrlStrAry =^(NSArray *Count){
            
           
            
            [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",[Count valueForKey:@"Name"]] forKey:@"UserAccount"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",[Count valueForKey:@"Phone"]] forKey:@"UserPhone"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",[Count valueForKey:@"Id"]] forKey:@"UserId"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            KuaiLaiViewController *tabBar = [[KuaiLaiViewController alloc] init];
            
            [self presentViewController:tabBar animated:NO completion:nil];
            
            
        };
        
        //登陆失败
        postUrl.UrlStrFail =^(NSString *Count){
            
            
            [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",Count] inView:self.view];
            
            
        };

        
        //
       }
    
    }
    
    

    
}


-(void)Motaol_logo
{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
@end
