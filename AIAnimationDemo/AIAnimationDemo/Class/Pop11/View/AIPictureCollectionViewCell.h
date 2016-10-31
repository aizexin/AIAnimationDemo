//
//  AIPictureCollectionViewCell.h
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AIPictureCollectionViewCell;
@protocol AIPictureCollectionCellDelegate <NSObject>

/**
 在图片拉出的时候调用

 @param pictureCollectionCell 当前cell
 @param image             被拉出的那张图片
 @param imageWorldRect   选中的图片的世界坐标rect
 */
-(void)pictureCollection:(AIPictureCollectionViewCell*)pictureCollectionCell didGestureSelectedImage:(UIImage*)image andImageWorldRect:(CGRect)imageWorldRect;


/**
 在图片横向滑动的时候调用

 @param pictureCollectionCell 当前cell
 @param translationPoint      手势移动的距离
 */
-(void)pictureCollection:(AIPictureCollectionViewCell *)pictureCollectionCell didTranslationPoint:(CGPoint)translationPoint;

@end

@interface AIPictureCollectionViewCell : UICollectionViewCell
/** 图片*/
@property(nonatomic,strong)UIImageView *imageV;
/** 代理*/
@property(nonatomic,weak)id<AIPictureCollectionCellDelegate> delegate;
@end
