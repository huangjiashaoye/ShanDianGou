//
//  OrderDetailXiangViewController.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "SettlementViewControllerNext.h"

@interface SettlementViewControllerNext ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>{
    NSMutableArray *dataArray;
    UITableView *ListView;
    NSArray *PresonDic;
    NSMutableArray *dataList;
    //支付方式选择
    NSString *PayStual;
    NSMutableArray *TitleAry;
    NSMutableArray *ImgAry;
    NSMutableArray *IdAry;
    NSMutableArray *ProductList_pic;
    NSString *Section_Text;
}


@end

@implementation SettlementViewControllerNext


- (id)init
{
    self = [super init];
    if (self) {
        
        
        //注册修改收货人地址通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadAddressData:) name:@"ReceiveAddressModify" object:nil];
        
    }
    return self;
}

//收货人信息修改
-(void)reloadAddressData:(NSNotification *)object
{

    
    PresonDic = [object valueForKey:@"object"];
    
    
   
    self.addressId = [NSString stringWithFormat:@"%@",[PresonDic valueForKey:@"Id"]];
    [ListView reloadData];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataArray = [NSMutableArray array];
    TitleAry = [NSMutableArray array];
    ImgAry = [NSMutableArray array];
    IdAry = [NSMutableArray array];
    ProductList_pic = [NSMutableArray array];
    Section_Text = @"";
    
    for (NSDictionary *dic  in self.payType) {
        
        [IdAry addObject:[dic valueForKey:@"Id"]];
        
        
    }
    
    PayStual = @"";
    
    dataList = [NSMutableArray array];
    
    for (NSDictionary *dic in self.productArray) {
        
        [dataList addObject:dic];
    
    }
    
   
    
    for (NSDictionary *dic in self.productArray) {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
    [dict setValue:[dic valueForKey:@"Amount"] forKey:@"ProductCount"];
        
    [dict setValue:[dic valueForKey:@"ProductId"] forKey:@"ProductId"];
        
    
    [dict setValue:[dic valueForKey:@"ProductPrice"] forKey:@"ProductPrice"];
        
        [ProductList_pic addObject:dict];
        
    }
    
   
    
    [self listView];
    [self Top_View];
    
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];

    [self setupBottomView];

}

#pragma mark - 设置底部视图
-(void)setupBottomView
{
    //底部视图的 背景
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
    [self.view addSubview:bgView];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    line.backgroundColor = kUIColorFromRGB(0xD5D5D5);
    [bgView addSubview:line];
    
    //
    
    //
    UILabel *lebl = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, bgView.frame.size.width * 0.25, bgView.frame.size.height)];
    lebl.text = @"实付金额：";
    lebl.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:lebl];
    
    //
    UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(lebl.frame.size.width + lebl.frame.origin.x + 5, 0, bgView.frame.size.width * 0.25, bgView.frame.size.height)];
    price.text = [NSString stringWithFormat:@"￥ %.2f",[self.All_Money floatValue]];
    price.font = [UIFont systemFontOfSize:17.5f];
    price.textAlignment = NSTextAlignmentLeft;
    price.textColor = [UIColor redColor];
    [bgView addSubview:price];
    //
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0.75 * KScreenWidth, 0, 0.25 * KScreenWidth, 60);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"提交订单" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(getUp) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [bgView addSubview:button];
    
    
    //
    
    
}

-(void)getUp {
    
  //  OnlinePayViewController *pay = [[OnlinePayViewController alloc]init];
  //  [self presentViewController:pay animated:YES completion:nil];
    
    if ([PayStual isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"请选择支付方式" inView:self.view];
        
        return;
    }
    
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否确认提交订单" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        return ;
    }];
    UIAlertAction *call = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
       
        
        [self GetUPData];
        
        
    }];
    [alert addAction:cancelAction];
    [alert addAction:call];
    [self presentViewController:alert animated:YES completion:nil];


}

