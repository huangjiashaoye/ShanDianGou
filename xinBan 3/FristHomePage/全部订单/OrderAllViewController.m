//
//  OrderAllViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/4.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "OrderAllViewController.h"

@interface OrderAllViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *ListView;
    UIImageView *arrow;
    NSMutableArray *AryData;
    UILabel *DetailTitle;
    UILabel *DetailFL;
    float NowProgress;
    int Status;
}

@property(nonatomic, strong)CustomSlider *slider;
@property(nonatomic, strong)NSTimer *timer;
@property(nonatomic,assign)float value;
@property(nonatomic, assign)BOOL isDownload;
@property (nonatomic,strong) XDRefreshView *refreahView;


@property (nonatomic, weak) SDRefreshFooterView *refreshFooter;
@property (nonatomic, weak) SDRefreshHeaderView *refreshHeader;
@property (nonatomic, assign) NSInteger totalRowCount;



@end

@implementation OrderAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self GetData_List:1 Status:@"0"];
    AryData = [NSMutableArray array];
    self.totalRowCount = 1;
    [self TopView];
    [self creatList];
    [self press_view];
    [self RrefulPost];
    [self setupFooter];
    [self getSumOrderPrice];
}

-(void)getSumOrderPrice
{
    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    
    [postUrl PostSumOrderPrice:urlString VendorId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] view:self.view];
    
    
    postUrl.UrlStrAry =^(NSArray *Count){

        
        NSDictionary *dic = [Count valueForKey:@"msg"];
        
        DetailFL.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"CashBackMessage"]];
        
        DetailTitle.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"CountMessage"]];
        

      
        NSString *VendorOrderCount = [NSString stringWithFormat:@"%@",[dic valueForKey:@"VendorOrderCount"]];
        
        NSString *CashBackOrderCount = [NSString stringWithFormat:@"%@",[dic valueForKey:@"CashBackOrderCount"]];
        
        NowProgress = [[NSString stringWithFormat:@"%f",[VendorOrderCount floatValue] / [CashBackOrderCount floatValue]] floatValue] * 100;
        
       
        
         [self download];
    };
    

}


//pressview
-(void)press_view
{
    UIImageView *bg_view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0.85 * KScreenHeight - 49, KScreenHeight, 0.15 * KScreenHeight)];
    [bg_view setImage:[UIImage imageNamed:@"press_BG"]];
    
    [self.view addSubview:bg_view];
    
    //
    UIImageView *li_view = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth -0.15 * KScreenHeight * 0.5, 0, 0.15 * KScreenHeight * 0.5, 0.15 * KScreenHeight * 0.5)];
    [li_view setImage:[UIImage imageNamed:@"Back_Li"]];
    [bg_view addSubview:li_view];
    
    //
    UIImageView *li_logo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 0.17 * KScreenHeight * 0.5, 0.17 * KScreenHeight * 0.5)];
    [li_logo setImage:[UIImage imageNamed:@"ZG_view"]];
    [bg_view addSubview:li_logo];
    
    //
    DetailFL = [[UILabel alloc]initWithFrame:CGRectMake(li_logo.frame.origin.x + li_logo.frame.size.width + 10, li_logo.frame.origin.y, KScreenWidth - 15 - li_logo.frame.size.width - li_view.frame.size.width + 20, 20)];
    
    
    DetailFL.font = [UIFont fontWithName:@"CourierNewPSMT" size:13.0F];
    [bg_view addSubview:DetailFL];
    
    //
    DetailTitle = [[UILabel alloc]initWithFrame:CGRectMake(li_logo.frame.origin.x + li_logo.frame.size.width + 10, DetailFL.frame.origin.y + DetailFL.frame.size.height, KScreenWidth - 15 - li_logo.frame.size.width - li_view.frame.size.width + 20, 20)];
    
    
    DetailTitle.textColor = [UIColor grayColor];
    DetailTitle.font = [UIFont fontWithName:@"CourierNewPSMT" size:13.0F];
    [bg_view addSubview:DetailTitle];
    
    
    _slider = [[CustomSlider alloc]initWithFrame:CGRectMake(DetailTitle.frame.origin.x, DetailTitle.frame.origin.y + DetailTitle.frame.size.height + 10, DetailTitle.frame.size.width, 18)];
    [bg_view addSubview:_slider];
    _value = 0.00;
    _isDownload = YES;
    
   
   
}


