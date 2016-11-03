//
//  ViewController.m
//  两个tableview联动效果
//
//  Created by 洪福清 on 16/10/24.
//  Copyright © 2016年 BJTYL. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *oneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    [oneBtn setTitle:@"tableview联动" forState:UIControlStateNormal];
    [oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [oneBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneBtn];
    
    
    UIButton *twoBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 100, 100)];
    [twoBtn setTitle:@"collection联动" forState:UIControlStateNormal];
    [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(twoBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twoBtn];
    
    

    
}

- (void)click
{
    TableViewController *tableVc = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableVc animated:YES];
}

- (void)twoBtnclick
{
    CollectionViewController *collectionVc = [[CollectionViewController alloc] init];
    [self.navigationController pushViewController:collectionVc animated:YES];
}






@end
