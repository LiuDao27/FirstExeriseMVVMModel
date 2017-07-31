//
//  MainTableViewCell.h
//  FirstMVVMDemo
//
//  Created by lvshasha on 2017/7/31.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RowModel.h"

@interface MainTableViewCell : UITableViewCell
@property (nonatomic, strong) RowModel *cellModel;
@end
