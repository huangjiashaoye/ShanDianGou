//
//  ViewController.m
//  ZFShoppingCart
//
//  Created by macOne on 15/11/3.
//  Copyright © 2015年 WZF. All rights reserved.
//

#import "ClasscationViewController.h"
#import "FoodCell.h"
#import "ShoppingCartCell.h"
#import "OverlayView.h"
#import "ShoppingCartView.h"
#import "BadgeView.h"
#import "SDRefresh.h"

#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ClasscationViewController ()<UITableViewDataSource,UITableViewDelegate,ZFReOrderTableViewDelegate,CAAnimationDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate,STQRCodeControllerDelegate>
{
    UIButton *cartButton;
    NSInteger _selectIndex;
    BOOL _isScrollDown;
    UIButton *image;
    BOOL flag;
    UIView *viewGray;
    UIButton *buttonTop;
    NSMutableArray *cat;
    NSString *_left;
    NSMutableDictionary *ProductDataArray;
    UIView *white_View;
    UILabel *Price_Red;
    NSString *Advertising;
    SXMarquee *mar3;
    int totlePage;
    float AllMoney_price;
    NSArray *ChartDict;
    NSMutableDictionary *ChartDictId;
    NSInteger ChartNumber;
    float FristPrice;
    UIView *BackView;
    UIImageView *imageButton;
    NSMutableDictionary *DictPurch;
    NSMutableDictionary *Dic_iMG;
    NSMutableDictionary *LimitNumber;
  //  NSMutableArray *ShoppingCartAry;
}
@property (nonatomic,strong) NSArray *TitleArray;
@property (nonatomic,strong) NSMutableArray *TitleMutableArray;

@property (nonatomic,strong) NSMutableArray *ProductdataArray;
@property (nonatomic,strong) NSMutableArray *left_btn_Array;
@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) NSMutableArray *ordersArray;

@property (nonatomic,strong) CALayer *dotLayer;

@property (nonatomic,assign) CGFloat endPointX;

@property (nonatomic,assign) CGFloat endPointY;

@property (nonatomic,strong) UIBezierPath *path;

@property (nonatomic,strong) UITableView *tableView ;
@property (nonatomic,strong) UITableView *Left_tableView ;

@property (nonatomic,assign) NSUInteger totalOrders;

@property BOOL up;

@property (nonatomic,strong) ShoppingCartView *ShopCartView;

@property (nonatomic, strong) NSMutableArray *categoryData;

@property (nonatomic, strong) NSMutableArray *foodData;



@property (nonatomic, weak) SDRefreshFooterView *refreshFooter;




@end

@implementation ClasscationViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    totlePage = 1;
    FristPrice = 0.0f;
    LimitNumber = [NSMutableDictionary dictionary];
    DictPurch = [NSMutableDictionary dictionary];
    ChartDictId = [NSMutableDictionary dictionary];
    Dic_iMG = [NSMutableDictionary dictionary];
    _TitleMutableArray = [NSMutableArray array];
    _ProductdataArray = [NSMutableArray array];
    _left_btn_Array = [NSMutableArray array];
    _dataArray = [NSMutableArray array];
    cat = [NSMutableArray array];
    self.ordersArray = [NSMutableArray array];
    
    _left = @"0";
    
    
    [self GetData_Product];

    self.view.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:234/255.0 alpha:1.0f];
    flag = YES;
    
   
    //tabbar
    [self GetProductId];
   
  
    //
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singTap:)];
//    [tap setNumberOfTapsRequired:1];
//    [self.view addGestureRecognizer:tap];
    
 
}

//-(void)singTap:(UITapGestureRecognizer *)sneder
//{
//    [BackView removeFromSuperview];
//    
//}
//-(void)CreatBackView
//{
//    BackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
//    
//    BackView.backgroundColor = [UIColor colorWithRed:111/255.0 green:111/255.0 blue:111/255.0 alpha:0.7f];
//    
//    
//    [self.view addSubview:BackView];
//    imageButton = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100,(BackView.frame.size.width - 40),(BackView.frame.size.width - 40))];
//    
//    
//    imageButton.layer.masksToBounds = YES;
//    imageButton.layer.cornerRadius = 10.0f;
//    imageButton.layer.borderWidth = 0.5f;
//    imageButton.layer.borderColor = [UIColor grayColor].CGColor;
//    
//    [BackView addSubview:imageButton];
//    
//}


