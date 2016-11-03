//
//  CategoryModel.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/24.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+(JSONKeyMapper *)keyMapper
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"name" forKey:@"name"];
    [dict setObject:@"icon" forKey:@"icon"];
    [dict setObject:@"spus" forKey:@"spus"];
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
    
}


@end

