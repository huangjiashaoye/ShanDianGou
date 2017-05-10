//
//  Sign_ViewController.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/9.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Sign_ViewController.h"


@interface Sign_ViewController ()<UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UIButton *sign_btn2;
    UICollectionView *collectionview;
    UIView *four_view;
    NSArray *ProductData;
    NSArray *array_data ;
    UILabel *pointNum;
}



@end

@implementation Sign_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
   
    [self Top_View];
    [self Second_View];
    [self third_View];
    [self collection];
    [self GetData];
    
}

-(void)GetData{

    NSString *urlString = [NSString stringWithFormat:@"%@Product",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    
    
    [postUrl PostSignList:urlString OrderId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] view:self.view];
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        
        
        ProductData = Count;
        array_data = [Count valueForKey:@"SignProductList"];
        pointNum.text = [NSString stringWithFormat:@"%@",[ProductData valueForKey:@"SumPoint"]];
        
       
      [collectionview reloadData];
       
        
        NSDictionary *dict = [ProductData valueForKey:@"SignInfo"];
        NSString *str = [NSString stringWithFormat:@"%@",[dict valueForKey:@"IsSign"]];
        
        if ([str isEqualToString:@"0"]) {
                [sign_btn2 setTitle:@"签到" forState:UIControlStateNormal];
        }else{
             [sign_btn2 setTitle:@"已签到" forState:UIControlStateNormal];
        }
        
    };
    
}

//
-(void)third_View{

    UIView *third_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight - 4 + 0.28 * KScreenHeight , KScreenWidth, 0.1 * KScreenHeight)];
    third_view.backgroundColor = [UIColor colorWithRed:35/255.0 green:144/255.0 blue:237/255.0 alpha:1.0f];
    [self.view addSubview:third_view];
    //
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth * 0.5 - 0.5, 0.03 * KScreenHeight, 1.0f, 0.04 * KScreenHeight)];
    line.backgroundColor = [UIColor whiteColor];
    line.alpha = 0.6f;
    [third_view addSubview:line];
    
    NSArray *mag = @[@"Doubt",@"PointOrder"];
    NSArray *title = @[@"积分规则",@"积分明细"];
    for (int i = 0; i < mag.count; i ++ ) {
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0.15 * KScreenWidth + 0.5 * KScreenWidth * i, 0.035 * KScreenHeight, 0.03 * KScreenHeight, 0.03 * KScreenHeight)];
        [img setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",mag[i]]]];
        [third_view addSubview:img];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(img.frame.size.width + img.frame.origin.x + 5, img.frame.origin.y, 0.3 * KScreenWidth, img.frame.size.height)];
        label.text = [NSString stringWithFormat:@"%@",title[i]];
        label.textColor = [UIColor whiteColor];
        [third_view addSubview:label];
        
        
        UIButton *sign_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        sign_btn.frame = CGRectMake(KScreenWidth * 0.5 * i , 0, 0.5 * KScreenWidth, third_view.frame.size.height);
        [sign_btn addTarget:self action:@selector(sign_btn:) forControlEvents:UIControlEventTouchUpInside];
        sign_btn.tag = 100 + i;
        [third_view addSubview:sign_btn];
        
    }
    
    
    //
    four_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight - 4 + 0.28 * KScreenHeight + 0.101 * KScreenHeight, KScreenWidth, 0.08 * KScreenHeight)];
    four_view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:four_view];
    
    UIImageView *changeImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 17, 0.08 * KScreenHeight - 34, 0.08 * KScreenHeight - 34)];
    [changeImg setImage:[UIImage imageNamed:@"PointChange"]];
    [four_view addSubview:changeImg];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(changeImg.frame.size.width + changeImg.frame.origin.x + 5, changeImg.frame.origin.y, 0.3 * KScreenWidth, changeImg.frame.size.height)];
    label.text = @"积分兑换";
    label.textColor = [UIColor orangeColor];
    [four_view addSubview:label];
    
    
    UILabel *warnLabel = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 0.4 * KScreenWidth - 10, label.frame.origin.y, 0.4 * KScreenWidth, label.frame.size.height)];
    warnLabel.textColor = [UIColor grayColor];
    warnLabel.text = @"每人每月仅限兑换1件";
    warnLabel.font = [UIFont systemFontOfSize:15.0f];
    [four_view addSubview:warnLabel];
}

//
-(void)sign_btn:(UIButton *)sender
{

//    NSString *urlString = [NSString stringWithFormat:@"%@Tool",LinkerAddress];
//    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
//
//    [postUrl PostGetSignNotice:urlString view:self.view];
//    
//    
//
//    postUrl.UrlStrAry =^(NSArray *Count){
//        
//        NSLog(@"%@",Count);
//        
//      //  [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]  inView:self.view];
//        
//    
//    };
    


  
}

