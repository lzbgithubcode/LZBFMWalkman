//
//  LZBTestVC1.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LZBTestVC1.h"

@interface LZBTestVC1 ()

@end

@implementation LZBTestVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tag = 111;
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
