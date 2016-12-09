//
//  AIOvalView.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/6.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AITmallTypeLight,
    AITmallTypeBlack,
} AITmallType;
@interface AITmallLoadingView : UIView

/**
 开始动画
 */
- (void)startAnimation;
/** 类型*/
@property(nonatomic,assign)AITmallType type;

@end
