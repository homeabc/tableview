//
//  TableViewController.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "TableViewController.h"
#import "CategoryModel.h"
#import "FoodModel.h"
#import "LeftTableViewCell.h"
#import "RightTableViewCell.h"
#import "LeftHeaderView.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


static NSString * const leftTableViewCellIdentifier = @"leftTableViewCellIdentifier";
static NSString * const rightTableViewCellIdentifier = @"rightTableViewCellIdentifier";


@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _selectIndex;
    BOOL _isScrollDown;
}

@property (strong, nonatomic) UITableView *lefttableView;

@property (strong, nonatomic) UITableView *righttableView;

@property (strong, nonatomic) NSMutableArray *catemodelArray;

@property (strong, nonatomic) NSMutableArray *foodmodelArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _selectIndex = 0;
    _isScrollDown = YES;
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"meituan" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *foods = dict[@"data"][@"food_spu_tags"];
    
    for (NSDictionary *dict in foods) {
        CategoryModel *model = [[CategoryModel alloc] initWithDictionary:dict];
        [self.catemodelArray addObject:model];
        NSMutableArray *datas = [NSMutableArray array];
        for (FoodModel *models in model.spus) {
            [datas addObject:models];
        }
        [self.foodmodelArray addObject:datas];
    }
    
    [self.view addSubview:self.lefttableView];
    [self.view addSubview:self.righttableView];
    
    
    [self.lefttableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
}



-(NSMutableArray *)catemodelArray
{
    if (_catemodelArray == nil) {
        _catemodelArray = [NSMutableArray array];
    }
    return _catemodelArray;
}

-(NSMutableArray *)foodmodelArray
{
    if (_foodmodelArray == nil) {
        _foodmodelArray = [NSMutableArray array];
    }
    return _foodmodelArray;
}


-(UITableView *)lefttableView
{
    if (_lefttableView == nil) {
        _lefttableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, SCREEN_HEIGHT)];
        _lefttableView.delegate = self;
        _lefttableView.dataSource = self;
        _lefttableView.showsVerticalScrollIndicator = NO;
        _lefttableView.tableFooterView = [UIView new];
        _lefttableView.separatorColor = [UIColor clearColor];
        [_lefttableView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:leftTableViewCellIdentifier];
        _lefttableView.rowHeight = 55;
        
    }
    return _lefttableView;
}

-(UITableView *)righttableView
{
    if (_righttableView == nil) {
        _righttableView = [[UITableView alloc] initWithFrame:CGRectMake(80, 64, SCREEN_WIDTH - 80, SCREEN_HEIGHT - 64)];
        _righttableView.delegate = self;
        _righttableView.dataSource = self;
        _righttableView.rowHeight = 80;
        _righttableView.showsVerticalScrollIndicator = NO;
        [_righttableView registerClass:[RightTableViewCell class] forCellReuseIdentifier:rightTableViewCellIdentifier];
        
    }
    return _righttableView;
}


#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.lefttableView) {
        return 1;
    }
    else
    {
        return self.foodmodelArray.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.lefttableView) {
        return self.catemodelArray.count;
    }
    else {
        return [self.foodmodelArray[section] count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView == self.lefttableView) {
        LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftTableViewCellIdentifier forIndexPath:indexPath];
        
        CategoryModel *model = self.catemodelArray[indexPath.row];
        cell.model = model;
        return cell;
    }
    else
    {
        RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightTableViewCellIdentifier forIndexPath:indexPath];
        FoodModel *model = self.foodmodelArray[indexPath.section] [indexPath.row];
        cell.model = model;
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == self.righttableView) {
        return 20;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.righttableView == tableView)
    {
        LeftHeaderView *view = [[LeftHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        CategoryModel *model = self.catemodelArray[section];
        view.name.text = model.name;
        return view;
    }
    return nil;
}


// TableView分区标题即将展示
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    // 当前的tableView是RightTableView，RightTableView滚动的方向向上，RightTableView是用户拖拽而产生滚动的（（主要判断RightTableView用户拖拽而滚动的，还是点击LeftTableView而滚动的）
    if ((self.righttableView == tableView) && !_isScrollDown && self.righttableView.dragging)
    {
        [self selectRowAtIndexPath:section];
    }
}

// TableView分区标题展示结束
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // 当前的tableView是RightTableView，RightTableView滚动的方向向下，RightTableView是用户拖拽而产生滚动的（（主要判断RightTableView用户拖拽而滚动的，还是点击LeftTableView而滚动的）
    if ((self.righttableView == tableView) && _isScrollDown && self.righttableView.dragging)
    {
        [self selectRowAtIndexPath:section + 1];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (self.lefttableView == tableView)
    {
        _selectIndex = indexPath.row;
        [self.righttableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:_selectIndex] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

// 当拖动右边TableView的时候，处理左边TableView
- (void)selectRowAtIndexPath:(NSInteger)index
{
    [self.lefttableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}
#pragma mark - uiscrollviewDelegate
// 标记一下RightTableView的滚动方向，是向上还是向下

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat lastOffsetY = 0;
    
    UITableView *tableView = (UITableView *) scrollView;
    if (self.righttableView == tableView)
    {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}

@end
