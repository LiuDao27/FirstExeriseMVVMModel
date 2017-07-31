//
//  MainViewModel.m
//  FirstMVVMDemo
//
//  Created by lvshasha on 2017/7/27.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "MainViewModel.h"

@interface MainViewModel ()
@property (nonatomic, strong) NSMutableArray *listArr;  //
@end

@implementation MainViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configModelArr];
    }
    return self;
}

- (void)configModelArr
{
    self.listArr = [NSMutableArray array];
    //
    for (NSInteger i = 0; i < 10; i++) {
        SectionModel *sectionModel = [[SectionModel alloc] init];
        sectionModel.sectionName = [NSString stringWithFormat:@"%ld", (long)i];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSInteger j = 0; j < 20; j++) {
            RowModel *rowModel = [[RowModel alloc] init];
            rowModel.name = [NSString stringWithFormat:@"第%ld行", (long)j];
            rowModel.detail = [NSString stringWithFormat:@"我是第%ld行", (long)j];
            [modelArray addObject:rowModel];
        }
        sectionModel.rowModelArr = modelArray;
        [self.listArr addObject:sectionModel];
    }
}


// section个数
- (NSInteger)getSectionCount
{
    return self.listArr.count;
}
// row个数
- (NSInteger)getRowCount:(NSInteger)section
{
    SectionModel *sectionModel = [self.listArr objectAtIndex:section];
    return sectionModel.rowModelArr.count;
}

// 获取model
- (SectionModel *)getSectionModelWithSection:(NSInteger)section
{
    SectionModel *sectionModel = [self.listArr objectAtIndex:section];
    return sectionModel;
}

// 获取row的model
- (RowModel *)getRowModelWithIndexPath:(NSInteger)indexPathRow section:(NSInteger)section
{
    SectionModel *secModel = [self.listArr objectAtIndex:section];
    NSArray *rowArr = secModel.rowModelArr;
    RowModel *rModel = [rowArr objectAtIndex:indexPathRow];
    return rModel;
}

// 替换model
- (void)changeCellModelWithIndexPath:(NSInteger)indexPathSection row:(NSInteger)row
{
    for (NSInteger i = 0; i < self.listArr.count; i++) {
        SectionModel *sectionModel = [[SectionModel alloc] init];
        if (i == indexPathSection) {
            sectionModel = [self.listArr objectAtIndex:i];
            for (NSInteger j = 0; j < sectionModel.rowModelArr.count; j++) {
                RowModel *rowModel = [[RowModel alloc] init];
                if (j == row) {
                    rowModel = [sectionModel.rowModelArr objectAtIndex:j];
                    rowModel.name = @"替换";
                    rowModel.detail = @"被替换的cell";
                }
            }
        }
    }
}


@end
