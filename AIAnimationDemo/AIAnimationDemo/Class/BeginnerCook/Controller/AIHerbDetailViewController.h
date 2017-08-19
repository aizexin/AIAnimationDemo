//
//  AIHerbDetailViewController.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/5.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIBaseViewController.h"
#import "AIHerbModel.h"

@interface AIHerbDetailViewController : AIBaseViewController
/** 数据*/
@property(nonatomic,strong)AIHerbModel *herbModel;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end
