//
//  SetUpOneViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/8.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "SetUpOneViewController.h"

@interface SetUpOneViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITableView *ListView;
    NSArray *SetAry;
}

@end

@implementation SetUpOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SetAry = @[@"基本信息",@"结算信息",@"营业配送",@"地址管理"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self Top_View];
    [self creaTList];
    [self ChangeName];
}

-(void)ChangeName
{
    UIButton *ChangeBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ChangeBack.frame = CGRectMake(0, 0.92 * KScreenHeight, KScreenWidth, 0.08 * KScreenHeight);
    
    [ChangeBack setTitle:@"退出当前账号" forState:UIControlStateNormal];
    [ChangeBack setBackgroundColor:[UIColor colorWithRed:231/255.0 green:72/255.0 blue:53/255.0 alpha:1.0f]];
    [ChangeBack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ChangeBack addTarget:self action:@selector(changeBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ChangeBack];
    
}

-(void)changeBack:(UIButton *)sender
{
    Sign_one_ViewController *sign = [[Sign_one_ViewController alloc]init];
    sign.ComeInge = @"Sign_one_ViewController";
    [self presentViewController:sign animated:YES completion:nil];
    
}


-(void)creaTList{

    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, (0.9 - 0.08) * KScreenHeight)];
    ListView.separatorStyle = NO;
    ListView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:0.6f];
    [ListView registerClass:[SetUpOneTableViewCell class] forCellReuseIdentifier:@"SetUpOneCell"];
    
}


-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"店铺信息"];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SetAry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SetUpOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SetUpOneCell" forIndexPath:indexPath];
    cell.labelName.text = [NSString stringWithFormat:@"%@",SetAry[indexPath.section]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SetUpOneTableViewCellHeight;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if (indexPath.section == 3) {
        
        self.hidesBottomBarWhenPushed=YES;
        
        AddressListViewController *clas = [[AddressListViewController alloc]init];
        
        [self.navigationController pushViewController:clas animated:NO];
        
        self.hidesBottomBarWhenPushed=YES;
    }else{
    
 
            [SKAutoHideMessageView showMessage:@"正在玩命开发中，敬请期待！！！" inView:self.view];

    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.5f;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (UITableViewCellEditingStyleDelete);
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (YES);
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
