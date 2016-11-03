//
//  FoodModel.h
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/24.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@protocol FoodModel

@end

@interface FoodModel : Model

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *foodId;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, assign) NSInteger month_saled;

@end
