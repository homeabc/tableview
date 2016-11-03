//
//  CollectionViewController.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/25.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "TableViewModel.h"
#import "CollectionModel.h"
#import "CollectionViewCell.h"
#import "HeaderView.h"
#import "MyLeftTableViewCell.h"
#import "CollectionViewFlowLayout.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

static NSString * const collectionViewIdentifier = @"collectionViewIdentifier";

static NSString * const headIdentIdentifier = @"headIdentIdentifier";

static NSString * const tableviewIdentifier = @"tableviewIdentifier";


@interface CollectionViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger _selectIndex;
    BOOL _isScrollDown;
}
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *tablemodelArray;

@property (strong, nonatomic) NSMutableArray *collectmodelArray;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectIndex = 0;
    _isScrollDown = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"liwushuo" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *categories = dict[@"data"][@"categories"];
    for (NSDictionary *dict in categories) {
        TableViewModel *model = [[TableViewModel alloc] initWithDictionary:dict];
        [self.tablemodelArray addObject:model];
        NSMutableArray *array = [NSMutableArray array];
        for (CollectionModel *models in model.subcategories) {
            [array addObject:models];
        }
        [self.collectmodelArray addObject:array];
    }
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
    
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    
}

-(NSMutableArray *)tablemodelArray
{
    if (_tablemodelArray == nil) {
        _tablemodelArray = [NSMutableArray array];
    }
    return _tablemodelArray;
}

-(NSMutableArray *)collectmodelArray
{
    if (_collectmodelArray == nil) {
        _collectmodelArray = [NSMutableArray array];
    }
    return _collectmodelArray;
}


- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 55;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorColor = [UIColor clearColor];
        [_tableView registerClass:[MyLeftTableViewCell class] forCellReuseIdentifier:tableviewIdentifier];

    }
    return _tableView;
}

-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        CollectionViewFlowLayout *flowlayout = [[CollectionViewFlowLayout alloc] init];
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowlayout.minimumInteritemSpacing = 2;
        flowlayout.minimumLineSpacing = 2;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(2 + 80, 2 + 64, SCREEN_WIDTH - 80 - 4, SCREEN_HEIGHT - 64 - 4) collectionViewLayout:flowlayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        //注册cell
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:collectionViewIdentifier];
        [_collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentIdentifier];
    }
    return _collectionView;
}

#pragma mark - tableviewdeletage
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tablemodelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableviewIdentifier forIndexPath:indexPath];
    TableViewModel *model = self.tablemodelArray[indexPath.row];
    cell.model = model;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndex = indexPath.row;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:_selectIndex] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

#pragma mark -collectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.tablemodelArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectmodelArray[section] count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewIdentifier forIndexPath:indexPath];
    CollectionModel *model = self.collectmodelArray[indexPath.section] [indexPath.row];
    cell.model = model;
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 80 - 4 - 4) / 3,
                      (SCREEN_WIDTH - 80 - 4 - 4) / 3 + 30);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusalbeView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
     
        HeaderView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentIdentifier forIndexPath:indexPath];
        
        TableViewModel *model = self.tablemodelArray[indexPath.section];
        headView.title.text = model.name;
        reusalbeView = headView;
    }
    

    return reusalbeView;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 30);
}

//collectionView标题即将展示
// CollectionView分区标题即将展示
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    // 当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (!_isScrollDown && collectionView.dragging)
    {
        [self selectRowAtIndexPath:indexPath.section];
    }
}

// CollectionView分区标题展示结束
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(nonnull UICollectionReusableView *)view forElementOfKind:(nonnull NSString *)elementKind atIndexPath:(nonnull NSIndexPath *)indexPath
{
    // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (_isScrollDown && collectionView.dragging)
    {
        [self selectRowAtIndexPath:indexPath.section + 1];
    }
}

//当拖动collectionview的时候。处理tableview
- (void)selectRowAtIndexPath:(NSInteger)index
{
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

#pragma mark - UIScrollView Delegate
// 标记一下CollectionView的滚动方向，是向上还是向下
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float lastOffsetY = 0;
    
    if (self.collectionView == scrollView)
    {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}












@end
