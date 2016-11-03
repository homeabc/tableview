//
//  FoodModel.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/24.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel


+(JSONKeyMapper *)keyMapper
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"name" forKey:@"name"];
    [dict setObject:@"foodId" forKey:@"id"];
    [dict setObject:@"picture" forKey:@"picture"];
    [dict setObject:@"month_saled" forKey:@"month_saled"];
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
    
}


@end
