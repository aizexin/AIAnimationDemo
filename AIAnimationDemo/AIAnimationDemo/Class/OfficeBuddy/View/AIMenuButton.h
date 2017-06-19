//
//  AIMenuItem.h
//  AIAnimationDemo
//
//  Created by sober on 2017/5/26.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIMenuButton : UIView
@property(nonatomic,copy)void(^tapHandler)();
@end