-(void)GetData_Product
{
    
    NSString *urlString = [NSString stringWithFormat:@"%@Product",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    [postUrl postData_product:urlString CategoryId:@"0" TopIndex:@"0" PageIndex:@"1" PageSize:@"20" ProductTypeId:[NSString stringWithFormat:@"%@",self.ShopUrl] view:self.view];
    
    postUrl.UrlStrAry =^(NSArray *Count){
        
    NSString *str = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
        
        if ([str isEqualToString:@"获取信息失败失败!"]) {
//            return ;
            [SKAutoHideMessageView showMessage:str inView:self.view];
            [self.tableView reloadData];
        }else{
        
        for (NSDictionary *dic in Count) {
            
            [_ProductdataArray addObject:dic];
            
        }
    }
        //加载页面
        [self creatUI];
    };
    
}


-(void)GetData_Product:(NSString *)btn_left
{
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [_ProductdataArray removeAllObjects];
        _left = btn_left;
        NSString *urlString = [NSString stringWithFormat:@"%@Product",LinkerAddress];
        PostUrl_view *postUrl = [[PostUrl_view alloc]init];
        
        [postUrl postData_product:urlString CategoryId:[NSString stringWithFormat:@"%@",_left] TopIndex:@"0" PageIndex:@"1" PageSize:@"20" ProductTypeId:[NSString stringWithFormat:@"%@",self.ShopUrl] view:self.view];
        
        postUrl.UrlStrAry =^(NSArray *Count){
            
            NSString *str = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
            
            if ([str isEqualToString:@"获取信息失败失败!"]) {
                //            return ;
                [SKAutoHideMessageView showMessage:str inView:self.view];
                [self.tableView reloadData];
                
            }else{
            
            if (Count.count == 0) {
                
            }else{
            
            for (NSDictionary *dic in Count) {
                
                [_ProductdataArray addObject:dic];
                
             }
                
            }
            [self.tableView reloadData];
            
            }
            
        };

        
    });
    
   
}



-(void)getWebNews{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    NSString *urlString = [NSString stringWithFormat:@"%@WebAdvertising",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    [postUrl postWebAdvertising:urlString SaleChannelId:@"1" TopIndex:@"0" PageIndex:@"0" PageSize:@"0" ProductTypeId:[NSString stringWithFormat:@"%@",self.ShopUrl]];
     
        

        
    postUrl.UrlStrAry =^(NSArray *Count){
        
        
        
        if (Count.count == 0) {
            
        }else{
        
        Advertising = [NSString stringWithFormat:@"%@",[Count[0] valueForKey:@"ContentInfo"]];
       [self Gg_view];
            
        }
        
    };
    });
}

