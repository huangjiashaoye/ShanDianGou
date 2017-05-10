//
//  Search_BGViewController.m
//  ImitationLightningDog
//
//  Created by 皇家少爷齐熠 on 16/12/5.
//  Copyright © 2016年 huangjiashaoye. All rights reserved.
//

#import "Search_BGViewController.h"

@interface Search_BGViewController ()<UITextFieldDelegate,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collection;
    NSMutableArray *itemListTopText;
    VOTagList *tagList;
    UIImageView *searchLogo;
    UILabel *searchLabel;
    NSArray *tags;
    UISearchBar *bar;
}

@end

@implementation Search_BGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    itemListTopText = [NSMutableArray array];
    [TopBackground setBackgroundTwo:self.view color:@"bg_gray"];
   

    
    
    [self searchBar_View];
    [self creatCollectionView];
   
    
    
    searchLogo = [[UIImageView alloc]initWithFrame:CGRectMake(20, 80, 20, 20)];
    [searchLogo setImage:[UIImage imageNamed:@"FIRE"]];
    [self.view addSubview:searchLogo];
    
    searchLabel = [[UILabel alloc]initWithFrame:CGRectMake(searchLogo.frame.origin.x + searchLogo.frame.size.width + 5, searchLogo.frame.origin.y, KScreenWidth - (searchLogo.frame.origin.x + searchLogo.frame.size.width + 5), 20)];
    searchLabel.text = @"热门搜索";
    searchLabel.font = [UIFont systemFontOfSize:12.5f];
    searchLabel.textColor = [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1.0f];
    [self.view addSubview:searchLabel];
    
    tags = @[@"红牛", @"加多宝", @"雀巢", @"石库门",@"可口可乐", @"洋河", @"三得利", @"清风", @"留夫鸭", @"卫龙", @"味都", @"小浣熊", @"旺仔", @"农夫山泉", @"德芙"];
    
    tagList = [[VOTagList alloc] initWithTags:tags];
    tagList.frame = CGRectMake(20, 110, 300, 200);
    tagList.multiLine = YES;
    tagList.multiSelect = YES;
    tagList.allowNoSelection = YES;
    tagList.vertSpacing = 10;
    tagList.horiSpacing = 6;
  //  tagList.selectedTextColor = [UIColor purpleColor];
    tagList.tagBackgroundColor = [UIColor whiteColor];
    tagList.selectedTagBackgroundColor = [UIColor whiteColor];
    tagList.tagCornerRadius = 3;
    tagList.tagEdge = UIEdgeInsetsMake(8, 8, 8, 8);
    
    [tagList addTarget:self action:@selector(selectedTagsChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:tagList];
    
}

- (void)selectedTagsChanged: (VOTagList *)tagList2{
    
    searchLogo.alpha = 0.0f;
    tagList.alpha = 0.0f;
    searchLabel.alpha = 0.0f;
    
    [self getHomeData:tags[tagList.index]];
    
    bar.text = [NSString stringWithFormat:@"%@",tags[tagList.index]];
    [bar resignFirstResponder];

 }


//创建collectionview
-(void)creatCollectionView{
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0.1127 * KScreenHeight, KScreenWidth , (1 -  0.1127) * KScreenHeight) collectionViewLayout:flowLayout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0f];
    [self.view addSubview:collection];
    
    //注册Cell，必须要有
    [collection registerClass:[HeardTopLikeCollectionViewCell class] forCellWithReuseIdentifier:@"HeardTopLikeCollectionViewCell"];
    
   
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return itemListTopText.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{



    static NSString * CellIdentifier = @"HeardTopLikeCollectionViewCell";
    HeardTopLikeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = itemListTopText[indexPath.row];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.width)];
    [image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://imgsize.52shangou.com/img/%@",[dic valueForKey:@"big_pic_url"]]] placeholderImage:[UIImage imageNamed:@"defalut_4_5.jpg"]];
    
    [cell.contentView addSubview:image];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(4, image.frame.size.height , image.frame.size.width - 8, 20)];
    
    label.text = [NSString stringWithFormat:@"%@ %@",[dic valueForKey:@"brand"],[dic valueForKey:@"item_name"]];
    label.font = [UIFont systemFontOfSize:14.0f];
    [cell.contentView addSubview:label];
    
    
    UILabel *grayLabel = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x, label.frame.size.height + label.frame.origin.y , label.frame.size.width, label.frame.size.height)];
    
    grayLabel.text = [NSString stringWithFormat:@"%@/%@",[dic valueForKey:@"property"],[dic valueForKey:@"unit"]];
    grayLabel.font = [UIFont systemFontOfSize:12.5f];
    grayLabel.textColor = [UIColor grayColor];
    [cell.contentView addSubview:grayLabel];
    
    
    //价格
    UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(grayLabel.frame.origin.x, grayLabel.frame.origin.y + grayLabel.frame.size.height, 0.35 * grayLabel.frame.size.width, 30)];
    
    NSString *priceItem = [NSString stringWithFormat:@"%@",[dic valueForKey:@"price"]];
    price.textColor = [UIColor redColor];
    price.font = [UIFont systemFontOfSize:13.5f];
    price.text = [NSString stringWithFormat:@"￥%.2f",[priceItem floatValue] / 100];
    [cell.contentView addSubview:price];
    
    return cell;
    

}


#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((KScreenWidth - 24) * 0.5 ,0.655 * KScreenWidth);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
  
    return UIEdgeInsetsMake(1, 1, 1, 1);

}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    self.hidesBottomBarWhenPushed=YES;
//    
//    ClassItemViewController *clas = [[ClassItemViewController alloc]init];
//    
//    [self.navigationController pushViewController:clas animated:NO];
//    
//    self.hidesBottomBarWhenPushed=NO;
}




//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}




-(void)searchBar_View
{
    bar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 25, KScreenWidth - 20, 34)];
    bar.delegate = self;
    bar.barStyle = UIBarStyleDefault;
    bar.showsCancelButton = YES;
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_gray"]];
    bar.placeholder = @"请您搜索商品";
    
    bar.tintColor = [UIColor blackColor];
    [self.view addSubview:bar];
    
}



//搜索按钮
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

    [searchBar resignFirstResponder];
    
}

//取消
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
     [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
  
    if ([searchText isEqualToString:@""]) {
        searchLogo.alpha = 1.0f;
        tagList.alpha = 1.0f;
        searchLabel.alpha = 1.0f;
    }else{
    
    searchLogo.alpha = 0.0f;
    tagList.alpha = 0.0f;
    searchLabel.alpha = 0.0f;
    }
    
    [itemListTopText removeAllObjects];
    [self getHomeData:searchText];
}



//数据
-(void)getHomeData:(NSString *)searchText{
    
//    NSString *utf8 = [NSString stringWithFormat:@"%@", CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)searchText, NULL, NULL, kCFStringEncodingUTF8)];
//    
//    
//    
//    NSString *url = [NSString stringWithFormat:@"http://www.52shangou.com/search/service/mainsearch/v2/toc/query.do?keyword=%@&keywordtype=BRAND&landmarkId=425660&homepageShopIds=16946&otherShopIds=undefined&start=0&count=10&moduleType=&shopInnerSearch=false",utf8];
//    
//    
//    NSURL *URL = [NSURL URLWithString:url];
//    
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        
//        
//        NSArray *item = [responseObject valueForKey:@"firstDocList"];
//        for (NSDictionary *dic in item) {
//            
//            [itemListTopText addObject:dic];
//        
//        }
//        
//
//         [collection reloadData];
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
