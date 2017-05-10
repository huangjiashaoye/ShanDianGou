//
//  CartViewController.m
//  CartDemo
//
//  Created by Artron_LQQ on 16/2/18.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "CartViewController.h"
#import "CartTableViewCell.h"

#define  TAG_BACKGROUNDVIEW 100


@interface CartViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate>
{
    UITableView *myTableView;
    //全选按钮
    UIButton *selectAll;
    //展示数据源数组
    NSMutableArray *dataArray;
    //是否全选
    BOOL isSelect;

    //已选的商品集合
    NSMutableArray *selectGoods;
    
    UILabel *priceLabel;
    
    NSString *Name;
    NSString *Phone;
    NSString *address;
    NSString *addressId;
    
    NSString *OrderFullAmount;
    
    NSArray *payType;
    NSString *peice_p;
    NSMutableDictionary *DictPurch;
    NSMutableDictionary *LimitNumber;
    
    NSUInteger OrderNumbers;
    
}


@end

@implementation CartViewController

-(void)viewWillAppear:(BOOL)animated
{
    //每次进入购物车的时候把选择的置空
    [selectGoods removeAllObjects];
    isSelect = NO;
//    [self networkRequest];
    selectAll.selected = NO;
    
    [self selectAllBtnClick];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBarHidden = YES;
}

-(void)selectAllBtnClick
{
    //点击全选时,把之前已选择的全部删除
    [selectGoods removeAllObjects];
    
    selectAll.selected = YES;
    isSelect = YES;
    if (isSelect) {
        
        for (CartModel *model in dataArray) {
            [selectGoods addObject:model];
        }
    }
    else
    {
        [selectGoods removeAllObjects];
    }
    
    [myTableView reloadData];
    [self countPrice];
}

/**
 *  @author LQQ, 16-02-18 11:02:16
 *
 *  计算已选中商品金额
 */
-(void)countPrice
{

    
    double totlePrice = 0.0;
    OrderNumbers = 0;
    for (CartModel *model in selectGoods) {
        
        double price = [model.ProductPrice doubleValue];
        
        totlePrice += price*model.ProductCount;
        OrderNumbers = OrderNumbers + model.ProductCount;
       
    }
    priceLabel.text = [NSString stringWithFormat:@"￥%.2f",totlePrice];
    
    peice_p = [NSString stringWithFormat:@"%.2f",totlePrice];
    
    
      self.TopOrderNumbers(OrderNumbers);
}

/**
 *  @author LQQ, 16-02-18 11:02:32
 *
 *  创建测试数据源
 */
