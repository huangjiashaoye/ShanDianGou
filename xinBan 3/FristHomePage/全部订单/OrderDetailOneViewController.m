//
//  OrderDetailXiangViewController.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/28.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "OrderDetailOneViewController.h"

@interface OrderDetailOneViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>{
    NSMutableArray *dataArray;
    UITableView *ListView;
    NSArray *PresonDic;
    NSArray *DataAry;
    NSArray *ProductData_pic;
}


@end

@implementation OrderDetailOneViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  ProductData_pic = [NSMutableArray array];
    dataArray = [NSMutableArray array];
   
  
    [self GetData];
    [self listView];
    [self Top_View];
    
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];
    [dataArray addObject:@"1"];
    
    if ([self.PayTypeName isEqualToString:@"未支付"]) {
        [self setupBottomView];
    }
    
}


-(void)GetData
{
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    [postUrl PostOrderListDetail:urlString OrderId:self.OrderNumber view:self.view];
    
    postUrl.UrlStrAry =^(NSArray *Count){
     
        

        DataAry = Count;
        
        
        
        ProductData_pic = [DataAry valueForKey:@"orderItem"];
        
        
        [ListView reloadData];
        
        
    };
  
}

#pragma mark - 设置底部视图
-(void)setupBottomView
{
    //底部视图的 背景
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
    bgView.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0f];

    [self.view addSubview:bgView];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    line.backgroundColor = kUIColorFromRGB(0xD5D5D5);
    [bgView addSubview:line];
    
   
    
        NSArray *Img = @[@"contactPreson"];
    
        for (int i = 0; i < Img.count; i++) {
    
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(0.3 * KScreenWidth + (0.3 * KScreenWidth + 16) * 1, 0.5 * (60 - 0.1 * KScreenWidth), 0.3 * KScreenWidth, 0.1 * KScreenWidth);
            
            [button setTitle:@"付款" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [button setBackgroundImage:[UIImage imageNamed:@"Top_BG"] forState:UIControlStateNormal];
            
            
            
            button.tag = 100 + i;
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:button];
        }
    
    
    
//    NSArray *Img = @[@"contactPreson",@"contactSJ"];
//    
//    for (int i = 0; i < Img.count; i++) {
//        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        button.frame = CGRectMake(0.3 * KScreenWidth + (0.3 * KScreenWidth + 16) * i, 0.5 * (60 - 0.1 * KScreenWidth), 0.3 * KScreenWidth, 0.1 * KScreenWidth);
//        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",Img[i]]] forState:UIControlStateNormal];
//        button.tag = 100 + i;
//        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:button];
//    }
    
}

-(void)btnClick:(UIButton *)sender
{
  
    NSString *urlString = [NSString stringWithFormat:@"%@PayMent",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    [Post PostPayOrder:urlString OrderNum:[NSString stringWithFormat:@"%@",[[DataAry valueForKey:@"order"] valueForKey:@"OrderNum"]] view:self.view];
    
    
    Post.UrlStrAry =^(NSArray *Count){
        
        NSString *msg = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
    
        
        
        NSString *Name = [NSString stringWithFormat:@"%@",[Count valueForKey:@"Name"]];
        
        if ([msg isEqualToString:@"(null)"]) {

            if ([Name isEqualToString:@"支付宝"]) {
                
                NSString *appScheme = @"FristHomePage";
                // 跳转到掌上快来了
                [[AlipaySDK defaultService] payOrder:[NSString stringWithFormat:@"%@",[Count valueForKey:@"LinkUrl"]]fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                    
                    if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                        
                        
                        [SKAutoHideMessageView showMessage:@"支付成功" inView:self.view];
                        
                    }
                }];
                
                
            }
        }
        
      
        if ([Name isEqualToString:@"微信"]) {
            
            //
            //            if (![WXApi isWXAppInstalled]) {
            //
            //                [SKAutoHideMessageView showMessage:@"未安装微信" inView:self.view];
            //
            //                return;
            //
            //
            //            }
            
            NSDictionary *dict = [Count valueForKey:@"LinkUrl"];
            //            NSDictionary *dict = [res valueForKey:@"Info"][0];
            
            if(dict != nil){
                NSMutableString *retcode = [dict objectForKey:@"retcode"];
                
                if (retcode.intValue == 0){
                    NSString *stamp  = [NSString stringWithFormat:@"%@",[dict objectForKey:@"timestamp"]];
                    
                    
                    //调起微信支付
                    PayReq* request  = [[PayReq alloc] init];
                    request.partnerId  =[NSString stringWithFormat:@"%@",[dict objectForKey:@"partnerid"]];
                    
                    request.prepayId            =[NSString stringWithFormat:@"%@", [dict objectForKey:@"prepayid"]];
                    
                    request.nonceStr            = [NSString stringWithFormat:@"%@",[dict objectForKey:@"noncestr"]];
                    
                    request.timeStamp           =stamp.intValue;
                    
                    NSString *str = @"Sign=WXPay";
                    request.package             = [NSString stringWithFormat:@"%@",str];
                    
                    request.sign                = [NSString stringWithFormat:@"%@",[dict objectForKey:@"sign"]];
                    
                    [WXApi sendReq:request];
                    //日志输出
                    
                    
                    return ;
                    
                }
            }
            
            
        }
        
        
        if (![msg isEqualToString:@""]) {
            
            [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]  inView:self.view duration:1.0f];
            
            return ;
        }
 
        
        
        
    };
    
    
    
    
    //
    //    [[BudayangAPI sharedAPI].userService GetVendorWeiXinPaySignInfo:self.OrderNumber target:self action:@selector(GetVendorWeiXinPaySignInfo:)];
    
}

