//
//  SuggestionViewController.m
//  lightningDog
//
//  Created by 皇家少爷齐熠 on 16/11/21.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "SuggestionViewController.h"

@interface SuggestionViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,AVCaptureMetadataOutputObjectsDelegate,UINavigationControllerDelegate,YUFoldingTableViewDelegate,UIGestureRecognizerDelegate>
{
    UITextView *feedView;
    UILabel *number;
    UILabel *place;
    UIImageView *imageWall;
    UIButton *delButton;
    UIImageView *imageWallTwo;
    UIButton *delButtonTwo;
    UIImageView *imageWallThrid;
    UIButton *delButtonThrid;
    NSMutableArray *WallArray;
    UIButton *AddPhoto;
    NSArray *shopAry;
    NSMutableArray *title;
    int num_Row;
}
@property (nonatomic, weak) YUFoldingTableView *foldingTableView;

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    title = [NSMutableArray array];
    num_Row = 0;
    [title addObject:@"请选择您的问题类型"];
    shopAry = @[@"我是商家",@"我是店家"];
//    title = @[@"请选择您的问题类型"];
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:225/255.0 blue:230/255.0 alpha:1.0f];
    WallArray = [NSMutableArray array];
    
    [self Top_View];
   
  //  [self pickUp];
    [self creatTopTextView];
  
    [self photoWall];
  //  [self phoneView];
    
     [self setupFoldingTableView];
}

//

// 创建tableView tips_arrow_icon
- (void)setupFoldingTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    YUFoldingTableView *foldingTableView = [[YUFoldingTableView alloc] initWithFrame:CGRectMake(14, 0.112 * KScreenHeight + 10,KScreenWidth - 28, 120)];

    _foldingTableView = foldingTableView;
    _foldingTableView.separatorStyle = NO;
    _foldingTableView.layer.masksToBounds = YES;
    _foldingTableView.layer.cornerRadius = 2.0f;
    _foldingTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:foldingTableView];
    foldingTableView.foldingDelegate = self;
}

