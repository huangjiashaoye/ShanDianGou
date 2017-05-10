//
//  PurchaseOneViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/4.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "PurchaseOneViewController.h"

@interface PurchaseOneViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *ListView;
    NSMutableArray *aryList;
    
}

@property (nonatomic,strong) XDRefreshView *refreahView;
@end

@implementation PurchaseOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    aryList = [NSMutableArray array];
    
    [self Getpost_Url];
    [self TopView];
    
 
}
//
-(void)creatList{
    
    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth,KScreenHeight - 0.112 * KScreenHeight - 49)];
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.separatorStyle = NO;
    ListView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    ListView.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:0.6f];
    
    [ListView registerClass:[PurchTableViewCell class] forCellReuseIdentifier:@"PurchCell"];
    
    [self RrefulPost];

}


-(void)TopView{
    
    Top_View_BG  *top = [[Top_View_BG alloc]init];
    
    [top TopView:self.view str:@"我要进货"];
    
    [top.btn addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick2:(UIButton *)sender
{
 
    
    self.hidesBottomBarWhenPushed=YES;
    
    MessageCentViewController *clas = [[MessageCentViewController alloc]init];

    [self.navigationController pushViewController:clas animated:NO];
    
    self.hidesBottomBarWhenPushed=NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return aryList.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PurchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PurchCell" forIndexPath:indexPath];
  
    NSDictionary *dic = aryList[indexPath.section];
    
    [cell.logo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ImgPath"]]]];
    cell.Name.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Name"]];
    cell.Price.text = [NSString stringWithFormat:@"￥%@ 起价",[dic valueForKey:@"StartingPrice"]];
    cell.Pin.text = [NSString stringWithFormat:@"主营：%@",[dic valueForKey:@"MainCommodities"]];
    cell.Fan.text = [NSString stringWithFormat:@"配送：%@",[dic valueForKey:@"SubDistrictString"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.2 * KScreenHeight;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = aryList[indexPath.section];
    
    NSString *shop = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"ShopUrlGo"]];
    
    NSString *ShopUrl = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Id"]];
    

    if (![shop isEqualToString:ShopUrl]) {
        
        //清空购物车
        //
        NSMutableDictionary *ShopCartDic = [NSMutableDictionary dictionary];
        NSMutableArray *orderArray = [NSMutableArray array];
        
        [ShopCartDic setValue:orderArray forKey:@"ShopCartDic"];
        
        [[NSUserDefaults standardUserDefaults]setObject:ShopCartDic forKey:@"FristShopCartDic"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];

        /////
        
    }

    

    
    self.hidesBottomBarWhenPushed=YES;
    
    ClasscationViewController *clas = [[ClasscationViewController alloc]init];
   
    clas.ShopUrl = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Id"]];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",clas.ShopUrl] forKey:@"ShopUrlGo"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
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
    self.navigationController.navigationBarHidden = YES;
}

-(void)Getpost_Url
{
    NSString *urlString = [NSString stringWithFormat:@"%@Supplier",LinkerAddress];
    
    NSString *VendorId = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]];
    
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    [postUrl postSupplier:urlString VendorId:VendorId PageIndex:@"0" PageSize:@"0"];
    
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        
        for (NSDictionary *dic in Count) {
            
            [aryList addObject:dic];
            
        }
       
        [self creatList];
        
    };

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
    
    
    [ListView addSubview:self.refreahView];
    __weak typeof (PurchaseOneViewController) *weakSelf = self;
    self.refreahView.refreshBlock = ^(){
       
        //由于加载的是plist文件比较快，现在我们用GCD方式添加延时
        ino64_t delayInSeconds = 3;
//        __weak PurchaseOneViewController *weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //加载数据
            
        //    [self Getpost_Url_View];
              [weakSelf Getpost_Url_View];
            //结束刷新
            [weakSelf.refreahView endRefreshing];
        });
        
    };
    
}


-(void)Getpost_Url_View
{
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@Supplier",LinkerAddress];
    
    NSString *VendorId = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]];
    
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    [postUrl postSupplier:urlString VendorId:VendorId PageIndex:@"0" PageSize:@"0"];
    
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        [aryList removeAllObjects];
        for (NSDictionary *dic in Count) {
            
            [aryList addObject:dic];
            
        }
        
        [ListView reloadData];
        
    };
    
}


@end