-(void)creatData
{
    

    
    for (int i = 0; i < self.dataWhenArray.count; i++) {
        CartModel *model = [[CartModel alloc]init];
      
        NSDictionary *dic = self.dataWhenArray[i];
        
        model.ProductName = [NSString stringWithFormat:@"%@",self.dataWhenArray[i][@"ProductName"]];
        
        
        
        model.ProductPrice = [NSString stringWithFormat:@"%.2f",[[self.dataWhenArray[i] valueForKey:@"ProductPrice"] floatValue]];

        
        
        model.ProductCount = [[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductCount"]] integerValue];
        
        model.ProductPic = [NSString stringWithFormat:@"%@",self.dataWhenArray[i][@"ProductPic"]];
        

      
        model.ProductId =  [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]];
        
        model.Stock =  [NSString stringWithFormat:@"%@",[dic valueForKey:@"Stock"]];
        
        model.PurchaseMultiple = [NSString stringWithFormat:@"%@",[dic valueForKey:@"PurchaseMultiple"]];
        
        
      
        
        model.LimitAount = [NSString stringWithFormat:@"%@",[dic valueForKey:@"LimitAccount"]];
        
   
        
        [dataArray addObject:model];
    }
    
    if (myTableView) {
        [myTableView reloadData];
    }
    else
    {
        [self setupMainView];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGBCOLOR(245, 246, 248);
    LimitNumber = [NSMutableDictionary dictionary];
    DictPurch = [NSMutableDictionary dictionary];
    dataArray = [[NSMutableArray alloc]init];
    selectGoods = [[NSMutableArray alloc]init];
   
    [self creatData];
    [self Top_View];
    [self setupMainView];
    
    self.title = @"购物车";
    [self getInformation];
}

-(void)getInformation
{
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    
    
    [Post PostgetInformation:urlString VendorId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] ProductTypeId:self.ShopUrl view:self.view];
    
    
    Post.UrlStrAry =^(NSArray *Count){


        NSDictionary *dic = [Count valueForKey:@"Address"];
        
        NSDictionary *dic2 = [Count valueForKey:@"LogisticalMode"];
        
        Phone = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Phone"]];
        Name = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Consignee"]];
        address = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ConsigneeAddress"]];
        addressId = [NSString stringWithFormat:@"%@",[dic valueForKey:@"Id"]];

        
        OrderFullAmount = [NSString stringWithFormat:@"%@",[dic2 valueForKey:@"OrderFullAmount"]];
        
        payType = [Count valueForKey:@"PayTypeList"];
        
        [[NSUserDefaults standardUserDefaults]setObject:payType forKey:@"PayTypeList"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    };
}

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Clear:@"我的购物车"];
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

-(void)selectAllBtnClick:(UIButton*)button
{
    //点击全选时,把之前已选择的全部删除
    [selectGoods removeAllObjects];
    
    button.selected = !button.selected;
    isSelect = button.selected;
    if (isSelect) {
        
        for (CartModel *model in dataArray) {

            [selectGoods addObject:model];
        }
    }
    else
    {
        [selectGoods removeAllObjects];
    }
    
    [myTableView reloadData];
    [self countPrice];
}

//提交订单
-(void)goPayBtnClick
{
    
    NSString *urlString = [NSString stringWithFormat:@"%@ShopCart",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    [Post PostFullCashBack:urlString TotalMoney:[NSString stringWithFormat:@"%@",peice_p] ProductTypeId:[NSString stringWithFormat:@"%@",self.ShopUrl]];
    
    
    Post.UrlStrAry =^(NSArray *Count){
        

        NSString *warn = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
        
        if (![warn isEqualToString:@""]) {

            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:warn preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"继续添加" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }];
            UIAlertAction *call = [UIAlertAction actionWithTitle:@"继续下单" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              
                

                [self ShopCart_GetRebate];
               
                
            }];
            [alert addAction:cancelAction];
            [alert addAction:call];
            [self presentViewController:alert animated:YES completion:nil];
            
        }else{
            [self ShopCart_GetRebate];
        }
        
    };
    
  
    
  
}

