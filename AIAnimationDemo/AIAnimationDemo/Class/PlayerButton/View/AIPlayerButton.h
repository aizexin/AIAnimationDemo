//
//  AIPlayerButton.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/29.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIPlayerButton : UIButton


/**被点击回调 */
@property(nonatomic,copy)void (^onClickblock)(AIPlayerButton *button);
@end
