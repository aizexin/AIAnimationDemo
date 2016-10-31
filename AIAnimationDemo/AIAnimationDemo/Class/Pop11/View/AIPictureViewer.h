//
//  AIPictureViewer.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AIPictureViewer;
@protocol AIPictureViewerDelegate <NSObject>

-(void)pictureViewer:(AIPictureViewer*)pictureViewer didGestureSelectedImage:(UIImage*)image andImageWorldRect:(CGRect)imageWorldRect;

@end

@interface AIPictureViewer : UIView

/** 图片数组*/
@property(nonatomic,strong)NSMutableArray *imageArrayM;
/** 代理*/
@property(nonatomic,weak)id<AIPictureViewerDelegate> delegate;
@end