-(void)GetProductId{
    
    [_TitleMutableArray removeAllObjects];
    NSString *urlString = [NSString stringWithFormat:@"%@Product",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    [postUrl postProductId:urlString ProductId:[NSString stringWithFormat:@"%@",self.ShopUrl] PageIndex:@"0" PageSize:@"0"];
    
    postUrl.UrlStrAry =^(NSArray *Count){

      
        for (NSDictionary *dic in Count) {
            [_TitleMutableArray addObject:[dic valueForKey:@"Name"]];

                
            [_left_btn_Array addObject:[dic valueForKey:@"Id"]];
  
        }
        
    };

}


//低栏
-(void)tabbar_View{

    white_View = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight * 0.91, KScreenWidth, 0.09 * KScreenHeight)];
    
   
    white_View.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:white_View];
    
    Price_Red = [[UILabel alloc]initWithFrame:CGRectMake(0.2 * KScreenWidth, 0, 0.5 * KScreenWidth, white_View.frame.size.height)];
    
    Price_Red.text = [NSString stringWithFormat:@"￥ %.2f",FristPrice];
    //@"￥0.00";
    Price_Red.font = [UIFont fontWithName:@"Georgia-Bold" size:18.0f];
    Price_Red.textAlignment = NSTextAlignmentLeft;
    Price_Red.textColor = [UIColor colorWithRed:238/255.0 green:93/255.0 blue:64/255.0 alpha:1.0f];
    
    [white_View addSubview:Price_Red];
    
    
    
    //选好了
    UIButton *GoNext = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    GoNext.frame = CGRectMake(KScreenWidth * 0.66,0, 0.34 * KScreenWidth, white_View.frame.size.height);
    [GoNext setTitle:@"选好了" forState:UIControlStateNormal];
    
     [GoNext addTarget:self action:@selector(clickCartBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [GoNext setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    GoNext.backgroundColor = [UIColor colorWithRed:238/255.0 green:93/255.0 blue:64/255.0 alpha:1.0f];
    [white_View addSubview:GoNext];
    
}
//广告
-(void)Gg_view
{
    UIImageView *bg_color = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth, 0.062 * KScreenHeight)];
    
    [bg_color setImage:[UIImage imageNamed:@"bg_color"]];
    [self.view addSubview:bg_color];
    
    //
    UIImageView *Le = [[UIImageView alloc]initWithFrame:CGRectMake(16, (0.062 * KScreenHeight - 0.032 * KScreenHeight) * 0.5, 0.032 * KScreenHeight, 0.032 * KScreenHeight)];
    [Le setImage:[UIImage imageNamed:@"Instructions"]];
    [bg_color addSubview:Le];
    
    //label
    UIScrollView *GScrollview = [[UIScrollView alloc]init];
    GScrollview.delegate = self;
    GScrollview.frame = CGRectMake(Le.frame.size.width + Le.frame.origin.x + 8, Le.frame.origin.y, KScreenWidth - (Le.frame.size.width + Le.frame.origin.x), Le.frame.size.height);
    
    GScrollview.contentSize = CGSizeMake(KScreenWidth, Le.frame.size.height);
    [bg_color addSubview:GScrollview];

    
    
    mar3 = [[SXMarquee alloc]initWithFrame:CGRectMake(0, 0,KScreenWidth - (Le.frame.size.width + Le.frame.origin.x), Le.frame.size.height) speed:3 Msg:Advertising bgColor:[UIColor clearColor] txtColor:[UIColor colorWithRed:241/255.0 green:89/255.0 blue:74/255.0 alpha:1.0f]];
    [mar3 changeMarqueeLabelFont:[UIFont boldSystemFontOfSize:14.0f]];
    [mar3 start];
    [GScrollview addSubview:mar3];
    
    
}


