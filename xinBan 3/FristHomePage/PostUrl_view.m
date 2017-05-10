//
//  PostUrl_view.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/6.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "PostUrl_view.h"

@implementation PostUrl_view




#pragma 登陆
-(void)postLogin:(NSString *)url UserAccount:(NSString *)UserAccount Password:(NSString *)Password
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Login" forKey:@"MethodName"];
    [dict setObject:UserAccount forKey:@"UserAccount"];
    [dict setObject:Password forKey:@"Password"];
   
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
 
        // 移除HUD
        [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        
        NSDictionary *dic = responseObject;
        NSString *msg = [NSString stringWithFormat:@"%@",[dic valueForKey:@"msg"]];
       
        
        if (![msg isEqualToString:@"(null)"]) {

            [self urlArrayfeil:msg];
        }else{
        
        //获取数据
        [self urlArray:self.UrlArray];
        
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
        
    });
    
}

#pragma 抢购
-(void)PostGetAdvertisingTime:(NSString *)url
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"getAdvertisingTime" forKey:@"MethodName"];
    
  
   // [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
       // [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
}

#pragma mark - post请求 首页滚动图
-(void)postRequestAction:(NSString *)url SaleChannelId:(NSString *)SaleChannelId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize 
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:SaleChannelId forKey:@"SaleChannelId"];
    [dict setObject:TopIndex forKey:@"TopIndex"];
    [dict setObject:PageIndex forKey:@"PageIndex"];
    [dict setObject:PageSize forKey:@"PageSize"];

   // [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
 
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
    //    [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}



#pragma mark - post请求 首页内容
-(void)postTop:(NSString *)url SaleChannelId:(NSString *)SaleChannelId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:SaleChannelId forKey:@"SaleChannelId"];
    [dict setObject:TopIndex forKey:@"TopIndex"];
    [dict setObject:PageIndex forKey:@"PageIndex"];
    [dict setObject:PageSize forKey:@"PageSize"];
    
//    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
     
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
     
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
        
    });
    
}


#pragma 商家列表
-(void)postSupplier:(NSString *)url VendorId:(NSString *)VendorId PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"getSupplierList" forKey:@"MethodName"];
    [dict setObject:VendorId forKey:@"VendorId"];
    [dict setObject:PageIndex forKey:@"PageIndex"];
    [dict setObject:PageSize forKey:@"PageSize"];
    
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
      
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    
    });

}


#pragma mark - post请求 获取商品分类
-(void)postProductId:(NSString *)url ProductId:(NSString *)SaleChannelId PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:SaleChannelId forKey:@"ProductTypeId"];
    [dict setObject:@"getProductCategrouy" forKey:@"MethodName"];
    [dict setObject:PageIndex forKey:@"PageIndex"];
    [dict setObject:PageSize forKey:@"PageSize"];
    
//    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
     //   [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
        
    });
    
}


//店铺广告文字
#pragma mark - post请求 获取商品分类
-(void)postWebAdvertising:(NSString *)url SaleChannelId:(NSString *)SaleChannelId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize ProductTypeId:(NSString *)ProductTypeId
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"getNews" forKey:@"MethodName"];
    [dict setObject:SaleChannelId forKey:@"SaleChannelId"];
    [dict setObject:TopIndex forKey:@"TopIndex"];
    [dict setObject:PageIndex forKey:@"PageIndex"];
    [dict setObject:PageSize forKey:@"PageSize"];
    [dict setObject:ProductTypeId forKey:@"ProductTypeId"];
    
 
 //   [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    
    });
}


