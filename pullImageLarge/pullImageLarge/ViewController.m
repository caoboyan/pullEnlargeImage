//
//  ViewController.m
//  headerView
//
//  Created by Boyan Cao on 16/3/30.
//  Copyright © 2016年 2015-293. All rights reserved.
//

#import "ViewController.h"

static CGFloat topSpacing = 300;

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * dataList;

@property (nonatomic, strong) UIView * headerView;

@end

@implementation ViewController

-(NSArray *)dataList{
    if (!_dataList) {
        _dataList = [[NSArray alloc]init];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(topSpacing, 0, 0, 0);
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, -topSpacing , [UIScreen mainScreen].bounds.size.width, topSpacing)];
    headerView.backgroundColor = [UIColor orangeColor];
    self.headerView = headerView;
    [self.tableView addSubview:self.headerView];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试%i",indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect rect = self.headerView.frame;
    rect.origin.y = scrollView.contentOffset.y;
    rect.size.height = -scrollView.contentOffset.y;
    self.headerView.frame = rect;
    
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

@end
