//
//  BaseTabBar.h
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBar : UITabBar

/**
  点击中间按钮点击回调的执行代码块
 */
@property (nonatomic, copy) void(^callBackMiddleClickBlock)(BOOL isPlaying);
@end
