//
//  CategoryModel.h
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/24.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "FoodModel.h"

@interface CategoryModel : Model

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong) NSArray<FoodModel> *spus;

@end

