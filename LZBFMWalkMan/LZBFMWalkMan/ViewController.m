//
//  ViewController.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBMiddleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LZBMiddleView *middleView1 = [LZBMiddleView shareInstance];
    LZBMiddleView *middleView2 = [LZBMiddleView middleView];
    NSLog(@"=----%p------%p",middleView1,middleView2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
