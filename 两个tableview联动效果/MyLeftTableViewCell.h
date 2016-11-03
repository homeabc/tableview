//
//  MyLeftTableViewCell.h
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/27.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewModel;
@interface MyLeftTableViewCell : UITableViewCell

@property (strong, nonatomic) TableViewModel *model;

@end
