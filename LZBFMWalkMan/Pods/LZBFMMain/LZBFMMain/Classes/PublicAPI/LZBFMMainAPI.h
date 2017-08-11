//
//  LZBFMMainAPI.h
//  Pods
//
//  Created by zibin on 2017/7/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LZBFMMainAPI : NSObject

/**
 获取根控制器
 
 @return rootTabBarCcontroller
 */
+ (UITabBarController *)rootTabBarCcontroller;


/**
 添加子控制器
 
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
+ (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;


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


/**
 设置tabbar中间控件的点击代码块
 
 @param middleClickBlock 点击代码块
 */
+ (void)setTabbarMiddleButtonClick: (void(^)(BOOL isPlaying))middleClickBlock;


/**
 快速获取中间按钮
 
 @return 中间按钮
 */
+ (UIView *)middleView;
@end
