//
//  LZBMiddleView.h
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZBMiddleView : UIView

/**
  创建中间View单例
 */
+ (instancetype)shareInstance;

/**
 类方法快速创建中间View
 */
+ (LZBMiddleView *)middleView;

/**
 控制是否正在播放
 */
@property (nonatomic, assign) BOOL   isPlaying;

/**
 中间图片
 */
@property (nonatomic, strong) UIImage *middleImg;


/**
 点击中间按钮的回调执行代码块
 */
@property (nonatomic, copy) void(^callBackMiddleClickBlock)(BOOL isPlaying);
- (void)setCallBackMiddleClickBlock:(void (^)(BOOL isPlaying))callBackMiddleClickBlock;
@end
