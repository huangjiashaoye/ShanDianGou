//
//  FristHomePageViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "FristHomePageViewController.h"
#import "HomePageTableViewCell.h"


@interface FristHomePageViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView *HomePageView;
    UIImageView *top_view;
    NSMutableArray *dataAry;
    NSArray *ChartDict;
    NSMutableDictionary *count;
    NSMutableDictionary *StockDic;
    NSMutableDictionary *PurchaseMultiple_bg;
    NSMutableDictionary *LimitAccount_bg;
    NSArray *ProductData;
    NSArray *array_data ;
}

@property (nonatomic,strong) XDRefreshView *refreahView;
@property (nonatomic,strong) NSMutableArray *ordersArray;//购物车


@end

@implementation FristHomePageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ordersArray = [NSMutableArray array];
    dataAry = [NSMutableArray array];
    PurchaseMultiple_bg = [NSMutableDictionary dictionary];
    StockDic = [NSMutableDictionary dictionary];
    LimitAccount_bg = [NSMutableDictionary dictionary];
    
    self.view.backgroundColor = [UIColor colorWithRed:19/255.0 green:108/255.0 blue:230/255.0 alpha:1.0f];
   
    
    
}
/**
 * 创建下拉刷新控件
 */
-(XDRefreshView *)refreahView{
    
    if (_refreahView==nil) {
        _refreahView = [[XDRefreshView alloc] initWithFrame:CGRectMake((KScreenWidth - 131) * 0.5,- 35.5, 124, 29)];

    }
    return _refreahView;
}
//下拉刷新
-(void)RrefulPost
{

    [HomePageView addSubview:self.refreahView];
    
    __weak typeof (FristHomePageViewController) *weakSelf = self;
    
    self.refreahView.refreshBlock = ^(){
       
        //由于加载的是plist文件比较快，现在我们用GCD方式添加延时
        ino64_t delayInSeconds = 3;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //加载数据
          
            [weakSelf GetDataSource];
            
            //结束刷新
            [weakSelf.refreahView endRefreshing];
        });
        
    };

}

-(void)GetDataSource
{
    [dataAry removeAllObjects];
 
    NSString *urlString = [NSString stringWithFormat:@"%@ActivityProduct",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    [postUrl postTop:urlString SaleChannelId:@"1" TopIndex:@"0" PageIndex:@"0" PageSize:@"0" view:self.view];
    
   
    
    postUrl.UrlStrAry =^(NSArray *Count){
    
        NSString *msg = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
        
        if ([msg isEqualToString:@"获取活动商品失败!"]) {
            
            return ;
        }
        for (NSDictionary *dic in Count) {
            
            [dataAry addObject:dic];
            
        }
         [self creatTable];
        
    };
            
}

-(void)creatTable
{
    HomePageView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 20 - 49)];
    
    HomePageView.delegate = self;
    HomePageView.dataSource = self;
    [self.view addSubview:HomePageView];
    HomePageView.separatorStyle = NO;
    HomePageView.showsVerticalScrollIndicator = NO;
    HomePageView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [HomePageView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"HomePage"];
    [HomePageView registerClass:[PanicBuyTableViewCell class] forCellReuseIdentifier:@"PanicBuy"];
    [HomePageView registerClass:[DetailProductTableViewCell class] forCellReuseIdentifier:@"DetailProduct"];
    [HomePageView registerClass:[Sign_Product_TableViewCell class] forCellReuseIdentifier:@"Sign_Product"];
    
    [self AddSignOrMessageBtn];
    
    [self RrefulPost];
    
}
#pragma 按钮
-(void)AddSignOrMessageBtn
{
    top_view = [[UIImageView alloc]init];
    top_view.frame = CGRectMake(0, 0, KScreenWidth, 0.112 * KScreenHeight);
    [top_view setImage:[UIImage imageNamed:@"Top_BG"]];
    
    top_view.alpha = 0.0f;
    [self.view addSubview:top_view];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 0.07 * KScreenHeight - 10, KScreenWidth - 80, 0.06 * KScreenWidth)];
    label.text = @"快来掌柜";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:24.0f];
    label.textAlignment = NSTextAlignmentCenter;
    [top_view addSubview:label];
    

    NSArray *array = @[@"SignOne",@"MessageOne"];
    
    for (int i = 0; i < array.count; i++) {
        UIButton *btn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(15 + (KScreenWidth - 30 - 1 * 0.06 * KScreenWidth) * i, 0.07 * KScreenHeight - 10, 0.06 * KScreenWidth, 0.06 * KScreenWidth);
        
      
        
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",array[i]]] forState:UIControlStateNormal];
        btn.tag = i + 100;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        if (i == 1) {
            UILabel *Red = [[UILabel alloc]initWithFrame:CGRectMake(0.03 * KScreenWidth,- 0.02 * KScreenWidth, 0.05 * KScreenWidth, 0.04 * KScreenWidth)];
            Red.backgroundColor = [UIColor redColor];
            Red.text = @"2";
            Red.font = [UIFont systemFontOfSize:13.0f];
            Red.textAlignment = NSTextAlignmentCenter;
            Red.textColor = [UIColor whiteColor];
            Red.layer.masksToBounds = YES;
            Red.layer.cornerRadius = 0.02 * KScreenWidth;
          //  [btn addSubview:Red];
        }
        
    }
    
}


