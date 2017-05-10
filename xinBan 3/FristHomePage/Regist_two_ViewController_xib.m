//
//  Regist_two_ViewController_xib.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/13.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "Regist_two_ViewController_xib.h"

@interface Regist_two_ViewController_xib ()<UIPickerViewDataSource, UIPickerViewDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate>
{
    NSMutableArray *CityAry;
    NSMutableArray *DistrictListAry;
    NSMutableArray *SubDistrictAry;
    NSString *P,*S,*Q,*J;
    NSString *P_id,*S_id,*Q_id,*J_id;
}


@property (strong, nonatomic) IBOutlet UIPickerView *myPicker;
@property (strong, nonatomic) IBOutlet UIView *pickerBgView;


@property (strong, nonatomic) UIView *maskView;
//data
@property (strong, nonatomic) NSDictionary *pickerDic;
@property (strong, nonatomic) NSArray *provinceArray;
@property (strong, nonatomic) NSArray *cityArray;
@property (strong, nonatomic) NSArray *townArray;
@property (strong, nonatomic) NSArray *selectedArray;

@end



@implementation Regist_two_ViewController_xib

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
    [self Top_View];
    [self Top_Second_View];
    [self TopThird_View];
    
    [self initView];
    
    
  
    
    UITextField *phone_text = (UITextField *)[self.view viewWithTag:5201];
    
    UITextField *pass_text = (UITextField *)[self.view viewWithTag:5202];
    
    phone_text.text = [NSString stringWithFormat:@"%@",self.Phone_text];
    
    pass_text.text = [NSString stringWithFormat:@"%@",self.pass_text];
}


//
-(void)TopThird_View
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight + 94 + 10, KScreenWidth, KScreenHeight - (0.112 * KScreenHeight + 94 + 10))];
    
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    NSArray *ary = @[@"店铺名称",@"手机号码",@"登陆密码",@"省、市、区",@"详细地址",@"营业时间"];
    
    NSArray *aryPlace =@[@"店铺名称",@"登录时使用的手机号码",@"字母、数字、符号组合",@"省市区",@"详细地址",@"示例 ： 9:00 ～ 18:00"];
    
    for (int i = 0; i < ary.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50 * i + 6, KScreenWidth * 0.24, 40)];
        label.text = [NSString stringWithFormat:@"%@",ary[i]];
        label.font = [UIFont systemFontOfSize:14.5f];
        
        [view addSubview:label];
        
        UITextField *textFeild = [[UITextField alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, label.frame.origin.y, KScreenWidth - (label.frame.size.width + label.frame.origin.x + 0.05 * KScreenWidth), 40)];
        textFeild.tag = 5200 + i;
        textFeild.borderStyle = UITextBorderStyleNone;
        textFeild.delegate = self;
        textFeild.placeholder = [NSString stringWithFormat:@"%@",aryPlace[i]];
        [view addSubview:textFeild];
        
        //
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x, textFeild.frame.origin.y + textFeild.frame.size.height + 4.5, textFeild.frame.size.width + label.frame.size.width, 0.5f)];
        
        line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
        
        [view addSubview:line];
        
        if (i == 2) {
            textFeild.secureTextEntry = YES;
        }
        
        if (i == 3) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            button.frame = CGRectMake(0,0, textFeild.frame.size.width, textFeild.frame.size.height);
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [textFeild addSubview:button];
            
            
            
        }

        
        
        
    }
    
    
}


-(void)Top_Second_View
{
    UIImageView *top = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0.112 * KScreenHeight, KScreenWidth,94)];
    [top setImage:[UIImage imageNamed:@"Check_Information"]];
    [self.view addSubview:top];
}

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"用户注册"];
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(10, 0.1 * KScreenWidth - 3, 30, 30);
    [back setBackgroundImage:[UIImage imageNamed:@"back_pic_view.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    
    //下一步
    UIButton *next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    next.frame = CGRectMake(KScreenWidth - 65, 0.1 * KScreenWidth, 50, 30);
    [next setTitle:@"提交" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(sure_btn:) forControlEvents:UIControlEventTouchUpInside];
    
    [next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:next];
}




-(void)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - init view
- (void)initView {
    
    self.maskView = [[UIView alloc] initWithFrame:kScreen_Frame];
    self.maskView.backgroundColor = [UIColor blackColor];
    self.maskView.alpha = 0;
    [self.maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideMyPicker)]];
    
    self.pickerBgView.width = kScreen_Width;
}


