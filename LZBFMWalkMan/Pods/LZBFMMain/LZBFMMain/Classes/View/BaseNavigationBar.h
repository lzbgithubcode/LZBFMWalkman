//
//  BaseNavigationBar.h
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationBar : UINavigationBar
/**
 设置全局的导航栏背景图片

 @param backGroundImage 背景图片
 */
+ (void)setGlobalBackGroundImage:(UIImage *)backGroundImage;

/**
 设置全局的导航栏文字颜色
 
 @param globalTextColor 文字颜色
 */
+ (void)setGlobalTextColor:(UIColor *)globalTextColor;

/**
 设置全局的导航栏文字字体
 
 @param globalTextFont 文字字体大小
 */
+ (void)setGlobalTextFont:(UIFont *)globalTextFont;
@end