//
-(void)Second_View
{
    UIView *bg_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight - 4, KScreenWidth, 0.28 * KScreenHeight)];
    bg_view.backgroundColor = [UIColor colorWithRed:10/255.0 green:131/255.0 blue:235/255.0 alpha:1.0f];
    [self.view addSubview:bg_view];
    
    //我的积分
    UILabel *point = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.02 * KScreenHeight , KScreenWidth, 20)];
    point.text = @"我的积分";
    point.textColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0f];
    point.textAlignment = NSTextAlignmentCenter;
    [bg_view addSubview:point];
    
    //积分数
    pointNum = [[UILabel alloc]initWithFrame:CGRectMake(0,point.frame.origin.y + point.frame.size.height + 10, KScreenWidth, 40)];

    
    pointNum.font = [UIFont systemFontOfSize:34.0f];
    pointNum.textColor = [UIColor whiteColor];
    pointNum.textAlignment = NSTextAlignmentCenter;
    [bg_view addSubview:pointNum];

    //签到按钮
    sign_btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sign_btn2.frame = CGRectMake(0.35 * KScreenWidth, pointNum.frame.size.height + pointNum.frame.origin.y + 10, 0.3 * KScreenWidth, 0.3 * KScreenWidth / 2.75);
    [sign_btn2 setBackgroundImage:[UIImage imageNamed:@"sign_btn_color"] forState:UIControlStateNormal];
    
    

    
    
    [sign_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sign_btn2 addTarget:self action:@selector(signClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [bg_view addSubview:sign_btn2];
    
    //
    UILabel *point_num = [[UILabel alloc]initWithFrame:CGRectMake(0, sign_btn2.frame.origin.y + sign_btn2.frame.size.height + 16 , KScreenWidth, 20)];
    point_num.text = @"签到可领取1积分";
    point_num.textColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0f];
    point_num.textAlignment = NSTextAlignmentCenter;
    [bg_view addSubview:point_num];
    
}
//
-(void)signClick:(UIButton *)sender
{

    
    [self GetData_Sign];
    
}

-(void)GetData_Sign{
    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    
    
    [postUrl PostSign:urlString OrderId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] view:self.view];
    
    
    postUrl.UrlStrAry =^(NSArray *Count){
        
        
        if ([[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]isEqualToString:@"签到失败!"]) {
            
            [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]] inView:self.view];
            
            return ;
            
        }
        
        
        if ([[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]isEqualToString:@"今日已签到!"]) {
           
            [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]  inView:self.view];
            
        }else{
        
        [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[[Count valueForKey:@"msg"] valueForKey:@"SignMessage"]]  inView:self.view];
        
        }
        [sign_btn2 setTitle:@"已签到" forState:UIControlStateNormal];
        
        [self GetData];
    };
    
}


-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"签到有礼"];
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



-(void)collection
{
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    collectionview =[[UICollectionView alloc] initWithFrame:CGRectMake(0, four_view.frame.origin.y + four_view.frame.size.height + 1, KScreenWidth, KScreenHeight - (four_view.frame.origin.y + four_view.frame.size.height + 1)) collectionViewLayout:flowLayout];
    collectionview.dataSource=self;
    collectionview.delegate=self;
    [collectionview setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0f]];
    
    //注册Cell，必须要有
    [collectionview registerClass:[SignOneCollectionViewCell class] forCellWithReuseIdentifier:@"SignOneCell"];
    
    [self.view addSubview:collectionview];
    
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return array_data.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"SignOneCell";
    SignOneCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *dic = array_data[indexPath.row];
    
  
    
    [cell.img_bg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"PicUrl"]]]];
    
    cell.pointOrage.text = [NSString stringWithFormat:@"%@积分",[dic valueForKey:@"Point"]];
    cell.name.text = [NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductName"]];
    cell.Bule_btn.tag = 1000 + indexPath.row;
    cell.SignChange =^(NSInteger count){
     
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要兑换吗?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }];
        UIAlertAction *call = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

            [self ChangeSignProduct:count - 1000];
            
        }];
        [alert addAction:cancelAction];
        [alert addAction:call];
        [self presentViewController:alert animated:YES completion:nil];
        
        
        
    };

    return cell;
}


-(void)ChangeSignProduct:(NSUInteger)count{
    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *postUrl = [[PostUrl_view alloc]init];
    
    NSDictionary *dic = array_data[count];
    
    //
    [postUrl PostSignChange:urlString VendorId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] ProductId:[NSString stringWithFormat:@"%@",[dic valueForKey:@"ProductId"]] view:self.view];
    
//    [postUrl PostSign:urlString OrderId:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] view:self.view];
//    
//    
    postUrl.UrlStrAry =^(NSArray *Count){
        
  [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]]  inView:self.view];
        
        [self GetData];
    };
    
}


#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(0.5 * KScreenWidth - 1, 0.85 * KScreenWidth - 1);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    //    cell.backgroundColor = [UIColor greenColor];
    
    
   
    
}




//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