-(void)runTime{
    
    _value++;
    
    if (_value <= NowProgress) {
        
        [_slider setLeftFrame:_value];
        
    }else if(_value == 1){
        
        [_slider setLeftFrame:0.0f];
        [_timer invalidate];
        _timer = nil;
        _value = 0.00;
        
    }else{
        
        [_timer invalidate];
        _timer = nil;
        _value = 0.00;
      
    }
}
- (void)download {
    if (_isDownload) {
        
        //创建一个定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runTime) userInfo:nil repeats:YES];
        _isDownload = NO;
        
    }
    else{
        [_timer invalidate];
        _timer = nil;
        _isDownload = YES;
    }
}

-(void)TopView{
    
    Top_View_BG  *top = [[Top_View_BG alloc]init];
    
    [top TopView:self.view str:@"全部订单"];
    
    [top.btn addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    arrow = [[UIImageView alloc]initWithFrame:CGRectMake(0.6 * KScreenWidth + 10, 0.065 * KScreenHeight + 3, 14, 14)];
    
    [arrow setImage:[UIImage imageNamed:@"Arrow"]];
    [self.view addSubview:arrow];
    
    UIButton *topOrder = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    topOrder.frame = CGRectMake(0, 20, 0.8 * KScreenWidth, 0.1 * KScreenHeight);
    [topOrder addTarget:self action:@selector(topClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topOrder];
    
}

-(void)topClick:(UIButton *)sender
{
    SRActionSheet *actionSheet = [SRActionSheet sr_actionSheetViewWithTitle:@"订单分类"
                                                                cancelTitle:@"取消"
                                                           destructiveTitle:nil
                                                                otherTitles:@[@"全部订单",@"进行中订单", @"已完订单" ]
                                                                otherImages:nil
                                                           selectSheetBlock:^(SRActionSheet *actionSheetView, NSInteger index) {
                                                               
                             
                                                               
                                        Status = (int)index;
                                                               
                                [self GetData_List:1 Status:[NSString stringWithFormat:@"%d",Status]];
                                                               
                                                           }];
    
    
        arrow.transform = CGAffineTransformMakeRotation(M_PI * 0.5);

        [actionSheet show];
        [actionSheet setupCover];
        

    actionSheet.ChangeAworr =^(BOOL count){
     arrow.transform = CGAffineTransformMakeRotation(M_PI * 2.0);
    };
}




-(void)btnClick2:(UIButton *)sender
{
    
    self.hidesBottomBarWhenPushed=YES;
    
    MessageCentViewController *clas = [[MessageCentViewController alloc]init];
    
    [self.navigationController pushViewController:clas animated:NO];
    
    self.hidesBottomBarWhenPushed=NO;

}


//
-(void)creatList{
    
    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth,KScreenHeight - 0.112 * KScreenHeight - 0.15 * KScreenHeight - 49)];
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.separatorStyle = NO;
    ListView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    ListView.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:0.6f];
    
    [ListView registerClass:[OrderAllTableViewCell class] forCellReuseIdentifier:@"OrderAll"];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return AryData.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderAll" forIndexPath:indexPath];
    
    NSDictionary *dic = AryData[indexPath.section];

    NSString *PayStatusName = [NSString stringWithFormat:@"%@",[dic valueForKey:@"PayStatusName"]];
    
    NSString *OrderStatusName = [NSString stringWithFormat:@"%@",[dic valueForKey:@"OrderStatusName"]];
    
    if ([PayStatusName isEqualToString:@"已支付"]&&[OrderStatusName isEqualToString:@"配货中"]) {
        [cell.Price setImage:[UIImage imageNamed:@"PS_bg"]];
    }
    
    if ([PayStatusName isEqualToString:@"已支付"]&&[OrderStatusName isEqualToString:@"配送中"]) {
        [cell.Price setImage:[UIImage imageNamed:@"PS_bg"]];
    }
    
   if ([PayStatusName isEqualToString:@"已支付"]&&[OrderStatusName isEqualToString:@"已完成"]) {
        [cell.Price setImage:[UIImage imageNamed:@"YWC_bg"]];
       
   } if([PayStatusName isEqualToString:@"未支付"]&&[OrderStatusName isEqualToString:@"订单取消"]){
       
   [cell.Price setImage:[UIImage imageNamed:@"SX_bg"]];
       
   }
    
    if([PayStatusName isEqualToString:@"未支付"]&&[OrderStatusName isEqualToString:@"超时取消"]){
        
        [cell.Price setImage:[UIImage imageNamed:@"SX_bg"]];
        
    }
  
    if([PayStatusName isEqualToString:@"未支付"]&&[OrderStatusName isEqualToString:@"订单成立"]){
        
        [cell.Price setImage:[UIImage imageNamed:@"HoldPay"]];
        
    }
    
    
