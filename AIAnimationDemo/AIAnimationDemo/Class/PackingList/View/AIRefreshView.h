//
//  AIRefreshView.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/2/6.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AIRefreshView;
@protocol AIRefreshViewDelegate <NSObject>

- (void)refreshViewDidRefresh:(AIRefreshView*)refreshView;

@end
@interface AIRefreshView : UIView

/** 代理*/
@property(nonatomic,weak)id<AIRefreshViewDelegate> delegate;
/** 填加的滑动视图*/
@property(nonatomic,strong)UIScrollView *scrollView;
/** 是否正在被刷新*/
@property(nonatomic, assign,getter=isRefreshing)BOOL refreshing;
/** 进度*/
@property(nonatomic, assign)CGFloat progress;


/**
 初始化方法

 @param frame 初始frame
 @param scrollView 所要添加的滑动视图
 @return 实体
 */
- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView*)scrollView
;

/**
 结束刷新
 */
- (void)endRefreshing;

/**
 开始刷新
 */
- (void)beginRefreshing;

-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;

@end
