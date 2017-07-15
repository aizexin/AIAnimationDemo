//
//  AIDownLoadTaskModel.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/7/15.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//  主要用来计算下载速度

#import <Foundation/Foundation.h>

@interface AIDownLoadTaskModel : NSObject
/** 一秒读取到大数据*/
@property(nonatomic,assign)int64_t readData;
/** 已经有的数据 */
@property(nonatomic,assign)int64_t completedUnitCount;

/**速度 */
@property(nonatomic,assign)long long speed;
/** 上一个时间*/
@property (nonatomic, strong) NSDate *lastDate;
@end
