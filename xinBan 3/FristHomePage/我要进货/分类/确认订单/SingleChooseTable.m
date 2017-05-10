//
//  SingleChooseTableView.m
//  MulChooseDemo
//
//  Created by L2H on 16/7/13.
//  Copyright © 2016年 ailk. All rights reserved.
//

#import "SingleChooseTable.h"
#import "TableChooseCell.h"


@implementation SingleChooseTable

+(SingleChooseTable *)ShareTableWithFrame:(CGRect)frame{
    SingleChooseTable * table = [[SingleChooseTable alloc]initWithViewFrame:frame];
    return table;
}

-(instancetype)initWithViewFrame:(CGRect)frame{
    self = [super init];
    if(self){
        self.frame = frame;
        [self CreateTable];
    }
    return self;
}

-(void)CreateTable{
    _MyTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth - 40, self.frame.size.height)];
    _MyTable.dataSource = self;
    _MyTable.delegate = self;
    _MyTable.scrollEnabled = NO;
    _MyTable.layer.masksToBounds = YES;
    _MyTable.layer.cornerRadius =5.0f;
    _MyTable.separatorStyle = UITableViewStylePlain;
    [self addSubview:_MyTable];
}

#pragma UITableViewDelegate - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = [NSString stringWithFormat:@"cellId%ld",(long)indexPath.row];
    TableChooseCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[TableChooseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
  
    
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.dataArrImg[indexPath.row]]]];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.dataArrTitle[indexPath.row]];
 
    cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (_currentSelectIndex!=nil&&_currentSelectIndex != indexPath) {
        TableChooseCell * cell = [tableView cellForRowAtIndexPath:_currentSelectIndex];
        [cell UpdateCellWithState:NO];
    }
    TableChooseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell UpdateCellWithState:!cell.isSelected];
    _currentSelectIndex = indexPath;

    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_white"]];
    
    
    _block(cell.titleLabel.text,indexPath);
}

-(void)ReloadData{
    [self.MyTable reloadData];
}

@end
