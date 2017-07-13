//
//  BaseTC.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseTC.h"
#import "BaseTabBar.h"
#import "BaseNC.h"
#import "UIImage+Common.h"
#import "LZBMiddleView.h"

@interface BaseTC ()

@end

@implementation BaseTC

+ (instancetype)shareInstance {
    
    static BaseTC *_tabbarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tabbarC = [[BaseTC alloc] init];
    });
    return _tabbarC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置tabbar
    [self setValue:[[BaseTabBar alloc] init] forKey:@"tabBar"];
    
}

+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(BaseTC *tabBarC))addVCBlock
{
    BaseTC *tc = [[BaseTC alloc]init];
    if(addVCBlock)
        addVCBlock(tc);
    return tc;
}

- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        BaseNC *nav = [[BaseNC alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
//    UIViewController *vc = self.childViewControllers[selectedIndex];
//    if (vc.view.tag == 111) {
//        vc.view.tag = 222;
//        LZBMiddleView *middleView = [LZBMiddleView middleView];
//        middleView.callBackMiddleClickBlock = [LZBMiddleView shareInstance].callBackMiddleClickBlock;
//        middleView.isPlaying = [LZBMiddleView shareInstance].isPlaying;
//        middleView.middleImg = [LZBMiddleView shareInstance].middleImg;
//        CGRect frame = middleView.frame;
//        frame.size.width = 65;
//        frame.size.height = 65;
//        CGSize screenSize = [UIScreen mainScreen].bounds.size;
//        frame.origin.x = (screenSize.width - frame.size.width) * 0.5;
//        frame.origin.y = screenSize.height - frame.size.height;
//        middleView.frame = frame;
//        [vc.view addSubview:middleView];
//    }
    
    
}



@end
