//
//  TableViewModel.h
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionModel.h"
#import "Model.h"

@interface TableViewModel : Model

@property (copy, nonatomic) NSString *name;

@property (strong, nonatomic) NSArray<CollectionModel> *subcategories;


@end
