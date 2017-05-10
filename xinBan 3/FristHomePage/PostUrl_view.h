//
//  PostUrl_view.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/6.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"



@interface PostUrl_view : NSObject<MBProgressHUDDelegate>


@property (copy, nonatomic) void (^UrlStrAry)(NSArray *Count);
@property (copy, nonatomic) void (^UrlStrFail)(NSString *Count);


@property(nonatomic,copy)NSArray *UrlArray;


#pragma 抢购
-(void)PostGetAdvertisingTime:(NSString *)url;

//登陆

-(void)postLogin:(NSString *)url UserAccount:(NSString *)UserAccount Password:(NSString *)Password;



-(void)postRequestAction:(NSString *)url SaleChannelId:(NSString *)SaleChannelId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize;

-(void)postTop:(NSString *)url SaleChannelId:(NSString *)SaleChannelId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize view:(UIView *)view
;

-(void)postSupplier:(NSString *)url VendorId:(NSString *)VendorId PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize;


-(void)postProductId:(NSString *)url ProductId:(NSString *)SaleChannelId PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize;

-(void)postWebAdvertising:(NSString *)url SaleChannelId:(NSString *)SaleChannelId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize ProductTypeId:(NSString *)ProductTypeId;

#pragma mark - post请求 获取商品列表

-(void)postData_product:(NSString *)url CategoryId:(NSString *)CategoryId TopIndex:(NSString *)TopIndex PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize ProductTypeId:(NSString *)ProductTypeId view:(UIView *)view;

//更新购物车价格
-(void)postCart_Shop:(NSString *)url ProductList:(NSArray *)ProductList;

#pragma 满整返现
-(void)PostFullCashBack:(NSString *)url TotalMoney:(NSString *)TotalMoney ProductTypeId:(NSString *)ProductTypeId;

#pragma 返利查询
-(void)PostgetRebate:(NSString *)url VendorId:(NSString *)VendorId ProductTypeId:(NSString *)ProductTypeId ProductList:(NSArray *)ProductList view:(UIView *)view;

//提交订单
-(void)PostgetOrder:(NSString *)url VendorId:(NSString *)VendorId ProductTypeId:(NSString *)ProductTypeId ProductItems:(NSArray *)ProductItems  RealPrice:(NSString *)RealPrice AddressId:(NSString *)AddressId PayTypeId:(NSString *)PayTypeId Remark:(NSString *)Remark view:(UIView *)view;

#pragma 获取下单时的基本信息
-(void)PostgetInformation:(NSString *)url VendorId:(NSString *)VendorId ProductTypeId:(NSString *)ProductTypeId view:(UIView *)view;

//支付宝
-(void)PostPayOrder:(NSString *)url OrderNum:(NSString *)OrderNum view:(UIView *)view;

//订单列表
-(void)PostOrderList:(NSString *)url VendorID:(NSString *)VendorID PageIndex:(NSString *)PageIndex PageSize:(NSString *)PageSize Status:(NSString *)Status view:(UIView *)view;


//订单详情
-(void)PostOrderListDetail:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view;

//地址列表
-(void)PostAddressList:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view;

//删除地址
-(void)PostDelAddressList:(NSString *)url OrderId:(NSString *)OrderId AddressId:(NSString *)AddressId view:(UIView *)view;

-(void)PostSignList:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view;


//签到
-(void)PostSign:(NSString *)url OrderId:(NSString *)OrderId view:(UIView *)view;

//兑换商品
-(void)PostSignChange:(NSString *)url VendorId:(NSString *)VendorId ProductId:(NSString *)ProductId view:(UIView *)view;

//获取商家订单总额
-(void)PostSumOrderPrice:(NSString *)url VendorId:(NSString *)VendorId view:(UIView *)view;

//消息列表
-(void)PostMessageList:(NSString *)url VendorId:(NSString *)VendorId view:(UIView *)view;

//地址
-(void)PostAddressList:(NSString *)url AreaType:(NSString *)AreaType ParentId:(NSString *)ParentId view:(UIView *)view;

//积分规则

-(void)PostGetSignNotice:(NSString *)url view:(UIView *)view;

//容云
-(void)PostRongYunToken:(NSString *)url Account:(NSString *)Account view:(UIView *)view;

//获取注册验证码
-(void)PostSendCode:(NSString *)url Phone:(NSString *)Phone view:(UIView *)view;

//地址的添加
-(void)InsertAddress:(NSString *)url VendorID:(NSString *)VendorID  ProvinceId:(NSString *)ProvinceId CityId:(NSString *)CityId DistrictId:(NSString *)DistrictId SubDistrictId:(NSString *)SubDistrictId Consignee:(NSString *)Consignee Phone:(NSString *)Phone Detail:(NSString *)Detail view:(UIView *)view;


//店铺注册
-(void)Register:(NSString *)url Name:(NSString *)Name Password:(NSString *)Password ProvinceId:(NSString *)ProvinceId CityId:(NSString *)CityId DistrictId:(NSString *)DistrictId SubDistrictId:(NSString *)SubDistrictId Tel:(NSString *)Tel Phone:(NSString *)Phone Detail:(NSString *)Detail Referee:(NSString *)Referee StartTime:(NSString *)StartTime EndTime:(NSString *)EndTime view:(UIView *)view;

//获取忘记密码验证码
-(void)PostSendCode_Forget:(NSString *)url Phone:(NSString *)Phone UserAccount:(NSString *)UserAccount view:(UIView *)view;


//修改密码
-(void)PostUpdatepassword:(NSString *)url Phone:(NSString *)Phone Password:(NSString *)Password view:(UIView *)view;


@end
