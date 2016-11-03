//
//  CollectionModel.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel
+(JSONKeyMapper *)keyMapper
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"name" forKey:@"name"];
    [dict setObject:@"icon_url" forKey:@"icon_url"];
    
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
}

@end