-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
//搜索框
-(void)SearchBtn
{
   //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(10, 0.1 * KScreenWidth - 3, 30, 30);
    [back setBackgroundImage:[UIImage imageNamed:@"back_pic_view.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    
        UIView *bg_view = [[UIView alloc]initWithFrame:CGRectMake(0.14 * KScreenWidth, 0.1 * KScreenWidth - 3,  0.72 *KScreenWidth, 30)];
        
        bg_view.backgroundColor = [UIColor whiteColor];
        bg_view.layer.masksToBounds = YES;
        bg_view.layer.cornerRadius = 5.0f;
        bg_view.layer.borderColor = [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1.0f].CGColor;
        bg_view.layer.borderWidth = 0.5f;
        [self.view addSubview:bg_view];
        
        //搜索图片
        UIImageView *search = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 20, 20)];
        [search setImage:[UIImage imageNamed:@"choicelocation_search"]];
        [bg_view addSubview:search];
        
        //搜索框
        UIButton *feild = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        feild.frame =  CGRectMake(10, search.frame.origin.y, bg_view.frame.size.width - (search.frame.origin.x + search.frame.size.width + 8), search.frame.size.height);
        
        
        [feild setTitle:@"请输入商品,品牌名称进行搜索" forState:UIControlStateNormal] ;
        [feild setTitleColor:[UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1.0f] forState:UIControlStateNormal];
        [feild addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        feild.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [bg_view addSubview:feild];
    
    
    UIButton *photo_pic = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    photo_pic.frame = CGRectMake(KScreenWidth - 10 - 28, 0.1 * KScreenWidth - 3 + 4, 22, 22);
    [photo_pic setBackgroundImage:[UIImage imageNamed:@"Photo_pic"] forState:UIControlStateNormal];
    [photo_pic addTarget:self action:@selector(searchProdcutId:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:photo_pic];

}

-(void)searchProdcutId:(UIButton *)sender
{
    STQRCodeController *codeVC = [[STQRCodeController alloc]init];
    codeVC.delegate = self;
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:codeVC];
    [self presentViewController:navVC animated:YES completion:nil];
}

#pragma mark - --- 2.delegate 视图委托 ---
- (void)qrcodeController:(STQRCodeController *)qrcodeController readerScanResult:(NSString *)readerScanResult type:(STQRCodeResultType)resultType
{
    NSLog(@"%@",readerScanResult);
   
}

-(void)click
{
    
    Search_BGViewController *car = [[Search_BGViewController alloc]init];
    [self presentViewController:car animated:NO completion:nil];
    
}


-(void)creatUI{
 
   Top_View_BG *top = [[Top_View_BG alloc]init];
   [top TopView:self.view];
   [self SearchBtn];
    
    
  // [self Gg_view];
   [self tabbar_View];
    
   [self Left_tableView_One];

    
    
    //购物车
    cartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // [cartButton setUserInteractionEnabled:NO];
    [cartButton setBackgroundImage:[UIImage imageNamed:@"shyoppingcart"] forState:UIControlStateNormal];
    
    cartButton.frame = CGRectMake(20, 0.02 * KScreenHeight, 0.06 * KScreenHeight,0.06 * KScreenHeight);
    [cartButton addTarget:self action:@selector(clickCartBtn:) forControlEvents:UIControlEventTouchUpInside];
    [white_View addSubview:cartButton];
    
    _ShopCartView = [[ShoppingCartView alloc] initWithFrame:CGRectMake(45, 0.99 * KScreenHeight, 0.06 * KScreenHeight, 0.06 * KScreenHeight) inView:self.view withObjects:nil];
    
    _ShopCartView.parentView = self.view;
    _ShopCartView.OrderList.delegate = self;
    _ShopCartView.OrderList.tableView.delegate = self;
    _ShopCartView.OrderList.tableView.dataSource = self;
    _ShopCartView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_ShopCartView];
    
    //
    _totalOrders = ChartNumber;
    _ShopCartView.badge.badgeValue = [NSString stringWithFormat:@"%ld",(long)ChartNumber];

    CGRect rect = [self.view convertRect:_ShopCartView.shoppingCartBtn.frame fromView:_ShopCartView];
    //
    _endPointX = rect.origin.x + 15;
    _endPointY = rect.origin.y + 35;
    
    
    //左边按钮 默认选择
    [self.Left_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    
    
   // [self searchBarView];
    

    //滑动监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(checkData:) name:@"ListNumber" object:nil];
}

-(void)Left_tableView_One
{
    self.Left_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0.174 * KScreenHeight, 80, KScreenHeight * 0.826 - 0.09 * KScreenHeight - 1)];
    self.Left_tableView.delegate = self;
    self.Left_tableView.dataSource = self;
    
    
    self.Left_tableView.showsVerticalScrollIndicator = NO;
    [self.Left_tableView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:@"_Left"];
    
    [self.view addSubview:self.Left_tableView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(80, 0.174 * KScreenHeight, self.view.bounds.size.width - 80, KScreenHeight * 0.826 - 0.09 * KScreenHeight - 1)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //
    
    [self.tableView registerClass:[BottomPictureTableViewCell class] forCellReuseIdentifier:@"BottomPictureTableViewCell"];
    
    self.Left_tableView.separatorStyle = self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
     [self setupFooter];
}

