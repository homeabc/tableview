//
//  TableViewModel.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

+(JSONKeyMapper *)keyMapper
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"name" forKey:@"name"];
    [dict setObject:@"subcategories" forKey:@"subcategories"];
    
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
}

@end