-(void)getUp {
    
    //  OnlinePayViewController *pay = [[OnlinePayViewController alloc]init];
    //  [self presentViewController:pay animated:YES completion:nil];
    
}


-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"订单详情"];
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
    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight , KScreenWidth * 1, KScreenHeight - 60.5- 0.112 * KScreenHeight + 20 - 5)];
    ListView.separatorStyle = NO;
    //  ListView.userInteractionEnabled = NO;
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.backgroundColor = self.view.backgroundColor =[UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0f];

    [ListView registerClass:[OrderDetailXiangSectionTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangSectionTableViewCell"];
    
 
    [ListView registerClass:[OrderDetailXiangThridTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangThridTableViewCell"];
    
    [ListView registerClass:[OrderDetailXiangFouthTableViewCell class] forCellReuseIdentifier:@"OrderDetailXiangFouthTableViewCell"];
    
    
    [ListView registerClass:[OrderNumberOneTableViewCell class] forCellReuseIdentifier:@"OrderNumberOneTableViewCell"];
    
    [ListView registerClass:[NumberCheckTableViewCell class] forCellReuseIdentifier:@"NumberCheckTableViewCell"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
//        if (self.productArray.count > 3) {
//            return 3;
//        }
        
      return   ProductData_pic.count;
        
      //  return self.productArray.count;
    //    return 3;
    }
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 0.12 * KScreenHeight;
    }else if (indexPath.section == 1){
        return SureOrderOneCell;
    }
    else if (indexPath.section == 2){
        return PrdouctCell;
    }
    else if(indexPath.section == 3){
        return 60;
    }
    else{
        return 0.24 * KScreenHeight;
    }
    return PriceCell;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        
        static NSString *cellID=@"OrderNumberOneTableViewCell";
        OrderNumberOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
        if (DataAry.count != 0) {
            
            
            cell.OrderNumber.text = [NSString stringWithFormat:@"订单编号：%@",[[DataAry valueForKey:@"order"] valueForKey:@"OrderNum"]];
            
         
            if ([_PayStatusName isEqualToString:@"已支付"]&&[_OrderStatusName isEqualToString:@"配货中"]) {
                [cell.LogoSuce setImage:[UIImage imageNamed:@"PS_bg"]];
            }
            
            if ([_PayStatusName isEqualToString:@"已支付"]&&[_OrderStatusName isEqualToString:@"配送中"]) {
                [cell.LogoSuce setImage:[UIImage imageNamed:@"PS_bg"]];
            }
            
            if ([_PayStatusName isEqualToString:@"已支付"]&&[_OrderStatusName isEqualToString:@"已完成"]) {
                [cell.LogoSuce setImage:[UIImage imageNamed:@"YWC_bg"]];
                
            } if([_PayStatusName isEqualToString:@"未支付"]&&[_OrderStatusName isEqualToString:@"订单取消"]){
                
                [cell.LogoSuce setImage:[UIImage imageNamed:@"SX_bg"]];
                
            }
            
            if([_PayStatusName isEqualToString:@"未支付"]&&[_OrderStatusName isEqualToString:@"超时取消"]){
                
                [cell.LogoSuce setImage:[UIImage imageNamed:@"SX_bg"]];
                
            }
            
            if([_PayStatusName isEqualToString:@"未支付"]&&[_OrderStatusName isEqualToString:@"订单成立"]){
                
                [cell.LogoSuce setImage:[UIImage imageNamed:@"HoldPay"]];
                
            }
            
            
            //@"订单编号：123456789000987623";
//        [cell.LogoSuce setImage:[UIImage imageNamed:@"PS_bg"]];
     //   cell.OrderSucee.text = @"订单已出库，正在配送中";
        [cell.BackS setImage:[UIImage imageNamed:@"left_roan"]];
        
            
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
        
    }
    
    else if (indexPath.section == 1){
        
        static NSString *cellID=@"OrderDetailXiangSectionTableViewCell";
        OrderDetailXiangSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
      
        
        if (DataAry.count != 0) {
            
            cell.statue.text = [NSString stringWithFormat:@"%@",[[DataAry valueForKey:@"order"] valueForKey:@"Consignee"]];
            
        
            cell.time.text = [NSString stringWithFormat:@"%@",[[DataAry valueForKey:@"order"] valueForKey:@"Tel"]];
            
            cell.address.text = [NSString stringWithFormat:@"%@",[[DataAry valueForKey:@"order"] valueForKey:@"Address"]];
            
        }
        
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

        
        
    }else if(indexPath.section == 2){

        
        static NSString *cellID=@"OrderDetailXiangThridTableViewCell";
        OrderDetailXiangThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
        NSDictionary *dic = ProductData_pic[indexPath.row];

            cell.Name.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Name"]];
        
        cell.number.text = [NSString stringWithFormat:@"￥%@ × %@",[dic valueForKey:@"SalePirce"],[dic valueForKey:@"Amount"]];
        
        

            cell.Price.text = [NSString stringWithFormat:@"￥%@",[dic valueForKey:@"TotalMoney"]];;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        cell.Name.text = [NSString stringWithFormat:@"%@",[self.productArray[indexPath.row] valueForKey:@"nameStr"]];
//        
//        cell.number.text = [NSString stringWithFormat:@"￥%@ ×%@",[self.productArray[indexPath.row] valueForKey:@"price"],[self.productArray[indexPath.row] valueForKey:@"number"]];
//        
//        
//        NSString *price = [NSString stringWithFormat:@"%@",[self.productArray[indexPath.row] valueForKey:@"price"]];
//        
//        NSString *num = [NSString stringWithFormat:@"%@",[self.productArray[indexPath.row] valueForKey:@"number"]];
//        
//        cell.Price.text = [NSString stringWithFormat:@"￥%.2f",[price floatValue] * [num intValue]];
        
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        return cell;

        
        
    }else if (indexPath.section == 3){
        
        static NSString *cellID=@"NumberCheckTableViewCell";
        NumberCheckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

       
    cell.number.text = [NSString stringWithFormat:@"%@",[[DataAry valueForKey:@"order"] valueForKey:@"VerificationCode"]];
        
    cell.selectionStyle = UITableViewCellAccessoryNone;
        

    return cell;
        
        
    }else {
        
        
        static NSString *cellID=@"OrderDetailXiangFouthTableViewCell";
        OrderDetailXiangFouthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.AllPriceOne.text = [NSString stringWithFormat:@"￥ %@",[[DataAry valueForKey:@"order"] valueForKey:@"RealTotal"]];;;
        cell.FeiOne.text = @"￥ 0";
        cell.BackPriceOne.text = @"￥ 0";
        cell.Price.text = [NSString stringWithFormat:@"实际付款：     ￥ %@",[[DataAry valueForKey:@"order"] valueForKey:@"RealTotal"]];
        cell.selectionStyle = UITableViewCellAccessoryNone;
        return cell;
        
    }
    
    return nil;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    UIView *nilview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    nilview.backgroundColor = [UIColor whiteColor];
    
    if (section == 2) {
        //logo
        UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];

        
        [logo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[DataAry valueForKey:@"ProductTypePic"]]]];
        
        [nilview addSubview:logo];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(logo.frame.origin.x + logo.frame.size.width + 10, 5, KScreenWidth * 0.4, 40)];
        label.text = [NSString stringWithFormat:@"%@",[DataAry valueForKey:@"ProductTypeName"]];
        
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
    if (section == 0) {
        return 0.0f;
    }
    if (section == 2) {
        return 50.0f;
    }
    
    return 10.0f;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    UIView *nilview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    nilview.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0f];
    
    if (section == 2) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, KScreenWidth , 40)];
        label.text = @"点击查看全部商品 >>";
        label.font = [UIFont systemFontOfSize:14.0f];
        label.textColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentCenter;
        [nilview addSubview:label];
    }

    
    return nilview;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 50;
    }
    if (section == 1) {
        return 10.0f;
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
    
//        if (indexPath.row == 0) {
//            self.hidesBottomBarWhenPushed=YES;
//            OrderTrackingViewController *testVc = [[OrderTrackingViewController alloc] init];
//    
//            
//            [self.navigationController pushViewController:testVc animated:NO];
//            self.hidesBottomBarWhenPushed=NO;
//        }
    
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