#pragma mark - YUFoldingTableViewDelegate / required（必须实现的代理）
// 返回箭头的位置
- (YUFoldingSectionHeaderArrowPosition)perferedArrowPositionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    
    // 没有赋值，默认箭头在左
    return self.arrowPosition ? :YUFoldingSectionHeaderArrowPositionLeft;
}
- (NSInteger )numberOfSectionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return 1;
}
- (NSInteger )yuFoldingTableView:(YUFoldingTableView *)yuTableView numberOfRowsInSection:(NSInteger )section
{
    return 2;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForHeaderInSection:(NSInteger )section
{
    return 40;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%@",title[section]];
}
- (UITableViewCell *)yuFoldingTableView:(YUFoldingTableView *)yuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",shopAry[indexPath.row]];
    cell.textLabel.textColor = [UIColor grayColor];
    
    return cell;
}
- (void )yuFoldingTableView:(YUFoldingTableView *)yuTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [title removeAllObjects];
    num_Row++;
    
    [title addObject:shopAry[indexPath.row]];
    [_foldingTableView reloadData];
    [yuTableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - YUFoldingTableViewDelegate / optional （可选择实现的）

- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView descriptionForHeaderInSection:(NSInteger )section
{
    return @"";
}



//

-(void)Top_View
{
    [[[Top_View_BG alloc]init] TopView:self.view Sure:@"留言反馈"];
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


-(void)sure_btn:(UIButton *)sender
{
    
}

-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma 照片墙
-(void)photoWall
{
    UIView *wall = [[UIView alloc]initWithFrame:CGRectMake(0, 56 + 0.26 * KScreenHeight + 0.14 * KScreenHeight, KScreenWidth, 0.15 * KScreenHeight)];
    wall.backgroundColor = [UIColor colorWithRed:223/255.0 green:225/255.0 blue:230/255.0 alpha:1.0f];
    [self.view addSubview:wall];
    
    //添加照片的按钮
    

    AddPhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    AddPhoto.frame = CGRectMake(14, 5, 0.18 * KScreenHeight - 35,  0.18 * KScreenHeight - 35);
    [AddPhoto setBackgroundImage:[UIImage imageNamed:@"add_picture"] forState:UIControlStateNormal];
    [AddPhoto addTarget:self action:@selector(addphoto:) forControlEvents:UIControlEventTouchUpInside];
    
    [wall addSubview:AddPhoto];
    
    imageWall = [[UIImageView alloc]initWithFrame:CGRectMake(AddPhoto.frame.origin.x + 20 + 0.15 * KScreenHeight - 30, 7, 0.18 * KScreenHeight - 40, 0.18 * KScreenHeight - 40)];
    [wall addSubview:imageWall];
    
    
    // 删除按钮
    
    delButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    delButton.frame = CGRectMake(AddPhoto.frame.origin.x + (20 + 0.18 * KScreenHeight - 30) * 1 + 0.15 * KScreenHeight - 50, -5, 20, 20);
    [delButton setBackgroundImage:[UIImage imageNamed:@"sendfeedback_delete.9"] forState:UIControlStateNormal];
    delButton.tag = 100 ;
    [delButton addTarget:self action:@selector(delnutton:) forControlEvents:UIControlEventTouchUpInside];
    
    [wall addSubview:delButton];
    
    
    imageWallTwo = [[UIImageView alloc]initWithFrame:CGRectMake(AddPhoto.frame.origin.x + (20 + 0.15 * KScreenHeight - 30) * 2, 7, 0.18 * KScreenHeight - 40, 0.18 * KScreenHeight - 40)];
    
    [wall addSubview:imageWallTwo];
    
    delButtonTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    delButtonTwo.frame = CGRectMake(AddPhoto.frame.origin.x + (20 + 0.18 * KScreenHeight - 30) * 2 + 0.15 * KScreenHeight - 70 , -5, 20, 20);
    delButtonTwo.tag = 101 ;
    [delButtonTwo addTarget:self action:@selector(delnutton:) forControlEvents:UIControlEventTouchUpInside];
    
    [delButtonTwo setBackgroundImage:[UIImage imageNamed:@"sendfeedback_delete.9"] forState:UIControlStateNormal];
    [wall addSubview:delButtonTwo];
    
    
    imageWallThrid = [[UIImageView alloc]initWithFrame:CGRectMake(AddPhoto.frame.origin.x + (20 + 0.15 * KScreenHeight - 30 ) * 3, 7, 0.18 * KScreenHeight - 40, 0.18 * KScreenHeight - 40)];
    [wall addSubview:imageWallThrid];
    
    delButtonThrid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    delButtonThrid.frame = CGRectMake(AddPhoto.frame.origin.x + (20 + 0.18 * KScreenHeight - 30) * 3 + 0.15 * KScreenHeight - 90 , -5, 20, 20);
    delButtonThrid.tag = 102 ;
    [delButtonThrid addTarget:self action:@selector(delnutton:) forControlEvents:UIControlEventTouchUpInside];
    
    [delButtonThrid setBackgroundImage:[UIImage imageNamed:@"sendfeedback_delete.9"] forState:UIControlStateNormal];
    [wall addSubview:delButtonThrid];
    
    delButton.alpha = 0.0f;
    delButtonTwo.alpha = 0.0f;
    delButtonThrid.alpha = 0.0f;
}

-(void)delnutton:(UIButton *)sender
{
   
    [WallArray removeObjectAtIndex:sender.tag - 100];
    if (WallArray.count == 0) {
        imageWall.image = nil;
        
        delButton.alpha = 0.0f;
        delButtonTwo.alpha = 0.0f;
        delButtonThrid.alpha = 0.0f;
        
    }else if (WallArray.count == 1){
        imageWallTwo.image = nil;
        imageWall.image = (UIImage *)WallArray[0];
        
        delButton.alpha = 1.0f;
        delButtonTwo.alpha = 0.0f;
        delButtonThrid.alpha = 0.0f;
        
    }else{
        imageWall.image = (UIImage *)WallArray[0];
        imageWallTwo.image  = (UIImage *)WallArray[1];
        imageWallThrid.image = nil;
        
        delButton.alpha = 1.0f;
        delButtonTwo.alpha = 1.0f;
        delButtonThrid.alpha = 0.0f;
        
    }
}

-(void)addphoto:(UIButton *)sender
{
    if (WallArray.count != 3) {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: nil                                                                             message: nil                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    
    //添加Button
    [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //处理点击拍照
        [self takePhoto];
    }]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"从相册选取" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        //处理点击从相册选取
        [self photo];
    }]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController: alertController animated: YES completion: nil];
    }else{
        
        [SKAutoHideMessageView showMessage:@"最多仅可以添加三张照片" inView:self.view];
    }
}