//    if (indexPath.section == 0) {
//        
//          [cell.Price setImage:[UIImage imageNamed:@"HoldPay"]];
//        
//    }else if (indexPath.section == 1){
//    
//         [cell.Price setImage:[UIImage imageNamed:@"PS_bg"]];
//        
//    }else{
//        [cell.Price setImage:[UIImage imageNamed:@"SX_bg"]];
//    }
    
    cell.Name.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductTypeName"]];
    
    [cell.logo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductTypePic"]]]];
    
    cell.Pin.text = [NSString stringWithFormat:@"订单号：%@",[dic valueForKey:@"OrderNum"]];
    
    cell.AllPay.text = [NSString stringWithFormat:@"￥%@",[dic valueForKey:@"RealTotal"]];
    
    cell.Back_pic.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"CreateTime"]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return 0.24 * KScreenHeight;
    return 0.2 * KScreenHeight;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    self.hidesBottomBarWhenPushed=YES;
    
    
    NSDictionary *dic = AryData[indexPath.section];
    
    NSString *PayStatusName = [NSString stringWithFormat:@"%@",[dic valueForKey:@"PayStatusName"]];
    
    NSString *OrderStatusName = [NSString stringWithFormat:@"%@",[dic valueForKey:@"OrderStatusName"]];
    
    OrderDetailOneViewController *clas = [[OrderDetailOneViewController alloc]init];
    
    clas.PayStatusName = PayStatusName;
    clas.OrderStatusName = OrderStatusName;
    
    clas.PayTypeName = [NSString stringWithFormat:@"%@",[AryData[indexPath.section] valueForKey:@"PayTypeName"]];
    
    clas.OrderNumber = [NSString stringWithFormat:@"%@",[AryData[indexPath.section] valueForKey:@"Id"]];
    
    [self.navigationController pushViewController:clas animated:NO];
    
    self.hidesBottomBarWhenPushed=NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.0f;
    }
    return 1.0f;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

-(void)GetData_List:(NSInteger)totalRowCount Status:(NSString *)Status2
{
    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    [postUrl PostOrderList:urlString VendorID:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] PageIndex:@"1" PageSize:[NSString stringWithFormat:@"%ld",40 * totalRowCount] Status:[NSString stringWithFormat:@"%@",Status2] view:self.view];
    
    postUrl.UrlStrAry =^(NSArray *Count){

        [AryData removeAllObjects];
        for (NSDictionary *dic in Count) {
            
            [AryData addObject:dic];
            
        }
        [ListView reloadData];
      
        
    };
  

}


/**
 * 创建下拉刷新控件
 */
-(XDRefreshView *)refreahView{
    
    if (_refreahView==nil) {
        _refreahView = [[XDRefreshView alloc] initWithFrame:CGRectMake((KScreenWidth - 131) * 0.5,- 35.5, 124, 29)];
        
        //    _refreahView.backgroundColor = [UIColor cyanColor];
        
    }
    return _refreahView;
}
//下拉刷新
-(void)RrefulPost
{
    
    //
    //    UIImageView *logo_bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, - KScreenWidth, KScreenWidth, KScreenWidth)];
    //
    //    [logo_bg setImage:[UIImage imageNamed:@"Login_in_bg2"]];
    //    [HomePageView addSubview:logo_bg];
    
    __weak typeof (OrderAllViewController) *orderSelf = self;
    [ListView addSubview:self.refreahView];
    self.refreahView.refreshBlock = ^(){
    
        //由于加载的是plist文件比较快，现在我们用GCD方式添加延时
        ino64_t delayInSeconds = 3;
//        __weak OrderAllViewController *weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //加载数据
            
            
            
            //结束刷新
            [orderSelf.refreahView endRefreshing];
        });
        
    };
    
}


- (void)setupFooter
{
    SDRefreshFooterView *refreshFooter = [SDRefreshFooterView refreshViewWithStyle:SDRefreshViewStyleClassical];
    [refreshFooter addToScrollView:ListView];
    [refreshFooter addTarget:self refreshAction:@selector(footerRefresh)];
    _refreshFooter = refreshFooter;
}
//上拉刷新
- (void)footerRefresh
{

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.totalRowCount += 1;
          
            [self GetData_List:self.totalRowCount Status:[NSString stringWithFormat:@"%d",Status]];
            
            [self.refreshFooter endRefreshing];
            
        });
   
}


@end