#pragma mark - post请求 获取商品列表
-(void)postData_product:(NSString *)url CategoryId:(NSString *)CategoryId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize ProductTypeId:(NSString *)ProductTypeId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"getProductList" forKey:@"MethodName"];
    [dict setObject:CategoryId forKey:@"CategoryId"];
    [dict setObject:TopIndex forKey:@"TopIndex"];
    [dict setObject:PageIndex forKey:@"PageIndex"];
    [dict setObject:PageSize forKey:@"PageSize"];
    [dict setObject:ProductTypeId forKey:@"ProductTypeId"];
    
  
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
     
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//更新购物车价格
-(void)postCart_Shop:(NSString *)url ProductList:(NSArray *)ProductList
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
  //  session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"UpdateProductPrice" forKey:@"MethodName"];
    [dict setObject:ProductList forKey:@"ProductList"];
  

   // [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

#pragma 满整返现
-(void)PostFullCashBack:(NSString *)url TotalMoney:(NSString *)TotalMoney ProductTypeId:(NSString *)ProductTypeId
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"getFullCashBack" forKey:@"MethodName"];
    [dict setObject:TotalMoney forKey:@"TotalMoney"];
    [dict setObject:ProductTypeId forKey:@"ProductTypeId"];
    

   // [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
     //   [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

#pragma 获取下单时的基本信息
-(void)PostgetInformation:(NSString *)url VendorId:(NSString *)VendorId ProductTypeId:(NSString *)ProductTypeId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"getBaseinFormation" forKey:@"MethodName"];

    
    [dict setObject:VendorId forKey:@"VendorId"];
    [dict setObject:ProductTypeId forKey:@"ProductTypeId"];
    
  //  [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}


#pragma 返利查询
-(void)PostgetRebate:(NSString *)url VendorId:(NSString *)VendorId ProductTypeId:(NSString *)ProductTypeId ProductList:(NSArray *)ProductList view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    

    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"getRebate" forKey:@"MethodName"];
    
    [dict setObject:ProductList forKey:@"ProductList"];
    
    [dict setObject:VendorId forKey:@"VendorId"];
    [dict setObject:ProductTypeId forKey:@"ProductTypeId"];
    
 
  //  [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
    //    [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//提交订单
-(void)PostgetOrder:(NSString *)url VendorId:(NSString *)VendorId ProductTypeId:(NSString *)ProductTypeId ProductItems:(NSArray *)ProductItems  RealPrice:(NSString *)RealPrice AddressId:(NSString *)AddressId PayTypeId:(NSString *)PayTypeId Remark:(NSString *)Remark view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"AddVendorOrders" forKey:@"MethodName"];
    
    [dict setObject:ProductItems forKey:@"ProductItems"];
    [dict setObject:Remark forKey:@"Remark"];
    [dict setObject:VendorId forKey:@"VendorId"];
    [dict setObject:ProductTypeId forKey:@"ProductTypeId"];
    [dict setObject:RealPrice forKey:@"RealPrice"];
    [dict setObject:AddressId forKey:@"AddressId"];
    [dict setObject:PayTypeId forKey:@"PayTypeId"];
    
   
    NSLog(@"%@",dict);
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
    
    
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//支付宝
-(void)PostPayOrder:(NSString *)url OrderNum:(NSString *)OrderNum view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"Alipay" forKey:@"MethodName"];
    
   
    [dict setObject:OrderNum forKey:@"OrderNum"];
    
   
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
    
}

//订单列表
-(void)PostOrderList:(NSString *)url VendorID:(NSString *)VendorID PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize Status:(NSString *)Status view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"GetOrderList" forKey:@"MethodName"];
    
    [dict setObject:VendorID forKey:@"VendorID"];
    [dict setObject:PageIndex forKey:@"PageIndex"];
    [dict setObject:PageSize forKey:@"PageSize"];
    [dict setObject:Status forKey:@"Status"];
 
   
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}


//订单详情
-(void)PostOrderListDetail:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"GetOrderDetails" forKey:@"MethodName"];
    
    [dict setObject:OrderId forKey:@"OrderId"];

    
 //   [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}


//地址列表
-(void)PostAddressList:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"GetAddressList" forKey:@"MethodName"];
    
    [dict setObject:OrderId forKey:@"VendorID"];
    

    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//删除地址
