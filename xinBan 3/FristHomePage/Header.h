//
//  Header.h
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/3.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#ifndef Header_h
#define Header_h


#endif /* Header_h */
#import <WebKit/WebKit.h>
#import "YUFoldingSectionHeader.h"
#import "YUFoldingTableView.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import "WXApiManager.h"

//下拉刷新
#import "XDRefreshView.h"
//登陆
#import "Sign_one_ViewController.h"
#import "Regist_one_ViewController.h"
#import "Regist_two_ViewController_xib.h"
#import "Forget_one_ViewController.h"
#import "Forget_two_ViewController.h"
//

#import "PostUrl_view.h"
#import "Web_pc_ViewController.h"
#import "KuaiLaiViewController.h"

#import "PanicBuyTableViewCell.h"
#import "DetailProductTableViewCell.h"
#import "FristHomePageViewController.h"
#import "MeselfPageViewController.h"
#import "PurchaseOneViewController.h"
#import "Top_View_BG.h"
#import "PurchTableViewCell.h"
#import "OrderAllViewController.h"
#import "OrderAllTableViewCell.h"

#import "CustomSlider.h"
#import "DetailProductViewController.h"


#import "SDRefresh.h"
//
#import "AFNetworking.h"
#import "HeardTopLikeCollectionViewCell.h"
#import "SKAutoHideMessageView.h"
#import "ViewModel.h"
//分类
#import "UIImageView+WebCache.h"
#import "TopBackground.h"
#import "FoodCell.h"
#import "ShoppingCartCell.h"
#import "OverlayView.h"
#import "ShoppingCartView.h"
#import "BadgeView.h"
#import "BottomPictureTableViewCell.h"
#import "CartViewController.h"
#import "Search_BGViewController.h"
#import "ProductDetailCollectionViewCell.h"
#import "VOTagList.h"


#import "UIButton+WebCache.h"
#import "LeftTableViewCell.h"
#import "ClasscationViewController.h"
#import "SXMarquee.h"
#import "SXHeadLine.h"
#import "IQKeyboardManager.h"


#import "StatueDetailTableViewCell.h"
#import "OrderDetailXiangFristTableViewCell.h"
#import "OrderDetailXiangSectionTableViewCell.h"
#import "OrderWCTableViewCell.h"
#import "OrderDetailXiangThridTableViewCell.h"
#import "OrderDetailXiangFouthTableViewCell.h"
#import "OrderDetailXiangFifthTableViewCell.h"
#import "SetUpOneViewController.h"
//确认订单
#import "SettlementViewControllerNext.h"
#import "SetUpOneTableViewCell.h"
#import "TalkUsOneViewController.h"
#import "TalkUsOneTableViewCell.h"
#import "Product_Pic_detailViewController.h"


#import "Sign_ViewController.h"
#import "SignOneCollectionViewCell.h"
//首页接口

//消息中心
#import "MessageCentViewController.h"
#import "MessageCentTableViewCell.h"

//复选
#import "SingleChooseTable.h"
#import "TableChooseCell.h"
#import "PayAliayOrWeathTableViewCell.h"
#import "OrderDetailOneViewController.h"
#import "OrderNumberOneTableViewCell.h"
#import "NumberCheckTableViewCell.h"
#import "OrderTrackingViewController.h"
#import "OrderTrackingTableViewCell.h"
#import "Tracking_ImgCellTableViewCell.h"
#import "Address_one_ViewController.h"

//地址
#import "AddressListTableViewCell.h"
#import "AddressListViewController.h"
#import "Address_Make_ViewController.h"
#import "LocationPickerVC.h"
#import "UIView+RGSize.h"
//
#import "MBProgressHUD.h"
#import "MBProgressHUD+NJ.h"
//二维码
#import "STQRCodeController.h"
#import "SRActionSheet.h"
//意见反馈
#import "SuggestionViewController.h"
#import <AVFoundation/AVFoundation.h>
//接口地址
#define LinkerAddress @"http://112.124.9.13:8088/Api/"

#import <RongIMKit/RongIMKit.h>
#import <RongIMLib/RongIMLib.h>
#import "RCDCustomServiceViewController.h"

//首页签到兑换
#import "Sign_Product_TableViewCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kScreen_Height      ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Width       ([UIScreen mainScreen].bounds.size.width)
#define kScreen_Frame       (CGRectMake(0, 0 ,kScreen_Width,kScreen_Height))
//16进制RGB的颜色转换
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//R G B 颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//红色
#define BASECOLOR_RED [UIColor \
colorWithRed:((float)((0xED5565 & 0xFF0000) >> 16))/255.0 \
green:((float)((0xED5565 & 0xFF00) >> 8))/255.0 \
blue:((float)(0xED5565 & 0xFF))/255.0 alpha:1.0]


#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight  [UIScreen mainScreen].bounds.size.height

#define SDCellView 0.18 * KScreenHeight

#define SDCollectionView 0.33 * KScreenHeight
#define CellProductHeight 0.2 * KScreenHeight
#define CellSecongHeight  0.15 * KScreenWidth 
#define SetUpOneTableViewCellHeight 0.16 * KScreenWidth

#define SureOrderOneCell 0.148 * KScreenHeight
#define MessageOneCell 0.15 * KScreenHeight
#define SignCell  0.5 * KScreenWidth - 1
#define MessageCell  0.45 * KScreenHeight

#define PrdouctCell  0.05 * KScreenHeight
#define PriceCell  0.23 * KScreenHeight
#define CellHeight 60
#define NumberCheckCell 60