#pragma 点击事件 消息和签到
-(void)btnClick:(UIButton *)sender
{

    if (sender.tag == 101) {
        
        self.hidesBottomBarWhenPushed=YES;
        
        MessageCentViewController *clas = [[MessageCentViewController alloc]init];
        
        [self.navigationController pushViewController:clas animated:NO];
        
        self.hidesBottomBarWhenPushed=NO;
  
    }else{
    
        self.hidesBottomBarWhenPushed=YES;
        
        Sign_ViewController *clas = [[Sign_ViewController alloc]init];
        
        [self.navigationController pushViewController:clas animated:NO];
        
        self.hidesBottomBarWhenPushed=NO;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return dataAry.count;
    }
    if (section == 4) {
        return array_data.count;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomePage" forIndexPath:indexPath];
    cell.TopCellMap =^(NSDictionary *count){
    
//        self.hidesBottomBarWhenPushed=YES;
//       
//        Web_pc_ViewController *clas = [[Web_pc_ViewController alloc]init];
//        clas.LinkUrl = @"";
//        [self.navigationController pushViewController:clas animated:NO];
//        
//        self.hidesBottomBarWhenPushed=NO;
        
    };
        
    return cell;
        
    }else if(indexPath.section == 1){
        
     PanicBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PanicBuy" forIndexPath:indexPath];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if(indexPath.section == 3){
        
        PanicBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PanicBuy" forIndexPath:indexPath];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.section == 4) //签到兑换商品
    {
        Sign_Product_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Sign_Product" forIndexPath:indexPath];
        
        
      
        
        NSDictionary *dic = array_data[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.Top_Title.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductName"]];
        [cell.Left_Img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"PicUrl"]]] completed:nil];
        cell.Bottom_Right_Title.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Point"]];
        
         [cell.Btn_Img setBackgroundImage:[UIImage imageNamed:@"rob_pic_Change"] forState:UIControlStateNormal];
        
        cell.foodId = [[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]] integerValue];
        
        cell.ChangeBlock = ^(NSString *productId,BOOL animated)
        {
            
  
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要兑换吗?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }];
            UIAlertAction *call = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [self ChangeSignProduct:productId];
                
            }];
            [alert addAction:cancelAction];
            [alert addAction:call];
            [self presentViewController:alert animated:YES completion:nil];
            
            
            
        };
        return cell;
    }
    else{
        
        DetailProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailProduct" forIndexPath:indexPath];
        
        NSDictionary *dic = dataAry[indexPath.row];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        [PurchaseMultiple_bg setValue:[NSString stringWithFormat:@"%@",[dic valueForKey:@"PurchaseMultiple"]] forKey:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]]];
        
        [[NSUserDefaults standardUserDefaults] setObject:PurchaseMultiple_bg forKey:@"PurchaseMultiple_bg"];
        
        [LimitAccount_bg setValue:[NSString stringWithFormat:@"%@",[dic valueForKey:@"LimitAccount"]] forKey:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]]];
        
        [[NSUserDefaults standardUserDefaults] setObject:LimitAccount_bg forKey:@"LimitAccount_bg"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [cell.Btn_Img setBackgroundImage:[UIImage imageNamed:@"rob_pic"] forState:UIControlStateNormal];
   
     
            count = [NSMutableDictionary dictionary];
            for (NSMutableDictionary *dict in ChartDict) {
               
                [count setObject:[NSString stringWithFormat:@"%@",[dict valueForKey:@"ProductCount"]] forKey:[NSString stringWithFormat:@"%@",[dict valueForKey:@"ProductId"]]];
         
            }

          
            
                cell.orderCount.text = [NSString stringWithFormat:@"%@",[count valueForKey:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]]]];
            
           
            
            if ([cell.orderCount.text isEqualToString:@"(null)"]||[cell.orderCount.text isEqualToString:@"0"]) {
//                cell.orderCount.text = @"0";
                [cell.minus setHidden:YES];
                [cell.orderCount setHidden:YES];
                [cell.plus setHidden:YES];
                [cell.Btn_Img setHidden:NO];
                
                
                [cell.Btn_Img setBackgroundImage:[UIImage imageNamed:@"rob_pic"] forState:UIControlStateNormal];
                
            }else{
                
                [cell.minus setHidden:NO];
                [cell.orderCount setHidden:NO];
                [cell.plus setHidden:NO];
                [cell.Btn_Img setHidden:YES];
            }
            
        NSString *Stock = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Stock"]];
        cell.Stock = Stock;
        cell.foodId = [[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]] integerValue];
        
        if ([Stock isEqualToString:@"0"]) {
            
           [cell.Btn_Img setBackgroundImage:[UIImage imageNamed:@"rob_pic_two"] forState:UIControlStateNormal];
        }else{
        
         [cell.Btn_Img setBackgroundImage:[UIImage imageNamed:@"rob_pic"] forState:UIControlStateNormal];
            
        }
        
        [StockDic setValue:Stock forKey:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]]];
        
        
        
        
        [[NSUserDefaults standardUserDefaults]setObject:StockDic forKey:@"StockDic_Id"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
      
        
        cell.Top_Title.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductName"]];
        
        cell.Left_left_Title.text = [NSString stringWithFormat:@"原价：%@元",[dic valueForKey:@"OriginalPrice"]];
        
        cell.Bottom_Right_Title.text = [NSString stringWithFormat:@"%.2f元",[[dic valueForKey:@"ActivityPrice"] floatValue]];
        
        cell.Left_right_Title.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"SpanTime"]];
        
        
        
        [cell.Left_Img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"PicUrl"]]] completed:nil];
        
        //
        
       //添加
       // __weak __typeof(&*cell)weakCell =cell;
        __block __typeof(self)bself = self;
        
        cell.plusBlock = ^(NSInteger nCount,NSString *productId,BOOL animated)
        {
            
           
            
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
            
   
    [dict setObject:[NSNumber numberWithInteger:nCount] forKey:@"ProductCount"];

    [dict setValue:[dict valueForKey:@"PicUrl"] forKey:@"ProductPic"];

    [dict setValue:[dict valueForKey:@"ActivityPrice"] forKey:@"ProductPrice"];
            
    [dict removeObjectForKey:@"PicUrl"];
    [dict removeObjectForKey:@"ActivityPrice"];
    [dict removeObjectForKey:@"CreateTime"];
    [dict removeObjectForKey:@"CreateUser"];
    [dict removeObjectForKey:@"EndTime"];
    [dict removeObjectForKey:@"Id"];
    [dict removeObjectForKey:@"OriginalPrice"];
            
    [dict removeObjectForKey:@"ProductName"];
    [dict removeObjectForKey:@"SaleChannelId"];
    [dict removeObjectForKey:@"StartTime"];
    [dict removeObjectForKey:@"Status"];
    [dict removeObjectForKey:@"UpdateTime"];
    [dict removeObjectForKey:@"UpdateUser"];
          
  
            
        bself.ordersArray = [ViewModel storeOrders:dict OrderData:self.ordersArray isAdded:animated];

        };
        
        
        
        //
        return cell;
    
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return SDCollectionView;
    }
    if (indexPath.section == 1 || indexPath.section == 3) {
        return CellSecongHeight;
    }
    return CellProductHeight;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//    self.hidesBottomBarWhenPushed=YES;
