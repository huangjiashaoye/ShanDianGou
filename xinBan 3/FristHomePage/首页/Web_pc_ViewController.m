//
//  Web_pc_ViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/11.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Web_pc_ViewController.h"

@interface Web_pc_ViewController ()<UIGestureRecognizerDelegate>
{
    UIWebView *web_pc;
}

@end

@implementation Web_pc_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self Top_View];
    
    
    WKWebView *web = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, (1 - 0.112)* KScreenHeight)];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",self.LinkUrl]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    [self.view addSubview:web];


    
}

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"消息中心"];
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
