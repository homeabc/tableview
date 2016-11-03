//
//  HeaderView.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/27.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "HeaderView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@implementation HeaderView


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = rgba(240, 240, 240, 0.8);
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH - 80, 20)];
        self.title.font = [UIFont systemFontOfSize:14];
        self.title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.title];
    }
    return self;
}




@end