#pragma 返利接口
-(void)ShopCart_GetRebate
{
    NSString *urlString = [NSString stringWithFormat:@"%@ShopCart",LinkerAddress];
    
    NSMutableArray *array = [NSMutableArray array];
    
  
    for (NSDictionary *dic in selectGoods) {
         NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        
        [dict setValue:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]] forKey:@"ProductId"];
        
         [dict setValue:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductCount"]] forKey:@"ProductCount"];
        
        [array addObject:dict];
    }

    
    PostUrl_view *post = [[PostUrl_view alloc]init];
    [post PostgetRebate:urlString VendorId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] ProductTypeId:self.ShopUrl ProductList:array view:self.view];
    
    
    
    post.UrlStrAry =^(NSArray *Count){
        
    
        
        
        NSString *Price = [NSString stringWithFormat:@"%@",[Count valueForKey:@"sum"]];
        
        NSString *msg = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
        
        
        
        if (![msg isEqualToString:@"(null)"]) {
            [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",msg] inView:self.view];
            return ;
        }
        
        if ([Price floatValue] <= [OrderFullAmount floatValue]) {
            [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@起送",OrderFullAmount] inView:self.view];
            return ;
        }else{
        
            self.hidesBottomBarWhenPushed = YES;
            SettlementViewControllerNext *settle = [[SettlementViewControllerNext alloc]init];
            settle.ShopUrl = self.ShopUrl;
            settle.payType = payType;
            settle.productArray = [Count valueForKey:@"cartList"];
            settle.All_Money = [Count valueForKey:@"sum"];
            settle.All_MoneyMore = [NSString stringWithFormat:@"%@",peice_p];
            settle.name = [NSString stringWithFormat:@"%@",Name];
            settle.phone = [NSString stringWithFormat:@"%@",Phone];
            settle.address = [NSString stringWithFormat:@"%@",address];
            settle.addressId = [NSString stringWithFormat:@"%@",addressId];
            
            settle.productTypeName = [NSString stringWithFormat:@"%@",[Count valueForKey:@"ProductTypeName"]];
            settle.productTypePic = [NSString stringWithFormat:@"%@",[Count valueForKey:@"ProductTypePic"]];
            
            
    [self.navigationController pushViewController:settle animated:NO];
            
        }
        
       
        
    };
    
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
    
    //全选按钮
    selectAll = [UIButton buttonWithType:UIButtonTypeCustom];
    selectAll.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [selectAll setImage:[UIImage imageNamed:@"NoSelectOne"] forState:UIControlStateNormal];
    [selectAll setImage:[UIImage imageNamed:@"PicSelect"] forState:UIControlStateSelected];
    [selectAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selectAll addTarget:self action:@selector(selectAllBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:selectAll];
    
   
    
    //合计
    UILabel *label = [[UILabel alloc]init];
   // label.text = @"合计: ";
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:label];
    
    //价格
    priceLabel = [[UILabel alloc]init];
  //  priceLabel.text = @"￥0.00";
    priceLabel.font = [UIFont boldSystemFontOfSize:16];
    priceLabel.textColor = [UIColor redColor];
    [bgView addSubview:priceLabel];
    
    //结算按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"去结算" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goPayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bgView addSubview:btn];
    
#pragma mark -- 底部视图添加约束
    //全选按钮
    [selectAll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(18);
        make.top.equalTo(@20);
        make.bottom.equalTo(bgView).offset(-20);
        make.width.equalTo(@20);
        
    }];
    
    UILabel *labelSelect = [[UILabel alloc]initWithFrame:CGRectMake(38 + 8, 20, 50, 20)];
    
    labelSelect.text = @"全选";
    [bgView addSubview:labelSelect];
    
    //结算按钮
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(bgView);
        make.bottom.equalTo(bgView);
        make.width.equalTo(@100);
        
    }];
    
    //价格显示
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btn.mas_left).offset(-10);
        make.top.equalTo(bgView).offset(10);
        make.bottom.equalTo(bgView).offset(-10);
        make.left.equalTo(label.mas_right);
    }];
    
    //合计
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(10);
        make.bottom.equalTo(bgView).offset(-10);
        make.right.equalTo(priceLabel.mas_left);
        make.width.equalTo(@60);
    }];
}

