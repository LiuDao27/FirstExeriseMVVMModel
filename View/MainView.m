//
//  MainView.m
//  FirstMVVMDemo
//
//  Created by lvshasha on 2017/7/27.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "MainView.h"
#import "MainTableViewCell.h"


#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface MainView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) MainViewModel *mainViewModel;
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation MainView
- (instancetype)initWithModel:(MainViewModel *)viewModel
{
    self = [super init];
    if (self) {
        self.mainViewModel = viewModel;
        [self createTableView];
    }
    return self;
}

// View
- (void)createTableView
{
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self addSubview:self.mainTableView];
}

#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.mainViewModel getSectionCount];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionModel *headerModel = [self.mainViewModel getSectionModelWithSection:section];
    UILabel *headerLabel = [self configHeader];
    headerLabel.text = [NSString stringWithFormat:@"我是第%@个section", headerModel.sectionName];
    return headerLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mainViewModel getRowCount:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idStr = @"MainTableViewCell";
    MainTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (!cell) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idStr];
    }
    //
    cell.cellModel = [self.mainViewModel getRowModelWithIndexPath:indexPath.row section:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mainViewModel changeCellModelWithIndexPath:indexPath.section row:indexPath.row];
    [tableView reloadData];
}

- (UILabel *)configHeader {
    UILabel *headerLabel = [UILabel new];
    headerLabel.backgroundColor = [UIColor whiteColor];
    headerLabel.font = [UIFont systemFontOfSize:14];
    headerLabel.textColor = [UIColor redColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    return headerLabel;
}

@end
