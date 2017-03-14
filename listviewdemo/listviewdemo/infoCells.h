//
//  infoCells.h
//  listviewdemo
//
//  Created by hejingjin on 17/3/14.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoCells : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *blackbordlabel;
@property (weak, nonatomic) IBOutlet UILabel *atesseslabel;
@property (weak, nonatomic) IBOutlet UILabel *qianduanlabel;

@property (weak, nonatomic) IBOutlet UILabel *scorelabel;


-(void)setDatewithdictionary:(NSDictionary *)dic;
@end