#pragma mark - 设置主视图
-(void)setupMainView
{
    //当购物车为空时,显示默认视图
    if (dataArray.count == 0) {
        [self cartEmptyShow];
    }
    //当购物车不为空时,tableView展示
    else
    {
        UIView *vi = [self.view viewWithTag:TAG_BACKGROUNDVIEW];
        [vi removeFromSuperview];
        
        myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, KScreenHeight - 60 - 0.112 * KScreenHeight) style:UITableViewStylePlain];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.rowHeight = 120;
        myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        myTableView.backgroundColor = RGBCOLOR(245, 246, 248);
        
        [self.view addSubview:myTableView];
        
        [self setupBottomView];
    }
    
}
//购物车为空时的默认视图
-(void)cartEmptyShow
{
    
    //默认视图背景
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    backgroundView.tag = TAG_BACKGROUNDVIEW;
    [self.view addSubview:backgroundView];
    
    //默认图片
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cart_default_bg"]];
    img.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0 - 120);
    img.bounds = CGRectMake(0, 0, 247.0/187 * 100, 100);
    [backgroundView addSubview:img];
    
    UILabel *warnLabel = [[UILabel alloc]init];
    warnLabel.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0 - 10);
    warnLabel.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 30);
    warnLabel.textAlignment = NSTextAlignmentCenter;
    warnLabel.text = @"购物车好空,买点什么呗!";
    warnLabel.font = [UIFont systemFontOfSize:15];
    warnLabel.textColor = kUIColorFromRGB(0x706F6F);
    [backgroundView addSubview:warnLabel];
    
    //默认视图按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0 + 40);
    btn.bounds = CGRectMake(0, 0, SCREEN_WIDTH - 40, 40);
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_background_red"] forState:UIControlStateNormal];
    [btn setTitle:@"去定制" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goToMainmenuView) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:btn];
    
}
-(void)goToMainmenuView
{
    NSLog(@"去首页");
}
#pragma mark - tableView 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[CartTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.isSelected = isSelect;
    
    //是否被选中
    if ([selectGoods containsObject:[dataArray objectAtIndex:indexPath.row]]) {
        cell.isSelected = YES;
    }
    
    //选择回调
    cell.cartBlock = ^(BOOL isSelec){
        
        if (isSelec) {
            [selectGoods addObject:[dataArray objectAtIndex:indexPath.row]];
        }
        else
        {
            [selectGoods removeObject:[dataArray objectAtIndex:indexPath.row]];
        }
        
        if (selectGoods.count == dataArray.count) {
            selectAll.selected = YES;
        }
        else
        {
            selectAll.selected = NO;
        }
        
        [self countPrice];
    };
    __block CartTableViewCell *weakCell = cell;
    cell.numAddBlock =^(){
     //
        
        CartModel *model = [dataArray objectAtIndex:indexPath.row];
        
//        NSDictionary *dic_pic = [[NSUserDefaults standardUserDefaults] valueForKey:@"DictPurch_Pic"];
//        
//        NSString *AddNum = [NSString stringWithFormat:@"%@",[dic_pic valueForKey:[NSString stringWithFormat:@"%@",model.ProductId]]];
        
       NSString *AddNum = [NSString stringWithFormat:@"%@",model.PurchaseMultiple];
    //
        
        NSInteger count = [weakCell.numberLabel.text integerValue];
        count = count + [AddNum integerValue];
        NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
        NSString *Stock = [NSString stringWithFormat:@"%@",model.Stock];
        NSString *LimitAount = [NSString stringWithFormat:@"%@",model.LimitAount];
        if ([numStr integerValue] > [Stock integerValue]) {
            [SKAutoHideMessageView showMessage:@"达到购买上限" inView:self.view];
            
            return ;
        }
        
        if ([numStr integerValue] > [LimitAount integerValue]) {
            [SKAutoHideMessageView showMessage:@"达到购买上限" inView:self.view];
            
            return ;
        }
        
        if ([numStr integerValue] > [Stock integerValue]) {
            [SKAutoHideMessageView showMessage:@"达到购买上限" inView:self.view];
            
            return ;
        }

        
        
        
        weakCell.numberLabel.text = numStr;
        model.ProductCount = count;
        
        [dataArray replaceObjectAtIndex:indexPath.row withObject:model];
        //调用
        
        //调用
        
        
        NSMutableArray *dict_pic = [NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            
            
            NSMutableDictionary *Mdic = [NSMutableDictionary dictionary];
            
            [Mdic setValue:[dict valueForKey:@"ProductId"]forKey:@"ProductId"];
            
            [Mdic setValue:[dict valueForKey:@"ProductName"]forKey:@"ProductName"];
            
            [Mdic setValue:[dict valueForKey:@"ProductCount"]forKey:@"ProductCount"];
            
            [Mdic setValue:[dict valueForKey:@"ProductPic"]forKey:@"ProductPic"];
            
            [Mdic setValue:[dict valueForKey:@"ProductPrice"]forKey:@"ProductPrice"];
            
            [Mdic setValue:[dict valueForKey:@"Stock"]forKey:@"Stock"];
            
//            [Mdic setValue:[dict valueForKey:@"PurchaseMultiple"]forKey:@"PurchaseMultiple"];
            
            [dict_pic addObject:Mdic];
            
        }
       
        //
        dict_pic = [ViewModel storeOrders:dict_pic[indexPath.row] OrderData:dict_pic  isAdded:YES];

       // [selectGoods replaceObjectAtIndex:indexPath.row withObject:model];

        [self countPrice];

    };
    
    cell.numCutBlock =^(){
        
        CartModel *model = [dataArray objectAtIndex:indexPath.row];
        
        NSDictionary *dic_pic = [[NSUserDefaults standardUserDefaults] valueForKey:@"DictPurch_Pic"];
        
        NSString *AddNum = [NSString stringWithFormat:@"%@",[dic_pic valueForKey:[NSString stringWithFormat:@"%@",model.ProductId]]];
        
        NSInteger count = [weakCell.numberLabel.text integerValue];
        count = count - [AddNum integerValue];
        if(count <= 0){
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要删除该商品?删除后无法恢复!" preferredStyle:1];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
         
                 [dataArray removeObjectAtIndex:indexPath.row];
                [selectGoods removeObjectAtIndex:indexPath.row];
                
                //    删除
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                //延迟0.5s刷新一下,否则数据会乱
                [self performSelector:@selector(reloadTable) withObject:nil afterDelay:0.5];
                //刷新数据
                [self countPrice];
                
            }];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:okAction];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
       
        
            return ;
        }
        NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
        
       
        
     //   CartModel *model = [dataArray objectAtIndex:indexPath.row];
        
        weakCell.numberLabel.text = numStr;
        
        model.ProductCount = count;
        [dataArray replaceObjectAtIndex:indexPath.row withObject:model];
        [selectGoods replaceObjectAtIndex:indexPath.row withObject:model];
        [self countPrice];
        
        //
        //调用
        
        
        NSMutableArray *dict_pic = [NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            
          
            
            NSMutableDictionary *Mdic = [NSMutableDictionary dictionary];
            
            [Mdic setValue:[dict valueForKey:@"ProductId"]forKey:@"ProductId"];
            
            [Mdic setValue:[dict valueForKey:@"ProductName"]forKey:@"ProductName"];
            
            [Mdic setValue:[dict valueForKey:@"ProductCount"]forKey:@"ProductCount"];
            
            [Mdic setValue:[dict valueForKey:@"ProductPic"]forKey:@"ProductPic"];
            
            [Mdic setValue:[dict valueForKey:@"ProductPrice"]forKey:@"ProductPrice"];
            
            [Mdic setValue:[dict valueForKey:@"Stock"]forKey:@"Stock"];
            
            //            [Mdic setValue:[dict valueForKey:@"PurchaseMultiple"]forKey:@"PurchaseMultiple"];
            
            [dict_pic addObject:Mdic];
            
        }
       
        //
        dict_pic = [ViewModel storeOrders:dict_pic[indexPath.row] OrderData:dict_pic  isAdded:NO];
        


    };
    

    [cell reloadDataWith:[dataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)reloadTable
{
    [myTableView reloadData];
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要删除该商品?删除后无法恢复!" preferredStyle:1];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            [dataArray removeObjectAtIndex:indexPath.row];
            [selectGoods removeObjectAtIndex:indexPath.row];
            //    删除
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            //延迟0.5s刷新一下,否则数据会乱
            [self performSelector:@selector(reloadTable) withObject:nil afterDelay:0.5];
               [self countPrice];
        }];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:okAction];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillDisappear:(BOOL)animated {
    
    
    self.navigationController.navigationBarHidden = NO;
    
    [super viewWillDisappear:animated];
}

@end