//提交订单
-(void)GetUPData
{

    NSString *urlString = [NSString stringWithFormat:@"%@Order",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    [Post PostgetOrder:urlString VendorId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] ProductTypeId:self.ShopUrl ProductItems:ProductList_pic RealPrice:[NSString stringWithFormat:@"%@",self.All_MoneyMore] AddressId:[NSString stringWithFormat:@"%@",self.addressId] PayTypeId:[NSString stringWithFormat:@"%@",PayStual] Remark:Section_Text view:self.view];
    
    Post.UrlStrAry =^(NSArray *Count){
        
 //清空购物车
        
        NSLog(@"%@",Count);
        
        NSMutableDictionary *ShopCartDic = [NSMutableDictionary dictionary];
        NSMutableArray *orderArray = [NSMutableArray array];
        
        [ShopCartDic setValue:orderArray forKey:@"ShopCartDic"];
        
        [[NSUserDefaults standardUserDefaults]setObject:ShopCartDic forKey:@"FristShopCartDic"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
  /////
        
        NSString *msg = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
        
        
        
        if ([msg isEqualToString:@"ok"]) {
     
            
            self.hidesBottomBarWhenPushed = YES;
            Product_Pic_detailViewController *car = [[Product_Pic_detailViewController alloc]init];
            
            car.DetailAry = [Count valueForKey:@"returnInfo"];
            
            [self.navigationController pushViewController:car animated:YES];
            self.hidesBottomBarWhenPushed = YES;

            
        }else{
            [SKAutoHideMessageView showMessage:[Count valueForKey:@"msg"] inView:self.view];
            
            return ;
        }
        
        
        
    };

    
    
}


-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"确认订单"];
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

