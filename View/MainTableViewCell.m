//
//  MainTableViewCell.m
//  FirstMVVMDemo
//
//  Created by lvshasha on 2017/7/31.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "MainTableViewCell.h"

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface MainTableViewCell ()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@end

@implementation MainTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    UILabel *nameLabel = [UILabel new];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.frame = CGRectMake(10, 10, 80, 30);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *detailLabel = [UILabel new];
    detailLabel.textAlignment = NSTextAlignmentRight;
    detailLabel.textColor = [UIColor grayColor];
    detailLabel.font = [UIFont systemFontOfSize:14];
    detailLabel.frame = CGRectMake(120, 10, WIDTH - 130, 30);
    [self.contentView addSubview:detailLabel];
    self.detailLabel = detailLabel;
}

- (void)setCellModel:(RowModel *)cellModel
{
    _cellModel = cellModel;
    self.nameLabel.text = cellModel.name;
    self.detailLabel.text = cellModel.detail;
}


@end
