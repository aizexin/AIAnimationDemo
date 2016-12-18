//
//  AIAvatarView.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/14.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIAvatarView : UIView

/** image*/
@property(nonatomic,strong)UIImage *image;
/** 名字*/
@property(nonatomic,copy)NSString *name;
/** 是否应该过度到完成*/
@property(nonatomic, assign)BOOL shouldTransitionToFinishedState;
- (void)bounceOffPoint:(CGPoint)point morphSize:(CGSize)morphSize;
- (void)reset;
@end
