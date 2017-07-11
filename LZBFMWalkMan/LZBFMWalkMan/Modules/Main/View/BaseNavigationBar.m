//
//  BaseNavigationBar.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseNavigationBar.h"

@implementation BaseNavigationBar
+ (void)setGlobalBackGroundImage:(UIImage *)backGroundImage
{
    if(backGroundImage == nil) return;
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"BaseNC"), nil];
    [navBar setBackgroundImage:backGroundImage forBarMetrics:UIBarMetricsDefault];
}

+ (void)setGlobalTextColor:(UIColor *)globalTextColor
{
    if(globalTextColor == nil) return;
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"BaseNC"), nil];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : globalTextColor}];
}

+ (void)setGlobalTextFont:(UIFont *)globalTextFont
{
    if(globalTextFont == nil)
    {
        globalTextFont = [UIFont systemFontOfSize:16.0];
    }
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"BaseNC"), nil];
    [navBar setTitleTextAttributes:@{NSFontAttributeName : globalTextFont}];
}

@end
