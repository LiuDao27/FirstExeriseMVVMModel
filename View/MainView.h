//
//  MainView.h
//  FirstMVVMDemo
//
//  Created by lvshasha on 2017/7/27.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"

@interface MainView : UIView
- (instancetype)initWithModel:(MainViewModel *)viewModel;
@end
