//
//  BaseTabBar.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseTabBar.h"
#import "LZBMiddleView.h"
#import "UIView+LayoutFrame.h"

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
    // 设置样式, 去除tabbar上面的黑线
    self.barStyle = UIBarStyleBlack;
    
    // 设置tabbar 背景图片
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"tabbar_bg@2x.png" ofType:nil inDirectory:@"LZBFMMain.bundle/"];
    self.backgroundImage = [UIImage imageWithContentsOfFile:path];
   // self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    
    // 添加一个按钮, 准备放在中间
    CGFloat width = 65;
    CGFloat height = 65;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.middleView.frame = CGRectMake((screenSize.width - width) * 0.5, (screenSize.height - height), width, height);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.items.count;
    NSArray *subViews = self.subviews;
    // 确定单个控件的大小
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    CGFloat btnY = 5;
    NSInteger index = 0;
    for (UIView *subView in subViews)
    {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            if (index == count / 2) {
                index ++;
            }
            
            CGFloat btnX = index * btnW;
            subView.frame = CGRectMake(btnX, btnY, btnW, btnH);
            index ++;
        }
    }
    self.middleView.x = (self.frame.size.width - self.middleView.width) *0.5;
    self.middleView.y = self.height - self.middleView.height;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    
    // 设置允许交互的区域
    // 1. 转换点击在tabbar上的坐标点, 到中间按钮上
    CGPoint pointInMiddleBtn = [self convertPoint:point toView:self.middleView];
    
    // 2. 确定中间按钮的圆心
    CGPoint middleBtnCenter = CGPointMake(33, 33);
    
    // 3. 计算点击的位置距离圆心的距离
    CGFloat distance = sqrt(pow(pointInMiddleBtn.x - middleBtnCenter.x, 2) + pow(pointInMiddleBtn.y - middleBtnCenter.y, 2));
    
    // 4. 判定中间按钮区域之外
    if (distance > 33 && pointInMiddleBtn.y < 18) {
        return NO;
    }
    
    return YES;
}


- (LZBMiddleView *)middleView
{
  if(_middleView == nil)
  {
      _middleView = [LZBMiddleView middleView];
      [self addSubview:_middleView];
  }
    return _middleView;
}
@end
