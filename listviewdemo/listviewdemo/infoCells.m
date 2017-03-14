//
//  infoCells.m
//  listviewdemo
//
//  Created by hejingjin on 17/3/14.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "infoCells.h"

@implementation infoCells

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setDatewithdictionary:(NSDictionary *)dic{
 
//    @{@"title":@"时间", @"playerName":@"呵呵呵", @"score":@"23", @"qiangduan":@"20", @"time":@"22", @"zugong":@"3",@"lanban":@"10"
    
    self.timeLabel.text = [dic valueForKey:@"time"];
    self.scorelabel.text = [dic valueForKey:@"score"];
    self.qianduanlabel.text = [dic valueForKey:@"qiangduan"];
    self.atesseslabel.text = [dic valueForKey:@"zugong"];
    self.blackbordlabel.text = [dic valueForKey:@"lanban"];
    
}
@end
