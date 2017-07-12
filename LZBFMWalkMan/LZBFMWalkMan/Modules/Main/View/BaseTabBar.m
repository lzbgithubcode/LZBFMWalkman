//
//  BaseTabBar.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseTabBar.h"
#import "LZBMiddleView.h"

@interface BaseTabBar()

@property (nonatomic, weak) LZBMiddleView *middleView;

@end

@implementation BaseTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
  if(self = [super initWithFrame:frame])
  {
      [self setupInit];
  }
    return self;
}

- (void)setupInit
{
    
}


- (LZBMiddleView *)middleView
{
  if(_middleView == nil)
  {
      _middleView = [LZBMiddleView middleView];
  }
    return _middleView;
}
@end
