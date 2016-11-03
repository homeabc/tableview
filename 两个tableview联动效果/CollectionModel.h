//
//  CollectionModel.h
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@protocol CollectionModel

@end

@interface CollectionModel : Model

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *icon_url;

@end
