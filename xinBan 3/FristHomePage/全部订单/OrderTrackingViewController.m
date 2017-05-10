//
//  OrderTrackingViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "OrderTrackingViewController.h"

@interface OrderTrackingViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITableView * ListView ;
}

@end

@implementation OrderTrackingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
    
    [self Top_View];
    [self listView];
}

#pragma 创建tableview
-(void)listView{
    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight , KScreenWidth * 1, KScreenHeight - 0.112 * KScreenHeight)];
    ListView.separatorStyle = NO;
    //  ListView.userInteractionEnabled = NO;
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.backgroundColor = self.view.backgroundColor =[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0f];
    
    [ListView registerClass:[OrderTrackingTableViewCell class] forCellReuseIdentifier:@"OrderTrackingTableViewCell"];
    
    [ListView registerClass:[Tracking_ImgCellTableViewCell class] forCellReuseIdentifier:@"Tracking_ImgCellTableViewCell"];
    
}

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"订单追踪"];
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
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   if (indexPath.section == 0) {
        
        static NSString *cellID=@"OrderTrackingTableViewCell";
        OrderTrackingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
        cell.OrderNumber.text = @"订单编号：123456789000987623";
        
        cell.OrderSucee.text = @"当前状态：已完成";
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

   }else{
   
   
       static NSString *cellID=@"Tracking_ImgCellTableViewCell";
       Tracking_ImgCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
       
    
       [cell.location_red setImage:[UIImage imageNamed:@"Location_red"]];
       if (indexPath.section != 4) {
           [cell.line setImage:[UIImage imageNamed:@"line2_red"]];
       }
      
       cell.Name.text = @"订单已送达,感谢您的购买";
       cell.title.text = @"2016-12-21 15:00:09";
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
       return cell;

   }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
    return 0.12 * KScreenHeight;
    }
    return 0.16 * KScreenHeight;
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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *top = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 30)];
    top.backgroundColor = [UIColor whiteColor];
    
    return top;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 30.0f;
    }
    return 0.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
         return 16.0f;
    }
    return 0.0f;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (UITableViewCellEditingStyleDelete);
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (YES);
}

@end
