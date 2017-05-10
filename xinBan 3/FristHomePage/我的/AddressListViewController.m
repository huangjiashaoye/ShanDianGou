//
//  AddressListViewController.m
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/21.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "AddressListViewController.h"

@interface AddressListViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIGestureRecognizerDelegate>{
    
    UITableView *ListView;
    NSArray *ListData;
    NSMutableArray *ProvinceName;
    NSMutableArray *ProvinceId;
    NSMutableArray *CityName;
    NSMutableArray *CityId;
    NSArray *CityListAry;
    NSMutableArray *DistrictList;
    NSString *BianJ;
    NSString *adress;
    NSString *Detail;
    NSString *Consignee;
    NSString *Phone;
}

@end

@implementation AddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    ProvinceName = [NSMutableArray array];
    ProvinceId = [NSMutableArray array];
    CityName = [NSMutableArray array];
    CityId = [NSMutableArray array];
    DistrictList = [NSMutableArray array];
    
    
    [self Top_View];
    [self listView];
    ListView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
  //  ListView.userInteractionEnabled = NO;//关闭cell的点击事件
    [self AddNewAddress];
   
}


-(void)GetData_List
{
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    

    
    [postUrl PostAddressList:urlString OrderId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] view:self.view];
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
  
        ListData = Count;
       
        [ListView reloadData];
    };
    

}

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"地址管理"];
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



#pragma 新增地址
-(void)AddNewAddress
{
    UIButton *add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add.frame = CGRectMake(0, KScreenHeight * 0.92, KScreenWidth , 0.08 * KScreenHeight);
//    [add setBackgroundImage:[UIImage imageNamed:@"backTopColor"] forState:UIControlStateNormal];
    [add setBackgroundColor:[UIColor colorWithRed:24/255.0 green:109/255.0 blue:230/255.0 alpha:1.0f]];
    [add setTitle:@"新建地址" forState:UIControlStateNormal];
    [add setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [add addTarget:self action:@selector(addNew:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:add];
}
#pragma 新增地址
-(void)addNew:(UIButton *)sender
{
 
//        [SKAutoHideMessageView showMessage:@"正在玩命开发中，敬请期待！！！" inView:self.view];
//        return;
    [self GetAddressList];

    
}

-(void)GetAddressList
{
    NSString *urlString = [NSString stringWithFormat:@"%@Tool",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    
    
    [Post PostAddressList:urlString AreaType:@"1" ParentId:@"0" view:self.view];
    
    Post.UrlStrAry =^(NSArray *Count){
        
       
        
        for (NSDictionary *dic in Count) {

            [ProvinceName addObject:dic];
                
        }

        
        self.hidesBottomBarWhenPushed=YES;
        LocationPickerVC *abount = [[LocationPickerVC alloc]init];
        abount.ProvinceName = ProvinceName;
 
        if ([BianJ isEqualToString:@"BianJi"]) {
            abount.Change = @"Change";
            abount.text_one = Consignee;
            abount.text_two = Phone;
            abount.text_three = adress;
            abount.text_four = Detail;
        }
        
        self.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:abount animated:NO];
        
    };
    
    
    

    
 
    
}

#pragma 创建tableview
-(void)listView{
    
    //fenline
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, 3)];
    [line setImage:[UIImage imageNamed:@"fenline"]];
    [self.view addSubview:line];
    
    ListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight + 3, KScreenWidth, KScreenHeight * 0.92 - 0.112 * KScreenHeight - 3)];
    ListView.delegate = self;
    ListView.dataSource = self;
    [self.view addSubview:ListView];
    ListView.backgroundColor = [UIColor colorWithRed:222/255.0 green:225/255.0 blue:229/255.0 alpha:1.0f];
    [ListView registerClass:[AddressListTableViewCell class] forCellReuseIdentifier:@"AddressListCell"];
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ListData.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.18 * KScreenHeight;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    AddressListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressListCell" forIndexPath:indexPath];
    
    NSDictionary *dic = ListData[indexPath.section];
    
    cell.NamePhone.text = [NSString stringWithFormat:@"%@          %@",[dic valueForKey:@"Consignee"],[dic valueForKey:@"Phone"]];
    
    cell.DetailLabel.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ConsigneeAddress"]];
    
    NSString *Tag = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Id"]];
    
    cell.Del.tag = [Tag integerValue];
    
    [cell.Del addTarget:self action:@selector(AddDel:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.BianJi addTarget:self action:@selector(BianJi:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.BianJi.tag = indexPath.section + 1000;
    
    [cell.SelectAddress addTarget:self action:@selector(selectAddress:) forControlEvents:UIControlEventTouchUpInside];
//    cell.SelectAddress.tag = 1000 + indexPath.section;
    
    if (indexPath.section == 0) {
        
    [cell.SelectAddress setBackgroundImage:[UIImage imageNamed:@"Bule_select_pc"] forState:UIControlStateNormal];
    cell.SelectAddress_label.text = @"默认地址";
    }else{
        
    [cell.SelectAddress setBackgroundImage:[UIImage imageNamed:@"NoSelectOne"] forState:UIControlStateNormal];
    cell.SelectAddress_label.text = @"设为默认";
    }
    
    return cell;

}

-(void)selectAddress:(UIButton *)sender
{
//    UIButton *btn = (UIButton *)[self.view viewWithTag:sender.tag];
//    [btn setBackgroundImage:[UIImage imageNamed:@"PicSelect"] forState:UIControlStateNormal];
}

#pragma 地址的修改与删除
-(void)BianJi:(UIButton *)sender
{

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要修改该地址吗?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        return ;
    }];
    UIAlertAction *call = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        BianJ = @"BianJi";
        
        NSDictionary *dic = ListData[sender.tag - 1000];
        
        
        
        NSString *ConsigneeAddress = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ConsigneeAddress"]];
        
        Detail = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Detail"]];
        
        NSRange range = NSMakeRange(0, ConsigneeAddress.length - Detail.length);
        
        adress = [NSString stringWithFormat:@"%@",[ConsigneeAddress substringWithRange:range]];
        
        Phone = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Phone"]];
        
        Consignee = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Consignee"]];
        
        [self GetAddressList];
        
        
        
        
    }];
    [alert addAction:cancelAction];
    [alert addAction:call];
    [self presentViewController:alert animated:YES completion:nil];
    

    
}

-(void)AddDel:(UIButton *)sender
{

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要删除该地址吗?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        return ;
    }];
    UIAlertAction *call = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self DeleteAddressId:sender.tag];
        
        
    }];
    [alert addAction:cancelAction];
    [alert addAction:call];
    [self presentViewController:alert animated:YES completion:nil];
    

    
}


-(void)DeleteAddressId:(NSInteger)tag
{
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    
    
    [postUrl PostDelAddressList:urlString OrderId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] AddressId:[NSString stringWithFormat:@"%ld",(long)tag] view:self.view];
    
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        
       
    [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]  inView:self.view];
        
        [self GetData_List];
    };
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 8.0f;
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
 
      

    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReceiveAddressModify" object:ListData[indexPath.section]];
    [self.navigationController popViewControllerAnimated:YES];

}



- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBarHidden = YES;
    [self GetData_List];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    
    self.navigationController.navigationBarHidden = NO;
    
    [super viewWillDisappear:animated];
}


@end
