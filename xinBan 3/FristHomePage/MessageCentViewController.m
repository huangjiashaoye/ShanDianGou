//
//  MessageCentViewController.m
//  FristHomePage
//
//  Created by huangfu on 17/1/9.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "MessageCentViewController.h"

@interface MessageCentViewController ()<UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>{

    UITableView *MessageList;
    NSArray *Data_ary;
    
}

@end

@implementation MessageCentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:0.6f];
    [self PostMessageList];
    [self Top_View];
    [self MessageList_view];
}


-(void)PostMessageList
{
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    
    [postUrl PostMessageList:urlString VendorId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] view:self.view];
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        
        
        Data_ary = [Count valueForKey:@"msg"];
        
        [MessageList reloadData];
    };
}

-(void)MessageList_view
{
    MessageList = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, (1 - 0.112)* KScreenHeight)];
    MessageList.delegate = self;
    MessageList.dataSource = self;
    MessageList.separatorStyle = UITableViewCellEditingStyleNone;
    MessageList.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:MessageList];
    MessageList.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:0.6f];
    [MessageList registerClass:[MessageCentTableViewCell class] forCellReuseIdentifier:@"MessageCent"];
    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return Data_ary.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCent" forIndexPath:indexPath];
   
    NSDictionary *dic = Data_ary[indexPath.section];
    
   
    
    cell.time.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Sendtime"]];
    [cell.logo_img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"PicUrl"]]]];
    

    
    cell.Title.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Title"]];
    
    cell.Detail.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Message"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MessageCell * 1.2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = Data_ary[indexPath.section];
    
    
    
    self.hidesBottomBarWhenPushed=YES;
    
    Web_pc_ViewController *clas = [[Web_pc_ViewController alloc]init];
    clas.LinkUrl = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Link"]];
    [self.navigationController pushViewController:clas animated:NO];
    
    self.hidesBottomBarWhenPushed = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.0f;
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
