//
//  ViewController.m
//  FirstMVVMDemo
//
//  Created by lvshasha on 2017/7/27.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "ViewController.h"
#import "MainViewModel.h"
#import "MainView.h"

@interface ViewController ()
@property (nonatomic, strong) MainView *mainView;
@property (nonatomic, strong) MainViewModel *mainViewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    self.title = @"第一页";
    self.view.backgroundColor = [UIColor whiteColor];
    self.mainViewModel = [[MainViewModel alloc] init];
    [self configView];
}

- (void)configView
{
    //
    self.mainView = [[MainView alloc] initWithModel:self.mainViewModel];
    self.mainView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.mainView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
