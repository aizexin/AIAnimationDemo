//
//  AIHorizontalItemListView.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/20.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIPackingModel.h"
@class AIHorizontalItemListView;
@protocol AIHorizontalItemListViewDelegate <NSObject>

-(void)horizontalItemListView:(AIHorizontalItemListView*)listView didSelectedModel:(AIPackingModel*)model;

@end
@interface AIHorizontalItemListView : UIView
/** 代理*/
@property(nonatomic,weak)id<AIHorizontalItemListViewDelegate> delegate;

@end
