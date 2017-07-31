//
//  MainViewModel.h
//  FirstMVVMDemo
//
//  Created by lvshasha on 2017/7/27.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionModel.h"
#import "RowModel.h"

// 数据处理的ViewModel
@interface MainViewModel : NSObject
// section个数
- (NSInteger)getSectionCount;
// row个数
- (NSInteger)getRowCount:(NSInteger)section;
// 获取model
- (SectionModel *)getSectionModelWithSection:(NSInteger)section;
// 获取row的model
- (RowModel *)getRowModelWithIndexPath:(NSInteger)indexPathRow section:(NSInteger)section;
// 替换model
- (void)changeCellModelWithIndexPath:(NSInteger)indexPathSection row:(NSInteger)row;
@end
