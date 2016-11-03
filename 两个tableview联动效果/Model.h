//
//  Model.h
//  天宇封装
//
//  Created by 洪福清 on 16/10/21.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Model : JSONModel

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithData:(NSData *)data;

- (instancetype)initWithString:(NSString *)string;

@end
