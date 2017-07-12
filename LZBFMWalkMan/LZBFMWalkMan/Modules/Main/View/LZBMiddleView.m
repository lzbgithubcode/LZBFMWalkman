//
//  LZBMiddleView.m
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LZBMiddleView.h"
#import "CALayer+PauseAimate.h"

static LZBMiddleView *_instance;

#define playAnnimationName @"playAnnimation"  //动画标识名称

@interface LZBMiddleView()

/**
 中间显示图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *middleImgView;


/**
 中间播放控制按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

@implementation LZBMiddleView

#pragma mark -API
/**
 创建中间View单例
 */
+ (instancetype)shareInstance
{
  if(_instance == nil)
  {
     _instance = [[[NSBundle mainBundle] loadNibNamed:@"LZBMiddleView" owner:nil options:nil] firstObject];
  }
    return _instance;
}

/**
 类方法快速创建中间View
 */
+ (LZBMiddleView *)middleView
{
    return [LZBMiddleView shareInstance];
}

- (void)setIsPlaying:(BOOL)isPlaying
{
    if(_isPlaying == isPlaying) return;
    _isPlaying = isPlaying;
    if(isPlaying)  //播放
    {
        [self.playButton setImage:nil forState:UIControlStateNormal];
        [self.middleImgView.layer resumeAnimate];
    }
    else
    {
        UIImage *image = [UIImage imageNamed:@"tabbar_np_play"];
        [self.playButton setImage:image forState:UIControlStateNormal];
        [self.middleImgView.layer pauseAnimate];
    }
}
- (void)setMiddleImg:(UIImage *)middleImg
{
    _middleImg =middleImg;
    self.middleImgView.image = middleImg;
}



#pragma mark-private

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.middleImgView.layer.masksToBounds = YES;
    self.middleImg = self.middleImgView.image;
    [self.playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    //移除动画
    [self.middleImgView.layer removeAnimationForKey:playAnnimationName];
    //增加动画
    [self addRotationAnimationWithView:self.middleImgView];
     //暂停动画
    [self.middleImgView.layer pauseAnimate];
    
    //增加通知监听状态
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.middleImgView.layer.cornerRadius = self.middleImgView.frame.size.width * 0.5;
}

- (void)playButtonClick:(UIButton *)playButton
{
    if(self.callBackMiddleClickBlock)
        self.callBackMiddleClickBlock(self.isPlaying);
}


- (void)addRotationAnimationWithView:(UIView *)animaitonView
{
    CABasicAnimation *basicAnnimation = [[CABasicAnimation alloc] init];
    basicAnnimation.keyPath = @"transform.rotation.z";
    basicAnnimation.fromValue = @0;
    basicAnnimation.toValue = @(M_PI * 2);
    basicAnnimation.duration = 30;
    basicAnnimation.repeatCount = MAXFLOAT;
    basicAnnimation.removedOnCompletion = NO;
    [animaitonView.layer addAnimation:basicAnnimation forKey:@"playAnnimation"];
}

@end
