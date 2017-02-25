//
//  AIHerbModel.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/24.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIHerbModel : NSObject
/** 名字*/
@property(nonatomic, copy)NSString *name;
/** 图片名字*/
@property(nonatomic, copy)NSString *image;
/** 执照*/
@property(nonatomic, copy)NSString *license;

/** 信用*/
@property(nonatomic, copy)NSString *credit;
/** 描述*/
@property(nonatomic, copy)NSString *descriptionString;


- (instancetype)initWithName:(NSString*)name image:(NSString*)image license:(NSString*)license credit:(NSString*)credit descriptionString:(NSString*)descriptionString;
- (void)all;

@end
