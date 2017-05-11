//
//  AIDownloadButton.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/8.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIDownloadButton : UIView
/** 文件大小*/
@property(nonatomic, copy)NSString * _Nullable text;
/** 进度比例*/
@property(nonatomic, assign)CGFloat progress;
/** 是否被选中*/
@property(nonatomic, assign,getter=isSelected)BOOL selected;
/** block*/
@property(nonatomic, copy)void(^ _Nullable block)();
-(void)resume;
@end
