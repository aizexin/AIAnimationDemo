//
//  AIPictureViewer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPictureViewer.h"

@interface AIPictureViewer ()

@property(nonatomic,strong)UICollectionView *colloectionView;
/** 固定的frame*/
@property(nonatomic,assign)CGRect fixedRect;
@end
static const CGFloat pictureHeight = 200.;
@implementation AIPictureViewer


#pragma mark  -lazy
-(CGRect)fixedRect{
    _fixedRect = CGRectMake(0, MainSize.height - pictureHeight, MainSize.width, pictureHeight);
    return _fixedRect;
}
-(UICollectionView *)colloectionView{
    if (!_colloectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _colloectionView = [[UICollectionView alloc]initWithFrame:self.fixedRect collectionViewLayout:flowLayout];
    }
    return _colloectionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //固定大小
        self.frame            = self.fixedRect;
        //collectionView
        
    }
    return self;
}

@end
