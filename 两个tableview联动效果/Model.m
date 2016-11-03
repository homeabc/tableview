//
//  Model.m
//  天宇封装
//
//  Created by 洪福清 on 16/10/21.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

- (instancetype)initWithData:(NSData *)data
{
    return [self initWithData:data error:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    return [self initWithDictionary:dict error:nil];
}

- (instancetype)initWithString:(NSString *)string
{
    return [self initWithString:string error:nil];
}


@end
