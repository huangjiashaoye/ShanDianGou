//
//  Regist_two_ViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/13.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Regist_two_ViewController.h"

@interface Regist_two_ViewController ()<UITextFieldDelegate>

@end

@implementation Regist_two_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
    [self Top_View];
    [self Top_Second_View];
    [self TopThird_View];
    
    
    UITextField *phone_text = (UITextField *)[self.view viewWithTag:5200];
    
    UITextField *pass_text = (UITextField *)[self.view viewWithTag:5201];
    
    phone_text.text = [NSString stringWithFormat:@"%@",self.Phone_text];
    
    pass_text.text = [NSString stringWithFormat:@"%@",self.pass_text];
}


//
-(void)TopThird_View
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight + 94 + 10, KScreenWidth, KScreenHeight - (0.112 * KScreenHeight + 94 + 10))];
    
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    NSArray *ary = @[@"手机号码",@"登陆密码",@"省、市、区",@"详细地址",@"营业时间"];
    
    NSArray *aryPlace =@[@"登录时使用的手机号码",@"字母、数字、符号组合",@"省市区",@"详细地址",@"示例 ： 9:00 ～ 18:00"];
    
    for (int i = 0; i < ary.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50 * i + 6, KScreenWidth * 0.24, 40)];
        label.text = [NSString stringWithFormat:@"%@",ary[i]];
        label.font = [UIFont systemFontOfSize:14.5f];
        
        [view addSubview:label];
        
        UITextField *textFeild = [[UITextField alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, label.frame.origin.y, KScreenWidth - (label.frame.size.width + label.frame.origin.x + 0.05 * KScreenWidth), 40)];
        textFeild.tag = 5200 + i;
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


-(void)Top_Second_View
{
    UIImageView *top = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth,94)];
    [top setImage:[UIImage imageNamed:@"Check_Information"]];
    [self.view addSubview:top];
}

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"用户注册"];
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
    [next addTarget:self action:@selector(touchup:) forControlEvents:UIControlEventTouchUpInside];
    
    [next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:next];
}


-(void)touchup:(UIButton *)sender
{

}

-(void)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
