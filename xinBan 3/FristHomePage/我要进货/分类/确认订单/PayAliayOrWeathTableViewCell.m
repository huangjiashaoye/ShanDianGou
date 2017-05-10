//
//  PayAliayOrWeathTableViewCell.m
//  FristHomePage
//
//  Created by 皇家少爷齐熠 on 17/1/10.
//  Copyright © 2017年 huangjiashaoye. All rights reserved.
//

#import "PayAliayOrWeathTableViewCell.h"

@implementation PayAliayOrWeathTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
       
        NSArray *aryDic = [[NSUserDefaults standardUserDefaults]valueForKey:@"PayTypeList"];
        
        
        NSMutableArray *aryTitle = [NSMutableArray array];
        NSMutableArray *aryImg = [NSMutableArray array];
        
        for (NSDictionary *dic in aryDic) {
            
            
            [aryTitle addObject:[dic valueForKey:@"Name"]];
            [aryImg addObject:[dic valueForKey:@"PicUrl"]];
        }
        
        self.title = aryTitle;
        self.images = aryImg;
//        NSArray *title = @[@"支付宝",@"微信"];
//        NSArray *mages = @[@"PayIconOne",@"PayIconTwo"];
        NSMutableArray  *dataArr = [NSMutableArray array];
        
        for (NSDictionary *dic in self.title) {
            [dataArr addObject:dic];
        }
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, KScreenWidth * 0.4, 20)];
        label.text = @"支付工具";
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:14.0f];
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        
        
        _MyTable = [SingleChooseTable ShareTableWithFrame:CGRectMake(20, label.frame.origin.y + 20 + label.frame.size.height, KScreenWidth - 40, CellHeight * dataArr.count)];
        _MyTable.dataArr = dataArr;
        _MyTable.dataArrImg = self.images;
        _MyTable.dataArrTitle = self.title;
        [_MyTable ReloadData];
        //选中内容
        
        
        
        _MyTable.block = ^(NSString *chooseContent,NSIndexPath *indexPath){
          
        self.TopCellMapCount(indexPath.row);
            
        };
        [self addSubview:_MyTable];

        
    }
    return self;
   }

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
