//
//  AIImageViewCard.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/13.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIImageViewCard : UIImageView

/**title */
@property(nonatomic,copy)NSString *title;

/**被选中 */
@property(nonatomic,copy)void (^didSelectBlock)(AIImageViewCard *ImageViewCard);
- (instancetype)initWithImageNamed:(NSString *)imageNamed title:(NSString*)title;

@end
