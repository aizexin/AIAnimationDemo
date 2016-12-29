//
//  AIFlightData.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/29.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIFlightDataModel : NSObject
/** 摘要*/
@property(nonatomic, copy)NSString *summary;
/** flightNr*/
@property(nonatomic, copy)NSString *flightNr;
/** 登机口*/
@property(nonatomic, copy)NSString *gateNr;
/** 离开地方*/
@property(nonatomic, copy)NSString *departingFrom;
/** 到达*/
@property(nonatomic, copy)NSString *arrivingTo;
/** 天气图片名字*/
@property(nonatomic, copy)NSString *weatherImageName;
/** 显示天气效果*/
@property(nonatomic, assign)BOOL showWeatherEffects;
/** 是否起飞*/
@property(nonatomic, assign,getter=isTakingOff)BOOL takingOff;
/** 飞行状态*/
@property(nonatomic, copy)NSString *flightStatus;







@end
