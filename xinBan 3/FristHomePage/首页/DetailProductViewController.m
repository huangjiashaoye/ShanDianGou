//
//  DetailProductViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/5.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "DetailProductViewController.h"

@interface DetailProductViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DetailProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
 
    Top_View_BG *top = [[Top_View_BG alloc]init];
    [top TopView:self.view str:@""];
    
    
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
