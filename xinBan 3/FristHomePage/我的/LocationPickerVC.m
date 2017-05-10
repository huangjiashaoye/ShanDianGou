//
//  LocationPickerVC.m
//  YouZhi
//
//  Created by roroge on 15/4/9.
//  Copyright (c) 2015年 com.roroge. All rights reserved.
//

#import "LocationPickerVC.h"


@interface LocationPickerVC () <UIPickerViewDataSource, UIPickerViewDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate>
{
    NSMutableArray *CityAry;
    NSMutableArray *DistrictListAry;
    NSMutableArray *SubDistrictAry;
    NSString *P,*S,*Q,*J;
    NSString *P_id,*S_id,*Q_id,*J_id;
}

//view
@property (strong, nonatomic) IBOutlet UIButton *locationBtn;
@property (strong, nonatomic) IBOutlet UIPickerView *myPicker;
@property (strong, nonatomic) IBOutlet UIView *pickerBgView;
@property (strong, nonatomic) UIView *maskView;

@property (strong, nonatomic) IBOutlet UIButton *provinceBtn;
@property (strong, nonatomic) IBOutlet UIButton *cityBtn;
@property (strong, nonatomic) IBOutlet UIButton *townBtn;
//data
@property (strong, nonatomic) NSDictionary *pickerDic;
@property (strong, nonatomic) NSArray *provinceArray;
@property (strong, nonatomic) NSArray *cityArray;
@property (strong, nonatomic) NSArray *townArray;
@property (strong, nonatomic) NSArray *selectedArray;

@end

@implementation LocationPickerVC

- (void)viewDidLoad {
    
    [super viewDidLoad];



    [self initView];

  
    
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0f];
    [self Top_View];
    [self creatSearch];
    
    
    if ([self.Change isEqualToString:@"Change"]) {
        
        UITextField *text_1 = (UITextField *)[self.view viewWithTag:52000];
        UITextField *text_2 = (UITextField *)[self.view viewWithTag:52001];
     //   UITextField *text_3 = (UITextField *)[self.view viewWithTag:52002];
        UITextField *text_4 = (UITextField *)[self.view viewWithTag:52003];
        
        text_1.text = [NSString stringWithFormat:@"%@",self.text_one];
        text_2.text = [NSString stringWithFormat:@"%@",self.text_two];
     //   text_3.text = [NSString stringWithFormat:@"%@",self.text_three];
        text_4.text = [NSString stringWithFormat:@"%@",self.text_four];
    }
    
   
}

-(void)creatSearch
{
    NSArray *ary = @[@"收货人姓名",@"手机号码",@"省市区",@"详细地址"];
    for (int i = 0; i < ary.count; i ++) {
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0.112 * KScreenHeight + (0.07 * KScreenHeight + 1.5) * i, KScreenWidth - 20, 0.07 * KScreenHeight)];
        textField.borderStyle = UITextBorderStyleNone;
        textField.delegate = self;
        textField.placeholder = [NSString stringWithFormat:@"%@",ary[i]];
        [self.view addSubview:textField];
        textField.tag = 52000 + i;
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y + textField.frame.size.height + 0.5, KScreenWidth - 20, 1.0f)];
        line.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0f];
        [self.view addSubview:line];
        
        if (i == 2) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            button.frame = CGRectMake(textField.frame.origin.x, textField.frame.origin.y, textField.frame.size.width, textField.frame.size.height);
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button];
            
        }
        
    }
    
    
}




-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"编辑地址"];
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(10, 0.1 * KScreenWidth - 3, 30, 30);
    [back setBackgroundImage:[UIImage imageNamed:@"back_pic_view.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    UIButton *sure_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sure_btn.frame = CGRectMake(KScreenWidth - 20 - 40, 0.065 * KScreenHeight, 40, 20);
    [sure_btn setTitle:@"保存" forState:UIControlStateNormal];
    [sure_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sure_btn addTarget:self action:@selector(sure_btn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sure_btn];
    
}




-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
    
    UITextField *text_Name = (UITextField *)[self.view viewWithTag:52002];
    
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
    UITextField *text_Name = (UITextField *)[self.view viewWithTag:52000];
    UITextField *text_Phone = (UITextField *)[self.view viewWithTag:52001];
    UITextField *text_address = (UITextField *)[self.view viewWithTag:52002];
    UITextField *text_detail = (UITextField *)[self.view viewWithTag:52003];
 
    if ([text_Name.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"收货人不能为空" inView:self.view];
        
        return;
    }

    if ([text_Phone.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"收货手机号不能为空" inView:self.view];
        
        return;
    }
    
    if (text_Phone.text.length != 11) {
        [SKAutoHideMessageView showMessage:@"手机格式不正确" inView:self.view];
        
        return;
    }
    
    
    if ([text_address.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"收货地址不能为空" inView:self.view];
        
        return;
    }
    
    if ([text_detail.text isEqualToString:@""]) {
        
        [SKAutoHideMessageView showMessage:@"请填写详细地址" inView:self.view];
        
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@Vendor",LinkerAddress];
    PostUrl_view *Post = [[PostUrl_view alloc]init];
    

    
    [Post InsertAddress:urlString VendorID:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"UserId"]] ProvinceId:P_id CityId:S_id DistrictId:Q_id SubDistrictId:J_id Consignee:text_Name.text Phone:text_Phone.text Detail:text_detail.text view:self.view];
    
    Post.UrlStrAry =^(NSArray *Count){
    
      
        
        [SKAutoHideMessageView showMessage:[NSString stringWithFormat:@"%@",[Count valueForKey:@"msg"]] inView:self.view];
        
        [self.navigationController popViewControllerAnimated:YES];
        
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
    self.locationBtn.hidden = YES;
    self.provinceBtn.hidden = self.cityBtn.hidden = self.townBtn.hidden = YES;
   
    
    
    
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
