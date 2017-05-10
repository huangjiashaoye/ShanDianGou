//
//  DogViewController.m
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/17.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "KuaiLaiViewController.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface KuaiLaiViewController ()<UITabBarControllerDelegate>
@property (nonatomic,strong)UIButton *button;
@end

@implementation KuaiLaiViewController
@synthesize button;

#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //  设定button大小为适应图片
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    
    //  这个比较恶心  去掉选中button时候的阴影
    button.adjustsImageWhenHighlighted=NO;
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
    CGPoint center = self.tabBar.center;
    center.y = center.y - buttonImage.size.height/4;
    button.center = center;
    [self.view addSubview:button];
}

-(void)pressChange:(id)sender
{
    self.selectedIndex=1;
    button.selected=YES;
}

#pragma mark- TabBar Delegate

//  换页和button的状态关联上

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==1) {
        button.selected=YES;
    }else
    {
        button.selected=NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBarVC];
    
    // [self addButtonNotifation];
    self.tabBar.barTintColor = [UIColor whiteColor];
}
//添加大圆按钮的通知
-(void)addButtonNotifation{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buttonHidden) name:@"buttonNotifationCenter" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buttonNotHidden) name:@"buttonNotHidden" object:nil];
}
-(void)buttonNotHidden{
    button.hidden=NO;
}
-(void)buttonHidden{
    button.hidden=YES;
}
// 初始化所有子控制器
- (void)setTabBarVC{
    
    
    [self setTabBarChildController:[[FristHomePageViewController alloc] init] title:@"首页" image:@"2x_15@2x" selectImage:@"2x_03@2x"];

    
       [self setTabBarChildController:[[PurchaseOneViewController alloc] init] title:@"进货" image:@"2x_16@2x" selectImage:@"2x_05@2x"];
    
        [self setTabBarChildController:[[OrderAllViewController alloc] init] title:@"订单" image:@"2x_17@2x" selectImage:@"2x_07@2x"];
    
        [self setTabBarChildController:[[MeselfPageViewController alloc] init] title:@"我的" image:@"2x_18@2x" selectImage:@"2x_09@2x"];
}


// 添加tabbar的子viewcontroller
- (void)setTabBarChildController:(UIViewController*)controller title:(NSString*)title image:(NSString*)imageStr selectImage:(NSString*)selectImageStr{
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.tabBarItem.title = title;
    
    nav.tabBarItem.image = [[UIImage imageNamed:imageStr]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageStr]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [nav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:RGBA(74, 74, 74, 1.0)} forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:[UIColor colorWithRed:27/255.0 green:130/255.0 blue:211/255.0 alpha:1.0f]} forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