//设置通知二维码扫描之后的事情
-(void)checkData:(NSNotification *)notify
{
    NSDictionary *dic = [notify userInfo];
    NSString *str = [NSString stringWithFormat:@"%@",[dic valueForKey:@"listnumber"]];
    
    //左边按钮 默认选择
    [self.Left_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[str intValue] inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
}




-(void)clickCartBtn:(UIButton *)sender
{
    NSArray *data = self.ordersArray;
    
    
    
    if (data.count == 0) {
        
        [SKAutoHideMessageView showMessage:@"购物车为空" inView:self
         .view];
        
    }else{
    
    NSMutableArray *array = [NSMutableArray array];
    
    
    for (int i = 0; i < data.count; i++) {
 
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic = data[i];
        [dic removeObjectForKey:@"ProductName"];
        [array addObject:dic];
    }
   
        
    
        
    NSString *urlString = [NSString stringWithFormat:@"%@ShopCart",LinkerAddress];
    //更新购物车价格
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    [Post postCart_Shop:urlString ProductList:array];
    
    Post.UrlStrAry =^(NSArray *Count){
        
        
      
        
        if (Count.count) {
            
        
            
            self.hidesBottomBarWhenPushed = YES;
            CartViewController *car = [[CartViewController alloc]init];

            car.dataWhenArray = Count;
            car.ShopUrl = self.ShopUrl;
            [self.navigationController pushViewController:car animated:YES];
            self.hidesBottomBarWhenPushed = YES;
            
            car.TopOrderNumbers = ^(NSInteger totalOrders){
                
                _totalOrders = totalOrders;
                
            _ShopCartView.badge.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)_totalOrders];
                
            };
            

            
        }else{
            [SKAutoHideMessageView showMessage:@"购物车为空" inView:self
             .view];
        }

        
        
    };

    }
    
   }

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger count = 0;
    if ([tableView isEqual:self.tableView]) {
        if (section == 0) {
            count = [_ProductdataArray count];
        }else{
            count = 0;
        }
    }else if ([tableView isEqual:self.Left_tableView]){
        return _TitleMutableArray.count;
    }
    
    return count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([tableView isEqual:self.tableView]) {
        return 2;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    
    
    if ([tableView isEqual:self.Left_tableView]) {
        
        LeftTableViewCell *cell = (LeftTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"_Left"];
        cell.name.text = [NSString stringWithFormat:@"%@",_TitleMutableArray[indexPath.row]];
        
        return cell;
        
        
    }else{
        
            static NSString *cellID = @"FoodCell";
            
            FoodCell *cell = (FoodCell *) [tableView dequeueReusableCellWithIdentifier:cellID];
            
            
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:cellID owner:nil options:nil] lastObject];
                
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
                if (_ProductdataArray.count == 0) {
                    
                }else{
                
        NSDictionary *Dic = _ProductdataArray[indexPath.row];
                
        [cell setmaintablecell:Dic];
 
        [cell showOrderNumberTwos:[cell.orderCount.text integerValue]];
  
                          
        cell.foodId = [_ProductdataArray[indexPath.row][@"Id"] integerValue];
          
        
            if (ChartDictId) {
                     
            cell.orderCount.text = [NSString stringWithFormat:@"%@",[ChartDictId valueForKey:[NSString stringWithFormat:@"%ld",(long)cell.foodId]]];
                
            [cell showOrderNumbers_Pic:[cell.orderCount.text integerValue]];

            }
                  
        
            [Dic_iMG setValue:[NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"PicUrl"]] forKey:[NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"Id"]]];
                    
        
            [DictPurch setValue:[NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"PurchaseMultiple"]] forKey:[NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"Id"]]];
            
            [LimitNumber setValue:[NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"LimitAccount"]] forKey:[NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"Id"]]];
          
        // 倍增倍减
            [[NSUserDefaults standardUserDefaults]setObject:DictPurch forKey:@"DictPurch_Pic"];
       
        //限购
        [[NSUserDefaults standardUserDefaults]setObject:LimitNumber forKey:@"LimitNumber_Pic"];
        [[NSUserDefaults standardUserDefaults]synchronize];
                    
             cell.btn_Click = ^(NSString *productId){
                 
//                 
//                 NSString *img = [NSString stringWithFormat:@"%@",[Dic_iMG valueForKey:[NSString stringWithFormat:@"%@",productId]]];
                 
                 
                 
              //   [self CreatBackView];
                 
              
//                 [imageButton sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",img]]];
                  
                 
             };
                    
                    
        cell.Stock =  [NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"Stock"]];
              
                }
                __weak __typeof(&*cell)weakCell =cell;
                __block __typeof(self)bself = self;
                cell.plusBlock = ^(NSInteger nCount,NSString *productId,BOOL animated)
                {
                   
                    //存储
        [ChartDictId setValue:[NSString stringWithFormat:@"%ld",(long)nCount] forKey:[NSString stringWithFormat:@"%ld",(long)weakCell.foodId]];
                    

                    
                    //
        NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:_ProductdataArray[indexPath.row]];
                
                   
                    
        [dic setObject:[NSNumber numberWithInteger:nCount] forKey:@"ProductCount"];
                   
                    [dic removeObjectForKey:@"Articlenumber"];
                    [dic removeObjectForKey:@"Describe"];
                    [dic removeObjectForKey:@"Keyword"];
                    [dic removeObjectForKey:@"PnCode"];
                    [dic removeObjectForKey:@"ProductIntro"];
                    [dic removeObjectForKey:@"SalesName"];
                    
                    
                   
