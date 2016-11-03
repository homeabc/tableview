//
//  LeftTableViewCell.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define defaultColor rgba(253, 212, 49, 1)


#import "LeftTableViewCell.h"
#import "CategoryModel.h"

@interface LeftTableViewCell ()

@property (strong, nonatomic) UILabel *name;

@property (nonatomic, strong) UIView *yellowView;

@end


@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
        self.name.numberOfLines = 0;
        self.name.font = [UIFont systemFontOfSize:15];
        self.name.textColor = rgba(130, 130, 130, 1);
        self.name.highlightedTextColor = defaultColor;
        [self.contentView addSubview:self.name];
        
        self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 5, 45)];
        self.yellowView.backgroundColor = defaultColor;
        [self.contentView addSubview:self.yellowView];
    }
    return self;
}


-(void)setModel:(CategoryModel *)model
{
    _model = model;
    
    self.name.text = _model.name;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
    self.contentView.backgroundColor = selected ? [UIColor whiteColor] : [UIColor colorWithWhite:0 alpha:0.1];
    self.highlighted = selected;
    self.name.highlighted = selected;
    self.yellowView.hidden = !selected;
}

@end
