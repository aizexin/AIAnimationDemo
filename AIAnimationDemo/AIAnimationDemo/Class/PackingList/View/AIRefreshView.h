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
/** 滑动视图*/
@property(nonatomic,strong)UIScrollView *scrollView;
/** 是否正在被刷新*/
@property(nonatomic, assign,getter=isRefreshing)BOOL refreshing;
/** 进度*/
@property(nonatomic, assign)CGFloat progress;

- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView*)scrollView
;
- (void)endRefreshing;
- (void)beginRefreshing;

-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;

@end