//从相册选取
- (void)photo {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    
    [self presentViewController:picker animated:YES completion:nil];
}


//相机拍照
-(void)takePhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        picker.sourceType = sourceType;
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            //判断相机是否能够使用
            AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if(status == AVAuthorizationStatusAuthorized) {
                // authorized
                [self presentViewController:picker animated:YES completion:nil];
            } else if(status == AVAuthorizationStatusDenied){
                // denied
                
                return ;
            } else if(status == AVAuthorizationStatusRestricted){
                // restricted
                
            } else if(status == AVAuthorizationStatusNotDetermined){
                // not determined
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if(granted){
                        [self presentViewController:picker animated:YES completion:nil];
                    } else {
                        //   [self.VC showHint:@"请在iphone的“设置-隐私-相机”选项中，允许朋游访问你的相机"yOffset:-100];
                        
                        return;
                    }
                }];
            }
        }
        
    }else
    {
        NSLog(@"模拟其中无法打开相机,请在真机中使用");
    }
}


#pragma mark - 使用此分类需要实现这个代理拿到对应的图片

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;{
    
    //获取照片的原图

    UIImage *originalImage = (UIImage *)info[UIImagePickerControllerOriginalImage];
    
    [WallArray addObject:originalImage];
  
    
    //获得编辑后的图片
   // UIImage *editedImage = (UIImage *)info[UIImagePickerControllerEditedImage];
    if (WallArray.count == 1) {
         imageWall.image = (UIImage *)WallArray[0];
        
        delButton.alpha = 1.0f;
        delButtonTwo.alpha = 0.0f;
        delButtonThrid.alpha = 0.0f;
        
    }else if(WallArray.count == 2)
    {
        imageWallTwo.image = (UIImage *)WallArray[1];
        
        delButton.alpha = 1.0f;
        delButtonTwo.alpha = 1.0f;
        delButtonThrid.alpha = 0.0f;
        
    }else{
    
      imageWallThrid.image = (UIImage *)WallArray[2];
        
        delButton.alpha = 1.0f;
        delButtonTwo.alpha = 1.0f;
        delButtonThrid.alpha = 1.0f;
        
    }
   
  
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma TextView
-(void)creatTopTextView{
    
    feedView = [[UITextView alloc]initWithFrame:CGRectMake(14,  0.112 * KScreenHeight + 40 + 20, KScreenWidth - 28, 0.26 * KScreenHeight)];
    feedView.delegate = self;
    feedView.font = [UIFont systemFontOfSize:14.0f];
    feedView.layer.masksToBounds = YES;
    feedView.layer.cornerRadius = 5.0f;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:feedView];
    
    //place
    place = [[UILabel alloc]initWithFrame:CGRectMake(5, 7, KScreenWidth - 20, 20)];
    place.text = @"请输入您的反馈意见吧，我们将会努力改进！";
    place.font = [UIFont systemFontOfSize:15.0f];
    place.textAlignment = NSTextAlignmentLeft;
    place.textColor = [UIColor grayColor];
    [feedView addSubview:place];
    
    //字数限制
    number = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 90 - 40, 0.22 * KScreenHeight, 80, 20)];
    number.text = @"0/300字";
    number.font = [UIFont systemFontOfSize:15.0f];
    number.textAlignment = NSTextAlignmentRight;
    number.textColor = [UIColor grayColor];
    [feedView addSubview:number];
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    place.alpha = 0.0;
}

-(void)textViewDidChange:(UITextView *)textView
{
    number.text = [NSString stringWithFormat:@"%lu/300字",(unsigned long)textView.text.length];
}

//
//#pragma 提交按钮
//-(void)pickUp{
//    UIButton *right = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    right.frame = CGRectMake(0, 0,50, 30);
//    [right setTitle:@"提交" forState:UIControlStateNormal];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:right];
////    [right setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    
//    [right addTarget:self action:@selector(rightItem:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.navigationItem setRightBarButtonItem:rightItem];
//}


#pragma 提交按钮响应事件
-(void)rightItem:(UIButton *)sender
{
    NSLog(@"响应事件");
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
