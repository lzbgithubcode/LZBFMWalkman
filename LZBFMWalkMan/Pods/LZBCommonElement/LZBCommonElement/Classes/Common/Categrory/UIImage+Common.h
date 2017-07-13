//
//  UIImage+Common.h
//  LZBFMWalkMan
//
//  Created by zibin on 2017/7/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)
/**
   转换为原始图片
 @param imageName 图片名
 @return 原始图片
 */
+ (UIImage *)originImageWithName:(NSString *)imageName;


/**
  把图片裁剪成圆形

 @return 圆形图片
 */
- (UIImage *)circleImage;
@end
