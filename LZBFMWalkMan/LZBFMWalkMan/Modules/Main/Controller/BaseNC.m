//
//  BaseNC.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseNC.h"
#import "BaseNavigationBar.h"
#import "LZBMiddleView.h"

@interface BaseNC ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNC

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
  if(self = [super initWithRootViewController:rootViewController])
  {
     //设置导航条
      [self setValue:[[BaseNavigationBar alloc] init] forKey:@"navigationBar"];
  }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGestureRecognier];
    
}

- (void)addGestureRecognier
{
   UIGestureRecognizer *gester = self.interactivePopGestureRecognizer;
    
    //自定义手势
    UIPanGestureRecognizer *panGester = [[UIPanGestureRecognizer alloc] initWithTarget:gester.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    // 其实就是控制器的容器视图
    [gester.view addGestureRecognizer:panGester];
    
    gester.delaysTouchesBegan = YES;
    panGester.delegate = self;
    
}
/**
 *  当控制器, 拿到导航控制器(需要是这个子类), 进行压栈时, 都会调用这个方法
 *
 *  @param viewController 要压栈的控制器
 *  @param animated       动画
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 拦截每一个push的控制器, 进行统一设置
    if (self.childViewControllers.count > 0) {
        //统一设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_n"] style:0 target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    //设置标志
    if(viewController.view.tag == 111)
    {
        viewController.view.tag = 222;
        LZBMiddleView *middleView = [LZBMiddleView middleView];
        middleView.callBackMiddleClickBlock = [LZBMiddleView shareInstance].callBackMiddleClickBlock;
        middleView.isPlaying = [LZBMiddleView shareInstance].isPlaying;
        middleView.middleImg = [LZBMiddleView shareInstance].middleImg;
        
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - frame.size.width) * 0.5;
        frame.origin.y = screenSize.height - frame.size.height;
        middleView.frame = frame;
        [viewController.view addSubview:middleView];
        
    }
    
    
}


- (void)back
{
    [self popViewControllerAnimated:YES];
}



#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    // 如果根控制器也要返回手势有效, 就会造成假死状态
    // 所以, 需要过滤根控制器
    if(self.childViewControllers.count == 1) {
        return NO;
    }
    
    return YES;
    
}


@end