-(void)PostDelAddressList:(NSString *)url OrderId:(NSString *)OrderId AddressId:(NSString *)AddressId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"DeleteAddress" forKey:@"MethodName"];
    [dict setObject:AddressId forKey:@"AddressId"];
    [dict setObject:OrderId forKey:@"VendorId"];
    
    
  //  [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
       // [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//签到商品
-(void)PostSignList:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"GetSignProduct" forKey:@"MethodName"];
    
    [dict setObject:OrderId forKey:@"VendorId"];
    
    
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
        [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 移除HUD
        [MBProgressHUD hideHUD];
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//签到
-(void)PostSign:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"Sign" forKey:@"MethodName"];
    
    [dict setObject:OrderId forKey:@"VendorId"];
    
    
   // [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
       
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
     //   [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
}

//兑换商品
-(void)PostSignChange:(NSString *)url VendorId:(NSString *)VendorId ProductId:(NSString *)ProductId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"ChangeSignProduct" forKey:@"MethodName"];
    [dict setObject:VendorId forKey:@"VendorId"];
    [dict setObject:ProductId forKey:@"ProductId"];
    
    

    
 //   [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     
    
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//获取商家订单总额
-(void)PostSumOrderPrice:(NSString *)url VendorId:(NSString *)VendorId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"GetSumOrderPrice" forKey:@"MethodName"];
    [dict setObject:VendorId forKey:@"VendorId"];
    
    
    
 //   [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
    //    [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//消息列表
-(void)PostMessageList:(NSString *)url VendorId:(NSString *)VendorId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"GetMessgeList" forKey:@"MethodName"];
    [dict setObject:VendorId forKey:@"VendorId"];
    
    
   
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        

        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            self.UrlArray = responseObject;
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            // 提醒有没有新版本
              [MBProgressHUD showError:[NSString stringWithFormat:@"%@",error]];
            
        }];

        
    });
    
    
    
}



//地址
-(void)PostAddressList:(NSString *)url AreaType:(NSString *)AreaType ParentId:(NSString *)ParentId view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"GetAreaList" forKey:@"MethodName"];
    [dict setObject:AreaType forKey:@"AreaType"];
    [dict setObject:ParentId forKey:@"ParentId"];

    
    
  //  [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 移除HUD
      //  [MBProgressHUD hideHUD];
        self.UrlArray = responseObject;
        //获取数据
        [self urlArray:self.UrlArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"post请求失败:%@", error);
        
    }];
    });
    
}

//积分规则

-(void)PostGetSignNotice:(NSString *)url view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    

    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"GetSignNotice" forKey:@"MethodName"];
    
    
    
      [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            self.UrlArray = responseObject;
            
           
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            NSLog(@"post请求失败:%@", error);
            
        }];
    });
    
}

//容云
-(void)PostRongYunToken:(NSString *)url Account:(NSString *)Account view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
//    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"RongYunToken" forKey:@"MethodName"];
    [dict setObject:[NSString stringWithFormat:@"%@",Account] forKey:@"UserAccount"];
    
    
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            
        
            
            
            NSData *st = responseObject;
            NSString *s =  [[NSString alloc]initWithData:st encoding:NSUTF8StringEncoding];
  
            self.UrlArray = s;
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            NSLog(@"post请求失败:%@", error);
            
        }];
    });
    
}


//获取注册验证码
-(void)PostSendCode:(NSString *)url Phone:(NSString *)Phone view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"SendCode" forKey:@"MethodName"];
    [dict setObject:Phone forKey:@"Phone"];
    
    
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
              [MBProgressHUD hideHUD];
            self.UrlArray = responseObject;
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            NSLog(@"post请求失败:%@", error);
            
        }];
    });
    
}