//                    [dic setValue:[dic valueForKey:@"LimitAccount"] forKey:@"LimitAccount_ount"];
//                    
//                   [dic setValue:[dic valueForKey:@"PurchaseMultiple"] forKey:@"PurchaseMultiple"];
//                    
                  
                    [dic setValue:[dic valueForKey:@"Id"] forKey:@"ProductId"];
                    
                    [dic setValue:[dic valueForKey:@"PicUrl"] forKey:@"ProductPic"];
                    
                    [dic setValue:[dic valueForKey:@"Price"] forKey:@"ProductPrice"];
                    
                    
                    [dic removeObjectForKey:@"Id"];
                    [dic removeObjectForKey:@"PicUrl"];
                    [dic removeObjectForKey:@"Price"];
                    
         

                                       /**
                     *  是否执行添加的动画
                     */
                    if (animated) {
                        
         
                        bself.ordersArray = [ViewModel storeOrders:dic OrderData:self.ordersArray isAdded:YES];
                        
                
                        
                        
                    } else{
                        
                        bself.ordersArray = [ViewModel storeOrders:dic OrderData:self.ordersArray isAdded:NO];
                        
                    }

                 
                    //
          
                    CGRect parentRect = [weakCell convertRect:weakCell.plus.frame toView:self.view];
             
               
                    
                    NSString *AddNum = [NSString stringWithFormat:@"%@",[_ProductdataArray[indexPath.row] valueForKey:@"PurchaseMultiple"]];
                    
               
                    
                    if (animated) {
                        [self JoinCartAnimationWithRect:parentRect];
                        _totalOrders = _totalOrders + [AddNum integerValue];
                    }
                    else
                    {
                        _totalOrders = _totalOrders - [AddNum integerValue];;
                    }
                    
                 
                    
                    _ShopCartView.badge.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)_totalOrders];
                    [self setCartImage];
                    
                  
                };
                
            }
            
            return cell;

    }
    return cell;
    
}

#pragma mark -加入购物车动画
-(void) JoinCartAnimationWithRect:(CGRect)rect
{
    
    CGFloat startX = rect.origin.x;
    CGFloat startY = rect.origin.y;
    
    
    
    _path= [UIBezierPath bezierPath];
    [_path moveToPoint:CGPointMake(startX, startY)];
    //三点曲线
    [_path addCurveToPoint:CGPointMake(_endPointX, _endPointY)
             controlPoint1:CGPointMake(startX , startY)
             controlPoint2:CGPointMake(startX - 50, startY - 70)];
    
    _dotLayer = [CALayer layer];
    _dotLayer.backgroundColor = [UIColor redColor].CGColor;
    _dotLayer.frame = CGRectMake(0, 0, 15, 15);
    _dotLayer.cornerRadius = (15 + 15) /4;
    [self.view.layer addSublayer:_dotLayer];
    [self groupAnimation];
    
}
#pragma mark - 组合动画
-(void)groupAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = _path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = 0.5f;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation];
    groups.duration = 0.8f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [_dotLayer addAnimation:groups forKey:nil];
    
    [self performSelector:@selector(removeFromLayer:) withObject:_dotLayer afterDelay:0.78f];
    
}
- (void)removeFromLayer:(CALayer *)layerAnimation{
    
    [layerAnimation removeFromSuperlayer];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if ([[anim valueForKey:@"animationName"]isEqualToString:@"groupsAnimation"]) {
        
        CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        shakeAnimation.duration = 0.25f;
        shakeAnimation.fromValue = [NSNumber numberWithFloat:0.9];
        shakeAnimation.toValue = [NSNumber numberWithFloat:1];
        shakeAnimation.autoreverses = YES;
        [_ShopCartView.shoppingCartBtn.layer addAnimation:shakeAnimation forKey:nil];
    }
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.Left_tableView]) {
        return 54;
    }
    return SDCellView;
}



