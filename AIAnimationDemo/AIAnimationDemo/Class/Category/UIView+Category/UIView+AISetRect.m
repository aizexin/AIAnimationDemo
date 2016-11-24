//
//  UIView+AISetRect.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/24.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "UIView+AISetRect.h"

@implementation UIView(AISetRect)

- (CGPoint)ai_viewOrigin {
    
    return self.frame.origin;
}


-(void)setAi_viewOrigin:(CGPoint)ai_viewOrigin {
    
    CGRect newFrame = self.frame;
    newFrame.origin = ai_viewOrigin;
    self.frame      = newFrame;
}

- (CGSize)ai_viewSize {
    
    return self.frame.size;
}


-(void)setAi_viewSize:(CGSize)ai_viewSize {
    
    CGRect newFrame = self.frame;
    newFrame.size   = ai_viewSize;
    self.frame      = newFrame;
}

- (CGFloat)ai_x {
    
    return self.frame.origin.x;
}


-(void)setAi_x:(CGFloat)ai_x {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = ai_x;
    self.frame        = newFrame;
}

- (CGFloat)ai_y {
    
    return self.frame.origin.y;
}

-(void)setAi_y:(CGFloat)ai_y {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = ai_y;
    self.frame        = newFrame;
}

- (CGFloat)ai_width {
    
    return CGRectGetWidth(self.bounds);
}

- (void)setAi_width:(CGFloat)ai_width {
    
    CGRect newFrame     = self.frame;
    newFrame.size.width = ai_width;
    self.frame          = newFrame;
}

- (CGFloat)ai_height {
    
    return CGRectGetHeight(self.bounds);
}

-(void)setAi_height:(CGFloat)ai_height {
    
    CGRect newFrame      = self.frame;
    newFrame.size.height = ai_height;
    self.frame           = newFrame;
}

- (CGFloat)ai_top {
    
    return self.frame.origin.y;
}

-(void)setAi_top:(CGFloat)ai_top {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = ai_top;
    self.frame        = newFrame;
}

- (CGFloat)ai_bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setAi_bottom:(CGFloat)ai_bottom {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = ai_bottom - self.frame.size.height;
    self.frame        = newFrame;
}

- (CGFloat)ai_left {
    
    return self.frame.origin.x;
}

-(void)setAi_left:(CGFloat)ai_left {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = ai_left;
    self.frame        = newFrame;
}

- (CGFloat)ai_right {
    
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setAi_right:(CGFloat)ai_right {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = ai_right - self.frame.size.width;
    self.frame        = newFrame;
}

- (CGFloat)ai_centerX {
    
    return self.center.x;
}

-(void)setAi_centerX:(CGFloat)ai_centerX {
    
    CGPoint newCenter = self.center;
    newCenter.x       = ai_centerX;
    self.center       = newCenter;
}

- (CGFloat)ai_centerY {
    
    return self.center.y;
}

-(void)setAi_centerY:(CGFloat)ai_centerY {
    
    CGPoint newCenter = self.center;
    newCenter.y       = ai_centerY;
    self.center       = newCenter;
}

- (CGFloat)ai_middleX {
    
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)ai_middleY {
    
    return CGRectGetHeight(self.bounds) / 2.f;
}

- (CGPoint)ai_middlePoint {
    
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}


@end