//地址的添加
-(void)InsertAddress:(NSString *)url VendorID:(NSString *)VendorID  ProvinceId:(NSString *)ProvinceId CityId:(NSString *)CityId DistrictId:(NSString *)DistrictId SubDistrictId:(NSString *)SubDistrictId Consignee:(NSString *)Consignee Phone:(NSString *)Phone Detail:(NSString *)Detail view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"InsertAddress" forKey:@"MethodName"];
    [dict setObject:VendorID forKey:@"VendorID"];
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:ProvinceId forKey:@"ProvinceId"];
    [dic setObject:CityId forKey:@"CityId"];
    [dic setObject:DistrictId forKey:@"DistrictId"];
    [dic setObject:SubDistrictId forKey:@"SubDistrictId"];
    [dic setObject:Consignee forKey:@"Consignee"];
    [dic setObject:@"" forKey:@"Tel"];
    [dic setObject:Phone forKey:@"Phone"];
    [dic setObject:Detail forKey:@"Detail"];

    [dict setObject:dic forKey:@"Address"];
    
      
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            self.UrlArray = responseObject;
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            NSLog(@"post请求失败:%@", error);
            
        }];
    });
    
}


//店铺注册
-(void)Register:(NSString *)url Name:(NSString *)Name Password:(NSString *)Password ProvinceId:(NSString *)ProvinceId CityId:(NSString *)CityId DistrictId:(NSString *)DistrictId SubDistrictId:(NSString *)SubDistrictId Tel:(NSString *)Tel Phone:(NSString *)Phone Detail:(NSString *)Detail Referee:(NSString *)Referee StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"Register" forKey:@"MethodName"];
    
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:Name forKey:@"Name"];
    [dic setObject:Password forKey:@"Password"];
    [dic setObject:ProvinceId forKey:@"ProvinceId"];
    [dic setObject:CityId forKey:@"CityId"];
    [dic setObject:DistrictId forKey:@"DistrictId"];
    [dic setObject:SubDistrictId forKey:@"SubDistrictId"];
    [dic setObject:@"" forKey:@"Tel"];
    [dic setObject:Phone forKey:@"Phone"];
    [dic setObject:Detail forKey:@"Detail"];
    [dic setObject:Referee forKey:@"Referee"];
    [dic setObject:StartTime forKey:@"StartTime"];
    [dic setObject:EndTime forKey:@"EndTime"];
    
    [dict setObject:dic forKey:@"VendorItem"];
    
  
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            self.UrlArray = responseObject;
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            NSLog(@"post请求失败:%@", error);
            
        }];
    });
    
}


//获取忘记密码验证码
-(void)PostSendCode_Forget:(NSString *)url Phone:(NSString *)Phone UserAccount:(NSString *)UserAccount view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"SendCode" forKey:@"MethodName"];
    [dict setObject:Phone forKey:@"Phone"];
    [dict setObject:@"UpdatePassword" forKey:@"SendCodeType"];
    [dict setObject:UserAccount forKey:@"UserAccount"];
    
    
    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            self.UrlArray = responseObject;
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            NSLog(@"post请求失败:%@", error);
            
        }];
    });
    
}


//修改密码
-(void)PostUpdatepassword:(NSString *)url Phone:(NSString *)Phone Password:(NSString *)Password view:(UIView *)view
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
    NSString *urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"UpdatePassword" forKey:@"MethodName"];
    [dict setObject:Phone forKey:@"Phone"];
    [dict setObject:Password forKey:@"Password"];

    [MBProgressHUD showMessage:@"正在加载数据中....."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session POST:urlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 移除HUD
            [MBProgressHUD hideHUD];
            self.UrlArray = responseObject;
            //获取数据
            [self urlArray:self.UrlArray];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 移除HUD
            [MBProgressHUD hideHUD];
            NSLog(@"post请求失败:%@", error);
            
        }];
    });
    
}

//Block传值
-(void)urlArray:(NSArray *)urlStr
{
    self.UrlStrAry(urlStr);
}

//Block传值错误
-(void)urlArrayfeil:(NSString *)urlStr
{
    self.UrlStrFail(urlStr);
}




@end
