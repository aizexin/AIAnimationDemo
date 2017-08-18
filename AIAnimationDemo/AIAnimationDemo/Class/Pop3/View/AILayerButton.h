//
//  AILayerButton.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AILayerButtonStatus_Normal,
    AILayerButtonStatus_Hilight
} AILayerButtonStatus;

@interface AILayerButton : UIButton

@property(nonatomic,assign)AILayerButtonStatus statu;

@end
