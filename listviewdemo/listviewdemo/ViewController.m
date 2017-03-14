//
//  ViewController.m
//  listviewdemo
//
//  Created by hejingjin on 17/3/14.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "ViewController.h"
#import "infoCells.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)UITableView *leftableview;
@property(nonatomic,strong)UITableView *righttableview;
@property(nonatomic,strong)UIScrollView *contentview;

@property(nonatomic,strong)NSArray *infoArray;

@end

@implementation ViewController{
    CGFloat _kOriginX; //左边偏移量
    CGFloat _kScreenWidth;
    CGFloat _kScreenHeight;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self configData];
    [self setUpTitleview];
    [self setUpInfoTableview];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)configData{
    
    _kOriginX = 120;
    _kScreenWidth = self.view.frame.size.width;
    _kScreenHeight = self.view.frame.size.height;
    
    
    _infoArray = @[@{@"title":@"时间", @"playerName":@"呵呵呵", @"score":@"23", @"qiangduan":@"20", @"time":@"22", @"zugong":@"3",@"lanban":@"10"},
                   @{@"title":@"得分", @"playerName":@"呵呵呵1", @"score":@"23", @"qiangduan":@"20", @"time":@"22", @"zugong":@"3",@"lanban":@"10"},
                   @{@"title":@"篮板", @"playerName":@"呵呵呵2", @"score":@"23", @"qiangduan":@"20", @"time":@"22", @"zugong":@"3",@"lanban":@"10"},
                   @{@"title":@"助攻", @"playerName":@"呵呵呵3", @"score":@"23", @"qiangduan":@"20", @"time":@"22", @"zugong":@"3",@"lanban":@"10"},
                   @{@"title":@"抢断", @"playerName":@"呵呵呵3", @"score":@"23", @"qiangduan":@"20", @"time":@"22", @"zugong":@"3",@"lanban":@"10"}];
    
    
    
}

-(void)setUpTitleview{
    
    _contentview = [[UIScrollView alloc] initWithFrame:CGRectMake(_kOriginX, 0, _kScreenWidth - _kOriginX, _kScreenHeight)];
    _contentview.delegate = self;
    _contentview.showsVerticalScrollIndicator = NO;
    _contentview.showsHorizontalScrollIndicator = NO;
    _contentview.contentSize = CGSizeMake(500, _kScreenHeight);
    _contentview.bounces = NO;
    [self.view addSubview:_contentview];
    
    UILabel *titleLabel = [self quickCreateLabelWithLeft:0 width:_kOriginX title:@"球员"];
    [self.view addSubview:titleLabel];
    
    for (int i = 0; i < _infoArray.count; i++) {
        CGFloat x = i * 100;
        UILabel *label = [self quickCreateLabelWithLeft:x width:100 title:[[_infoArray objectAtIndex: i] objectForKey:@"title"]];
        label.textAlignment = NSTextAlignmentCenter;
        [_contentview addSubview:label];
    }
}


-(void)setUpInfoTableview{
    
    _leftableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, _kOriginX, _kScreenHeight) style:UITableViewStylePlain];
    _leftableview.dataSource = self;
    _leftableview.delegate = self;
    _leftableview.showsVerticalScrollIndicator = NO;
    _leftableview.showsHorizontalScrollIndicator = NO;
    _leftableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_leftableview];
    
    _righttableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 500, _kScreenHeight) style:UITableViewStylePlain];
    _righttableview.delegate = self;
    _righttableview.dataSource = self;
    _righttableview.showsVerticalScrollIndicator = NO;
    _righttableview.showsHorizontalScrollIndicator = NO;
    _righttableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_contentview addSubview:_righttableview];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_infoArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.f;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView == _leftableview) {
 
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleTable"];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleTable"];
            }
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = [[_infoArray objectAtIndex:indexPath.row] objectForKey:@"playerName"];
            cell.textLabel.textColor = [UIColor lightGrayColor];
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            if (indexPath.row%2 == 1) {
                cell.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
            }
            return cell;
    }else{
        
        NSString *ident = @"InfoCellid";
        infoCells *cell = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"infoCells" owner:nil options:nil] lastObject];
        }
        if (indexPath.row%2 == 1) {
            cell.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
        } else {
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        NSDictionary *dic = _infoArray[indexPath.row];
        [cell setDatewithdictionary:dic];
        
        
        return cell;
        
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _leftableview) {
        [_righttableview setContentOffset:CGPointMake(_righttableview.contentOffset.x, _leftableview.contentOffset.y)];
    }
    if (scrollView == _righttableview) {
        [_leftableview setContentOffset:CGPointMake(0, _righttableview.contentOffset.y)];
    }
}



//MARK:- 快速创建label
- (UILabel *)quickCreateLabelWithLeft:(CGFloat)left width:(CGFloat)width title:(NSString *)title {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(left, 10, width, 40)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
