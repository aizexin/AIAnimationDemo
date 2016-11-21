//
//  AISettingViewController.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIBaseViewController.h"
#import "AISettingCellAdapter.h"
@interface AIBaseSettingViewController : AIBaseViewController


-(NSMutableArray <NSMutableArray<AISettingCellAdapter*> *>*)getDataSource;
@end