-(void)setCartImage
{

    AllMoney_price = 0.0f;

    for (NSDictionary *dic in self.ordersArray) {
        
        NSString *ProductCount = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductCount"]];
        
        NSString *ProductPrice = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductPrice"]];
        

        AllMoney_price = [ProductCount floatValue] * [ProductPrice floatValue] + AllMoney_price;
    }
    
    Price_Red.text = [NSString stringWithFormat:@"￥%.2f",AllMoney_price];
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.tableView]) {
        
    }else{

        [self GetData_Product:[NSString stringWithFormat:@"%@",_left_btn_Array[indexPath.row]]];
   
    }
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBarHidden = YES;
    
    [super viewWillAppear:animated];
    [self getWebNews];
    
    
    
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]valueForKey:@"FristShopCartDic"];
    

    ChartDict = [dic valueForKey:@"ShopCartDic"];
  
    
    
    [self.ordersArray removeAllObjects];
    FristPrice = 0.0f;
    ChartNumber = 0.0f;
    for (NSMutableDictionary *dic in ChartDict) {
        
        
        self.ordersArray = [ViewModel storeOrders:dic OrderData:self.ordersArray isAdded:YES];

        //
        [ChartDictId setValue:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductCount"]] forKey:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]]];
        
        NSString *str_num = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductCount"]];
        
        NSString *str_price = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductPrice"]];
        
        ChartNumber = ChartNumber + [str_num integerValue];
        
         
        
        FristPrice = FristPrice + [str_num integerValue] * [str_price floatValue];
        
        [self.tableView reloadData];
}
    _ShopCartView.badge.badgeValue = [NSString stringWithFormat:@"%ld",(long)ChartNumber];
    Price_Red.text = [NSString stringWithFormat:@"￥ %.2f",FristPrice];

    


}

- (void)viewWillDisappear:(BOOL)animated {
    
    
    self.navigationController.navigationBarHidden = NO;
    
    [super viewWillDisappear:animated];
}


- (void)setupFooter
{
    SDRefreshFooterView *refreshFooter = [SDRefreshFooterView refreshViewWithStyle:SDRefreshViewStyleClassical];
    [refreshFooter addToScrollView:self.tableView];
    [refreshFooter addTarget:self refreshAction:@selector(footerRefresh)];
    _refreshFooter = refreshFooter;
}
//上拉刷新
- (void)footerRefresh
{
   
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            totlePage ++;

            [self GetData_Product_right:_left totlePage:[NSString stringWithFormat:@"%d",totlePage]];
            
            [self.refreshFooter endRefreshing];
            
        });
  
}


-(void)GetData_Product_right:(NSString *)btn_left totlePage:(NSString *)totlePage2
{
   
    _left = btn_left;
    NSString *urlString = [NSString stringWithFormat:@"%@Product",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    [postUrl postData_product:urlString CategoryId:[NSString stringWithFormat:@"%@",_left] TopIndex:@"0" PageIndex:[NSString stringWithFormat:@"%@",totlePage2] PageSize:@"20" ProductTypeId:[NSString stringWithFormat:@"%@",self.ShopUrl]view:self.view];
    
    postUrl.UrlStrAry =^(NSArray *Count){

        NSString *str = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
        
        if ([str isEqualToString:@"获取信息失败失败!"]) {
            //            return ;
            [SKAutoHideMessageView showMessage:str inView:self.view];
            [self.tableView reloadData];
        }else{
        
        for (NSDictionary *dic in Count) {
            
            [_ProductdataArray addObject:dic];
            
        }
        [self.tableView reloadData];
            
        }
        
    };
    
}

@end
