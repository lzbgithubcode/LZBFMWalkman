//
//  LZBTestVC.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LZBTestVC.h"
#import "LZBTestVC1.h"

@interface LZBTestVC ()

@end

@implementation LZBTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.tag = 111;
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSLog(@"摸到我了");
    [self.navigationController pushViewController:[LZBTestVC1 new] animated:YES];
    
    
    
}

@end
