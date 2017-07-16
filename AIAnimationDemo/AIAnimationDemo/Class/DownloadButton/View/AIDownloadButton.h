//
//  AIDownloadButton.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/8.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AIDownloadButtonNone,
    AIDownloadButtonEnd, //完成
    AIDownloadButtonSuspend,  //暂停
    AIDownloadButtonLoading,   //下载中
    AIDownloadButtonWillLoad,  //将要下载（小圆点动画完成后）
    AIDownloadButtonResume     //恢复下载
} AIDownloadButtonStates;
@interface AIDownloadButton : UIView
/** 文件大小*/
@property(nonatomic, copy)NSString * _Nullable text;
/** 进度比例*/
@property(nonatomic, assign)CGFloat progress;
/** 状态*/
@property(nonatomic, assign)AIDownloadButtonStates state;
/** block*/
@property(nonatomic, copy)void(^ _Nullable block)(AIDownloadButton * _Nullable button);

/**
 复位
 */
-(void)reset;

/**
 UI暂停
 */
- (void)suspend;

/**
 UI从暂停中恢复
 */
- (void)resume;
@end
