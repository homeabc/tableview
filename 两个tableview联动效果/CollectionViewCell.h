//
//  CollectionViewCell.h
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionModel;
@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) CollectionModel *model;

@end