#pragma mark - UIPicker Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        
        return self.ProvinceName.count;
        
    } else if (component == 1) {
        
        return CityAry.count;
        
    } else if (component == 2) {
        
        return DistrictListAry.count;
        
    } else {
        
        return SubDistrictAry.count;
        
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        return [NSString stringWithFormat:@"%@",[[self.ProvinceName valueForKey:@"ProvinceName"] objectAtIndex:row]];
    }
    if (component == 1) {
        
        return [NSString stringWithFormat:@"%@",[[CityAry valueForKey:@"CityName"] objectAtIndex:row]];
        
    }
    if (component == 2) {
        
        return [NSString stringWithFormat:@"%@",[[DistrictListAry valueForKey:@"DistrictName"] objectAtIndex:row]];
        
    }
    
    if (component == 3) {
        
        return [NSString stringWithFormat:@"%@",[[SubDistrictAry valueForKey:@"SubDistrictName"] objectAtIndex:row]];
        
    }
    
    return nil;
    
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return (KScreenWidth - 40) * 0.25 ;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    UITextField *text_Name = (UITextField *)[self.view viewWithTag:5203];
    
    if (component == 0) {
        
        NSString *urlString = [NSString stringWithFormat:@"%@Tool",LinkerAddress];
        PostUrl_view *Post = [[PostUrl_view alloc]init];
        CityAry = [NSMutableArray array];
        
        [Post PostAddressList:urlString AreaType:@"2" ParentId:[NSString stringWithFormat:@"%@",[[self.ProvinceName valueForKey:@"ProvinceId"] objectAtIndex:row]] view:self.view];
        
        Post.UrlStrAry =^(NSArray *Count){
            
            
            for (NSDictionary *dic in Count) {
                [CityAry addObject:dic];
            }
            
            P_id = [NSString stringWithFormat:@"%@",[[self.ProvinceName valueForKey:@"ProvinceId"] objectAtIndex:row]];
            
            P = [NSString stringWithFormat:@"%@",[[self.ProvinceName valueForKey:@"ProvinceName"] objectAtIndex:row]];
            
            [pickerView reloadComponent:1];
        };
        
    }
    
    
    
    if (component == 1) {
        
        NSString *urlString = [NSString stringWithFormat:@"%@Tool",LinkerAddress];
        PostUrl_view *Post = [[PostUrl_view alloc]init];
        
        DistrictListAry = [NSMutableArray array];
        
        [Post PostAddressList:urlString AreaType:@"3" ParentId:[NSString stringWithFormat:@"%@",[[CityAry valueForKey:@"CityId"] objectAtIndex:row]] view:self.view];
        
        Post.UrlStrAry =^(NSArray *Count){
            
            
            
            for (NSDictionary *dic in Count) {
                [DistrictListAry addObject:dic];
            }
            
            S_id = [NSString stringWithFormat:@"%@",[[CityAry valueForKey:@"CityId"] objectAtIndex:row]];
            
            S = [NSString stringWithFormat:@"%@",[[CityAry valueForKey:@"CityName"] objectAtIndex:row]];
            [pickerView reloadComponent:2];
        };
        
    }
    
    
    if (component == 2) {
        
        NSString *urlString = [NSString stringWithFormat:@"%@Tool",LinkerAddress];
        PostUrl_view *Post = [[PostUrl_view alloc]init];
        SubDistrictAry = [NSMutableArray array];
        
        [Post PostAddressList:urlString AreaType:@"4" ParentId:[NSString stringWithFormat:@"%@",[[DistrictListAry valueForKey:@"DistrictId"] objectAtIndex:row]] view:self.view];
        
        Post.UrlStrAry =^(NSArray *Count){
            
            
            
            for (NSDictionary *dic in Count) {
                [SubDistrictAry addObject:dic];
            }
            
            Q_id = [NSString stringWithFormat:@"%@",[[DistrictListAry valueForKey:@"DistrictId"] objectAtIndex:row]];
            
            Q = [NSString stringWithFormat:@"%@",[[DistrictListAry valueForKey:@"DistrictName"] objectAtIndex:row]];
            [pickerView reloadComponent:3];
        };
        
        text_Name.text = [NSString stringWithFormat:@"%@ %@ %@",P,S,Q];
    }
    
    if (component == 3) {
        J_id = [NSString stringWithFormat:@"%@",[[SubDistrictAry valueForKey:@"SubDistrictId"] objectAtIndex:row]];
        
        J = [NSString stringWithFormat:@"%@",[[SubDistrictAry valueForKey:@"SubDistrictName"] objectAtIndex:row]];
        
        text_Name.text = [NSString stringWithFormat:@"%@ %@ %@ %@",P,S,Q,J];
        
        //    NSLog(@"%@--%@--%@--%@",P_id,S_id,Q_id,J_id);
    }
    
    
}
-(void)sure_btn:(UIButton *)sender
{
    UITextField *text_0 = (UITextField *)[self.view viewWithTag:5200];
    UITextField *text_1 = (UITextField *)[self.view viewWithTag:5201];
    UITextField *text_2 = (UITextField *)[self.view viewWithTag:5202];
    UITextField *text_3 = (UITextField *)[self.view viewWithTag:5203];
    UITextField *text_4 = (UITextField *)[self.view viewWithTag:5204];
    UITextField *text_5 = (UITextField *)[self.view viewWithTag:5204];
    
    if ([text_0.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"店铺名称不能为空" inView:self.view];
        
        return;
    }
    
    if ([text_1.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"手机号码不能为空" inView:self.view];
        
        return;
    }
    
    if ([text_2.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"登陆密码不能为空" inView:self.view];
        
        return;
    }
    
    if (text_1.text.length != 11) {
        [SKAutoHideMessageView showMessage:@"手机格式不正确" inView:self.view];
        
        return;
    }
    
    
    if ([text_3.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"地址不能为空" inView:self.view];
        
        return;
    }
    
    if ([text_4.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"请填写详细地址" inView:self.view];
        
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    
    
    
    [Post Register:urlString Name:text_0.text Password:text_2.text ProvinceId:P_id CityId:S_id DistrictId:Q_id SubDistrictId:J_id Tel:@"" Phone:text_1.text Detail:text_4.text Referee:text_5.text StartTime:@"09:00" EndTime:@"21:00" view:self.view];
    
    Post.UrlStrAry =^(NSArray *Count){
        
        NSLog(@"%@",Count);
        
        if ([[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]] isEqualToString:@"注册成功!"]) {
         
            Sign_one_ViewController *sign = [[Sign_one_ViewController alloc]init];
            sign.Sign = [NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]];
            sign.Sign_type = @"Sign_type";
            [self presentViewController:sign animated:YES completion:nil];
            
        }else{
        
            [SKAutoHideMessageView showMessage:@"注册失败" inView:self.view];
            
        }
        
       
        
    };
    
  
    
    
}


-(void)buttonClick:(UIButton *)sender
{
    
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.pickerBgView];
    self.maskView.alpha = 0;
    self.pickerBgView.top = self.view.height;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0.3;
        self.pickerBgView.bottom = self.view.height;
    }];
}

- (void)hideMyPicker {
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0;
        self.pickerBgView.top = self.view.height;
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [self.pickerBgView removeFromSuperview];
    }];
}

#pragma mark - xib click

- (IBAction)cancel:(id)sender {
    [self hideMyPicker];
}

- (IBAction)ensure:(id)sender {
 
    [self hideMyPicker];
}



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        
        //        pickerLabel.minimumFontSize = 8.;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
    
}


@end
