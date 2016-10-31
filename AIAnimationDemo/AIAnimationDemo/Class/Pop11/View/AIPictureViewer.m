//
//  AIPictureViewer.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/10/23.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPictureViewer.h"
#import "AIPictureCollectionViewCell.h"

#define identifier @"identifier"
@interface AIPictureViewer ()<UICollectionViewDataSource,AIPictureCollectionCellDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
/** 固定的frame*/
@property(nonatomic,assign)CGRect fixedRect;

@end
static const CGFloat pictureHeight = 200.;
static const CGFloat padding       = 4.;
@implementation AIPictureViewer


#pragma mark  -lazy
-(CGRect)fixedRect{
    _fixedRect = CGRectMake(0, MainSize.height - pictureHeight, MainSize.width, pictureHeight);
    return _fixedRect;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize                    = CGSizeMake((MainSize.width - 3*padding)/3, pictureHeight);
        _collectionView                        =\
        [[UICollectionView alloc]initWithFrame:self.fixedRect collectionViewLayout:flowLayout];
        _collectionView.backgroundColor         = [UIColor lightGrayColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource             = self;
        _collectionView.contentSize            = CGSizeMake(flowLayout.itemSize.width * self.imageArrayM.count, pictureHeight);
        [_collectionView registerClass:[AIPictureCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}
-(NSMutableArray *)imageArrayM{
    if (!_imageArrayM) {
        _imageArrayM = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    }
    return _imageArrayM;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //固定大小
        self.frame            = self.fixedRect;
        //collectionView
        [self addSubview:self.collectionView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark --UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArrayM.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AIPictureCollectionViewCell *cell = \
    [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.delegate                     = self;
    cell.imageV.image                 = [UIImage imageNamed:self.imageArrayM[indexPath.item]];
    return cell;
}

#pragma mark --AIPictureCollectionCellDelegate
-(void)pictureCollection:(AIPictureCollectionViewCell *)pictureCollectionCell didGestureSelectedImage:(UIImage *)image andImageWorldRect:(CGRect)imageWorldRect{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pictureViewer:didGestureSelectedImage:andImageWorldRect:)]) {
        [self.delegate pictureViewer:self didGestureSelectedImage:image andImageWorldRect:imageWorldRect];
    }
}

-(void)pictureCollection:(AIPictureCollectionViewCell *)pictureCollectionCell didTranslationPoint:(CGPoint)translationPoint{
    
    self.collectionView.contentOffset = CGPointMake(-translationPoint.x, 0);
}


@end

























