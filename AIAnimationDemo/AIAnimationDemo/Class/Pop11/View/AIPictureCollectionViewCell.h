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
 通过图片是否在window上来控制Scollview是否可以滑动

 @param pictureCollectionCell 当前cell
 @param isOnWindow            相片是否在window上
 */
-(void)pictureCollection:(AIPictureCollectionViewCell *)pictureCollectionCell lockScollViewWithOnWindow:(BOOL)isOnWindow;

@end

@interface AIPictureCollectionViewCell : UICollectionViewCell
/** 图片*/
@property(nonatomic,strong)UIImageView *imageV;
/** 代理*/
@property(nonatomic,weak)id<AIPictureCollectionCellDelegate> delegate;
@end
