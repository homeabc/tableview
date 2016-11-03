//
//  LeftHeaderView.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.

#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#import "LeftHeaderView.h"

@implementation LeftHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = rgba(240, 240, 240, 0.8);
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 20)];
        self.name.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.name];
    }
    return self;
}

@end
