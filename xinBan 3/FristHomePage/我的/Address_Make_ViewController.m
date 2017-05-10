//
//  Address_Make_ViewController.m
//  FristHomePage
//
//  Created by huangfu on 17/1/12.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Address_Make_ViewController.h"

@interface Address_Make_ViewController ()<UIGestureRecognizerDelegate,UITextFieldDelegate>

@end

@implementation Address_Make_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0f];
    [self Top_View];
    [self creatSearch];
}

-(void)creatSearch
{
    NSArray *ary = @[@"收货人姓名",@"手机号码",@"省市区",@"详细地址"];
    for (int i = 0; i < ary.count; i ++) {
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0.112 * KScreenHeight + (0.07 * KScreenHeight + 1.5) * i, KScreenWidth - 20, 0.07 * KScreenHeight)];
        textField.borderStyle = UITextBorderStyleNone;
        textField.delegate = self;
        textField.placeholder = [NSString stringWithFormat:@"%@",ary[i]];
        [self.view addSubview:textField];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y + textField.frame.size.height + 0.5, KScreenWidth - 20, 1.0f)];
        line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
        [self.view addSubview:line];
        
        if (i == 2) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            button.frame = CGRectMake(textField.frame.origin.x, textField.frame.origin.y, textField.frame.size.width, textField.frame.size.height);
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button];
            
        }
        
    }
    
    
}

-(void)buttonClick:(UIButton *)sender
{

}


-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"编辑地址"];
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(10, 0.1 * KScreenWidth - 3, 30, 30);
    [back setBackgroundImage:[UIImage imageNamed:@"back_pic_view.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    UIButton *sure_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sure_btn.frame = CGRectMake(KScreenWidth - 20 - 40, 0.065 * KScreenHeight, 40, 20);
    [sure_btn setTitle:@"保存" forState:UIControlStateNormal];
    [sure_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sure_btn addTarget:self action:@selector(sure_btn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sure_btn];
    
}


-(void)sure_btn:(UIButton *)sender
{

}

-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
