//
//  Forget_two_ViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/13.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Forget_two_ViewController.h"

@interface Forget_two_ViewController ()<UITextFieldDelegate>

@end

@implementation Forget_two_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
    [self Top_View];
    [self Top_Second_View];
    [self TopThird_View];
}

//
-(void)TopThird_View
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight + 94 + 10, KScreenWidth, KScreenHeight - (0.112 * KScreenHeight + 94 + 10))];
    
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    NSArray *ary = @[@"密码",@"验证码"];
    
    NSArray *aryPlace =@[@"字母／数字／符号组合",@"再次输入"];
    
    for (int i = 0; i < ary.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50 * i + 6, KScreenWidth * 0.24, 40)];
        label.text = [NSString stringWithFormat:@"%@",ary[i]];
        label.font = [UIFont systemFontOfSize:14.5f];
        
        [view addSubview:label];
        
        UITextField *textFeild = [[UITextField alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, label.frame.origin.y, KScreenWidth - (label.frame.size.width + label.frame.origin.x + 0.05 * KScreenWidth), 40)];
        textFeild.tag = 100+i;
        textFeild.borderStyle = UITextBorderStyleNone;
        textFeild.delegate = self;
        textFeild.placeholder = [NSString stringWithFormat:@"%@",aryPlace[i]];
        [view addSubview:textFeild];
        
        //
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x, textFeild.frame.origin.y + textFeild.frame.size.height + 4.5, textFeild.frame.size.width + label.frame.size.width, 0.5f)];
        
        line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
        
        [view addSubview:line];
    }
    
    
}


-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"忘记密码"];
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(10, 0.1 * KScreenWidth - 3, 30, 30);
    [back setBackgroundImage:[UIImage imageNamed:@"back_pic_view.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    //下一步
    UIButton *next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    next.frame = CGRectMake(KScreenWidth - 65, 0.1 * KScreenWidth, 50, 30);
    [next setTitle:@"提交" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:next];
}


-(void)nextClick:(UIButton *)sender
{
    UITextField *text_0 = (UITextField *)[self.view viewWithTag:100];
    UITextField *text_1 = (UITextField *)[self.view viewWithTag:101];

    

    
    if ([text_0.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"密码不能为空" inView:self.view];
        
        return;
    }
    
    if (text_0.text.length < 6) {
        [SKAutoHideMessageView showMessage:@"密码至少6位" inView:self.view];
        
        return;
    }
    
    if ([text_0.text isEqualToString:text_1.text]) {
        
        
        
    }else{
    
        [SKAutoHideMessageView showMessage:@"两次密码输入不一致" inView:self.view];
        
        return;
        
    }
    

    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    
    
    
    [Post PostUpdatepassword:urlString Phone:self.Phone Password:text_1.text view:self.view];
    
    Post.UrlStrAry =^(NSArray *Count){
        
        
        
        if ([[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]] isEqualToString:@"ok"]) {
            
            Sign_one_ViewController *sign = [[Sign_one_ViewController alloc]init];
            sign.Sign = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
            sign.Sign_type = @"Sign_type";
            [self presentViewController:sign animated:YES completion:nil];
            
        }else{
            
            [SKAutoHideMessageView showMessage:@"修改失败" inView:self.view];
            
        }
        
        
        
    };
    

    
    

    
    
}

-(void)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)Top_Second_View
{
    UIImageView *top = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, 94)];
    [top setImage:[UIImage imageNamed:@"check_password"]];
    [self.view addSubview:top];
}


@end
