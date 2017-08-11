//
//  LZBFMMainAPI.m
//  Pods
//
//  Created by zibin on 2017/7/15.
//
//

#import "LZBFMMainAPI.h"
#import "BaseTC.h"
#import "BaseTabBar.h"
#import "BaseNC.h"
#import "LZBMiddleView.h"
#import "BaseNavigationBar.h"


@implementation LZBFMMainAPI
+ (BaseTC *)rootTabBarCcontroller
{
    return [BaseTC shareInstance];
}

+(void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired
{
    return[[BaseTC shareInstance] addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];
}


+ (void)setGlobalTextFont:(UIFont *)globalTextFont
{
    [BaseNavigationBar setGlobalTextFont:globalTextFont];
}

+ (void)setGlobalTextColor:(UIColor *)globalTextColor
{
    [BaseNavigationBar setGlobalTextColor:globalTextColor];
}

+ (void)setGlobalBackGroundImage:(UIImage *)backGroundImage
{
    [BaseNavigationBar setGlobalBackGroundImage:backGroundImage];
}

+ (void)setTabbarMiddleButtonClick:(void (^)(BOOL))middleClickBlock
{
    BaseTabBar *tabbar = (BaseTabBar *)[BaseTC shareInstance].tabBar;
    tabbar.callBackMiddleClickBlock = middleClickBlock;
}

+ (LZBMiddleView *)middleView
{
    return [LZBMiddleView middleView];
}

@end