//    
//    DetailProductViewController *clas = [[DetailProductViewController alloc]init];
//    
//    [self.navigationController pushViewController:clas animated:NO];
//    
//    self.hidesBottomBarWhenPushed=NO;


}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2 || section == 4 ) {
       return 2.0f;
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


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self GetDataSource];
    [self GetData];
    
    self.navigationController.navigationBarHidden = YES;
    
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]valueForKey:@"FristShopCartDic"];
    
    
    
    ChartDict = [dic valueForKey:@"ShopCartDic"];

    for (NSMutableDictionary *dict in ChartDict) {
      self.ordersArray = [ViewModel storeOrders:dict OrderData:self.ordersArray isAdded:YES];
    }
    

    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    top_view.alpha = scrollView.contentOffset.y / 0.112 * KScreenHeight;
    
}

-(void)ChangeSignProduct:(NSString *)productId{
    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
 
    //
    [postUrl PostSignChange:urlString VendorId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] ProductId:[NSString stringWithFormat:@"%@",productId] view:self.view];
    

    
    postUrl.UrlStrAry =^(NSArray *Count){
        
        [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]  inView:self.view];
        
      
    };
    
}




-(void)GetData{
    
    NSString *urlString = [NSString stringWithFormat:@"%@Product",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];

    [postUrl PostSignList:urlString OrderId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] view:self.view];
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        

        ProductData = Count;
        array_data = [Count valueForKey:@"SignProductList"];
        [HomePageView reloadData];
        };
    
    
}

@end
