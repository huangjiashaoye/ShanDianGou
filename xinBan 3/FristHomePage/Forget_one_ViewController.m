//
//  Forget_one_ViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/13.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Forget_one_ViewController.h"

@interface Forget_one_ViewController ()<UITextFieldDelegate>
{
    UIButton *button;
    int time;
    NSTimer *timer;
    NSString *Code;
}
@end

@implementation Forget_one_ViewController


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
    
    NSArray *ary = @[@"手机号码",@"验证码"];
    
    NSArray *aryPlace =@[@"登录时使用的手机号码",@""];
    
    for (int i = 0; i < ary.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50 * i + 6, KScreenWidth * 0.24, 40)];
        label.text = [NSString stringWithFormat:@"%@",ary[i]];
        label.font = [UIFont systemFontOfSize:14.5f];
        
        [view addSubview:label];
        
        UITextField *textFeild = [[UITextField alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, label.frame.origin.y, KScreenWidth - (label.frame.size.width + label.frame.origin.x + 0.05 * KScreenWidth), 40)];
        textFeild.tag = 520000 + i;
        textFeild.borderStyle = UITextBorderStyleNone;
        textFeild.delegate = self;
        textFeild.placeholder = [NSString stringWithFormat:@"%@",aryPlace[i]];
        [view addSubview:textFeild];
        
        //
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x, textFeild.frame.origin.y + textFeild.frame.size.height + 4.5, textFeild.frame.size.width + label.frame.size.width, 0.5f)];
        
        line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
        
        [view addSubview:line];
        
        if (i == 1) {
            
            button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            button.frame = CGRectMake(KScreenWidth - 87.5 - 31, textFeild.frame.origin.y + (textFeild.frame.size.height - 31)*0.5, 87.5, 31);
            
            [button setBackgroundImage:[UIImage imageNamed:@"code_bg"] forState:UIControlStateNormal];
            
            [button setTitle:@"获取验证码" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(CodeCheck:) forControlEvents:UIControlEventTouchUpInside];
            
            [view addSubview:button];
            
        }

        
    }
    
    
}


-(void)CodeCheck:(UIButton *)sender
{
    
    //添加点击事件的条件限制
    UITextField *Phone_text = (UITextField *)[self.view viewWithTag:520000];
    
    if ([Phone_text.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"请填写注册手机号码" inView:self.view];
        
        return;
    }
    
    if (Phone_text.text.length != 11) {
        [SKAutoHideMessageView showMessage:@"手机格式不正确" inView:self.view];
        
        return;
    }
    
    
      
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    
    
    [Post PostSendCode_Forget:urlString Phone:Phone_text.text UserAccount:Phone_text.text view:self.view];
    
    
    Post.UrlStrAry =^(NSArray *Count){
        
       
        Code = [NSString stringWithFormat:@"%@",[Count valueForKey:@"Code"]];
        if ([[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]isEqualToString:@"ok"]) {
            
            time = 120;
            timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(ation:) userInfo:nil repeats:YES];
            
            [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
        }else{
            
            [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]] inView:self.view];
        }
        
    };
    
    
    
    
}

-(void)ation:(NSTimer *)sender
{
    time--;
    
    
    [button setTitle:[NSString stringWithFormat:@"%d S",time] forState:UIControlStateNormal];
    button.userInteractionEnabled = NO;
    if (time == 0) {
        [timer invalidate];
        timer = nil;
        button.userInteractionEnabled = YES;
        [button setTitle:@"获取验证码" forState:UIControlStateNormal];
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
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:next];
}


-(void)nextClick:(UIButton *)sender
{
   
    //核对验证码
    UITextField *code_text = (UITextField *)[self.view viewWithTag:520001];
    
    if ([[NSString stringWithFormat:@"%@",code_text.text] isEqualToString:Code]) {
        
        
        UITextField *Phone_text = (UITextField *)[self.view viewWithTag:520000];

    
        Forget_two_ViewController *clas = [[Forget_two_ViewController alloc]init];
        clas.Phone = Phone_text.text;
        [self presentViewController:clas animated:YES completion:nil];
            

        
    }else{
        [SKAutoHideMessageView showMessage:@"验证码不正确，请重新输入" inView:self.view];
    }
    

    

    
    
    
}


-(void)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)Top_Second_View
{
    UIImageView *top = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, 94)];
    [top setImage:[UIImage imageNamed:@"check_phone_password"]];
    [self.view addSubview:top];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
