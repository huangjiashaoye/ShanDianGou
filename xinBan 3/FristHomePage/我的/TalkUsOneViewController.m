//
//  SetUpOneViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/8.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "TalkUsOneViewController.h"
#define SERVICE_ID @"KEFU147079345160537"

@interface TalkUsOneViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    UITableView *ListView;
    NSArray *SetAry;
    NSArray *SetTit;
    NSString *TokenS;
}

@end

@implementation TalkUsOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SetAry = @[@"messagePersonO",@"messagePerson",@"Writer_bg"];
    SetTit = @[@"在线客服",@"热线电话",@"留言反馈"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
    [self Top_View];
    [self creaTList];
  
}



-(void)creaTList{
    
    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, 0.9 * KScreenHeight)];
    ListView.separatorStyle = NO;
    ListView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:0.6f];
    [ListView registerClass:[TalkUsOneTableViewCell class] forCellReuseIdentifier:@"TalkUsCell"];
    
}


-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"联系我们"];
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
    TalkUsOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TalkUsCell" forIndexPath:indexPath];
    [cell.MessageLogo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",SetAry[indexPath.section]]]];
    cell.title.text = [NSString stringWithFormat:@"%@",SetTit[indexPath.section]];
    
    if (indexPath.section == 2) {
        cell.time.text =@"欢迎提供意见／建议或为快来供货";
        cell.time.font = [UIFont systemFontOfSize:14.6F];
      
        cell.time.textColor = [UIColor grayColor];
    }else{
        
        cell.time.layer.masksToBounds = YES;
        cell.time.layer.cornerRadius = 10.0f;
        cell.time.layer.borderWidth = 0.5f;
        cell.time.layer.borderColor = [UIColor orangeColor].CGColor;
        cell.time.text = @"工作日  早9:00 - 晚17:00";
        cell.time.textColor = [UIColor orangeColor];
    
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MessageOneCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"021-61733989" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }];
        UIAlertAction *call = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *store = @"021-61733989";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",store]]];
        }];
        [alert addAction:cancelAction];
        [alert addAction:call];
        [self presentViewController:alert animated:YES completion:nil];
  
    }
    if (indexPath.section == 2) {
        
        [SKAutoHideMessageView showMessage:@"正在玩命开发中，敬请期待！！！" inView:self.view];
        return;

        
//        self.hidesBottomBarWhenPushed=YES;
//        
//        SuggestionViewController *clas = [[SuggestionViewController alloc]init];
//        
//        [self.navigationController pushViewController:clas animated:NO];
//        
//        self.hidesBottomBarWhenPushed=YES;

    }
    
    if (indexPath.section == 0) {
        
         [self Talk];
        
    }
}


-(void)creatUI{
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    [postUrl PostRongYunToken:urlString Account:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserCount"]] view:self.view];
    
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        
        
        
        NSString *strCount = [NSString stringWithFormat:@"%@",Count];
        
        NSData *data = [strCount dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        
        NSString *msg = [NSString stringWithFormat:@"%@",[jsonDict valueForKey:@"msg"]];
        
        
        
        NSData *Msgdata = [msg dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *MsgjsonDict = [NSJSONSerialization JSONObjectWithData:Msgdata options:NSJSONReadingMutableLeaves error:nil];
        
        
        TokenS = [NSString stringWithFormat:@"%@",[MsgjsonDict valueForKey:@"token"]];
        
        
        
        [self getRongTokenNext];
        
    };
    


}

-(void)getRongTokenNext
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    //账号
    [[RCIM sharedRCIM] initWithAppKey:@"8brlm7ufrfhd3"];
    
    [[RCIM sharedRCIM] connectWithToken:[NSString stringWithFormat:@"%@",TokenS] success:^(NSString *userId) {
        //  NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        
        
       
        
    } error:^(RCConnectErrorCode status) {
        //  NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        //  NSLog(@"token错误");
    }];
}


-(void)Talk
{
    self.hidesBottomBarWhenPushed=YES;
    

    RCDCustomServiceViewController *chatService = [[RCDCustomServiceViewController alloc] init];
    
    chatService.userName = @"客服";
    chatService.conversationType = ConversationType_CUSTOMERSERVICE;
    chatService.targetId = SERVICE_ID;
      chatService.title = chatService.userName;
    chatService.enableUnreadMessageIcon = YES;
    [chatService setMessageAvatarStyle:RC_USER_AVATAR_CYCLE];
    //  [chatService notifyUpdateUnreadMessageCount];
    
    //    [chatService.unReadButton setTitle:@"100" forState:UIControlStateNormal];

    [self.navigationController pushViewController:chatService animated:NO];
    
            self.hidesBottomBarWhenPushed=YES;
    
   
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