#pragma 创建tableview
-(void)listView{
    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight - 20, KScreenWidth * 1, KScreenHeight - 60.5- 0.112 * KScreenHeight + 20 - 5)];
    ListView.separatorStyle = NO;
    //  ListView.userInteractionEnabled = NO;
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.backgroundColor = self.view.backgroundColor =[UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0f];
    
    [ListView registerClass:[StatueDetailTableViewCell class] forCellReuseIdentifier:@"StatueDetailTableViewCell"];
    
    [ListView registerClass:[OrderDetailXiangFristTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangFristTableViewCell"];
    
    [ListView registerClass:[OrderDetailXiangSectionTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangSectionTableViewCell"];
    
    [ListView registerClass:[OrderWCTableViewCell class] forCellReuseIdentifier:@"OrderWCTableViewCell"];
    
    [ListView registerClass:[OrderDetailXiangThridTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangThridTableViewCell"];
    
    [ListView registerClass:[OrderDetailXiangFouthTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangFouthTableViewCell"];
    
    [ListView registerClass:[OrderDetailXiangFifthTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangFifthTableViewCell"];
    
    [ListView registerClass:[PayAliayOrWeathTableViewCell class] forCellReuseIdentifier:@"PayAliayOrWeathTableViewCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
//        if (dataList.count > 3) {
//            return 3;
//        }
        return dataList.count;
    }
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        return PrdouctCell;
    }else if (indexPath.section == 0){
        return SureOrderOneCell;
    }
    else if (indexPath.section == 2){
        return PriceCell;
    }
    else if(indexPath.section == 1){
        return 2 * 90;
    }
    else{
        return 40;
    }
    return PriceCell;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {

        
        static NSString *cellID=@"OrderDetailXiangSectionTableViewCell";
        OrderDetailXiangSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.statue.text = [NSString stringWithFormat:@"%@",self.name];
        cell.time.text = [NSString stringWithFormat:@"%@",self.phone];
        cell.address.text = [NSString stringWithFormat:@"%@",self.address];
        
        if (PresonDic) {
            
            cell.statue.text = [NSString stringWithFormat:@"%@",[PresonDic valueForKey:@"Consignee"]];
            cell.time.text = [NSString stringWithFormat:@"%@",[PresonDic valueForKey:@"Phone"]];
            cell.address.text = [NSString stringWithFormat:@"%@",[PresonDic valueForKey:@"ConsigneeAddress"]];
            
        }
        
        
        return cell;
        
    }

    else if (indexPath.section == 3){
        
        static NSString *cellID=@"OrderDetailXiangThridTableViewCell";
        OrderDetailXiangThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
     //   [cell.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.productArray[indexPath.row] valueForKey:@"image"]]] placeholderImage:[UIImage imageNamed:@"defalut_4_5.jpg"]];
        
        cell.Name.text = [NSString stringWithFormat:@"%@",[dataList[indexPath.row] valueForKey:@"ProductName"]];

        cell.number.text = [NSString stringWithFormat:@"￥%@ ×%@",[dataList[indexPath.row] valueForKey:@"ProductPrice"],[dataList[indexPath.row] valueForKey:@"Amount"]];
        
        
        NSString *price = [NSString stringWithFormat:@"%@",[dataList[indexPath.row] valueForKey:@"ProductPrice"]];
        
        NSString *num = [NSString stringWithFormat:@"%@",[dataList[indexPath.row] valueForKey:@"Amount"]];
        
        cell.Price.text = [NSString stringWithFormat:@"￥%.2f",[price floatValue] * [num intValue]];
        
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        return cell;
        
    }else if (indexPath.section == 2){
    

        static NSString *cellID=@"OrderDetailXiangFouthTableViewCell";
        OrderDetailXiangFouthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.AllPriceOne.text = [NSString stringWithFormat:@"￥ %@",self.All_MoneyMore];
        cell.FeiOne.text = @"￥ 0.00";
        cell.BackPriceOne.text = [NSString stringWithFormat:@"￥ %.2f",[self.All_MoneyMore floatValue] - [self.All_Money floatValue]];
        
        cell.Price.text = [NSString stringWithFormat:@"实际付款：     ￥%.2f",[self.All_Money floatValue]];
        cell.selectionStyle = UITableViewCellAccessoryNone;
        return cell;

    }else if (indexPath.section == 1){
    
        static NSString *cellID=@"PayAliayOrWeathTableViewCell";
        PayAliayOrWeathTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        

        cell.title = TitleAry;
        
        cell.TopCellMapCount =^(NSInteger count){
        
            
            PayStual = [NSString stringWithFormat:@"%@",IdAry[count]];
            
            
        };
        
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        return cell;
        
    }else{
        
        static NSString *cellID=@"OrderDetailXiangFristTableViewCell";
        OrderDetailXiangFristTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        cell.TextView =^(NSString *count){

            Section_Text = [NSString stringWithFormat:@"%@",count];
        };
        
        return cell;
        
    }

    return nil;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    
    UIView *nilview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    nilview.backgroundColor = [UIColor whiteColor];

    if (section == 3) {
        //logo
        UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
     //   [logo setImage:[UIImage imageNamed:@"1004.jpg"]];
        
        [logo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.productTypePic]]];
        
        [nilview addSubview:logo];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(logo.frame.origin.x + logo.frame.size.width + 10, 5, KScreenWidth * 0.4, 40)];
        
        label.text = [NSString stringWithFormat:@"%@",self.productTypeName];
        
        
        label.font = [UIFont systemFontOfSize:14.0f];
        [nilview addSubview:label];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(20, 49.5, KScreenWidth - 20, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:234/255.0];
        [nilview addSubview:line];
        
    }else{
        
    nilview.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0f];
        
    }
    
    return nilview;
}




-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 50.0f;
    }

    return 10.0f;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *nilview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    nilview.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0f];

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, KScreenWidth , 40)];
    label.text = @"点击查看全部商品 >>";
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    [nilview addSubview:label];

    
    return nilview;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
       return 50;
    }
    return 0;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (UITableViewCellEditingStyleDelete);
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (YES);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        self.hidesBottomBarWhenPushed=YES;
        AddressListViewController *testVc = [[AddressListViewController alloc] init];
        
        
        [self.navigationController pushViewController:testVc animated:NO];
        self.hidesBottomBarWhenPushed=NO;
    }

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
