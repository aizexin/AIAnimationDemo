//
//  AIHorizontalItemListView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/1/20.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIHorizontalItemListView.h"
#import "AIPackingCollectionViewCell.h"
@interface AIHorizontalItemListView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,weak)UICollectionView *collectionView;
/** 数据源*/
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

static NSString *identifier = @"cell";
@implementation AIHorizontalItemListView

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i = 0; i < 5; i++) {
            NSString *imageString = [NSString stringWithFormat:@"summericons_100px_0%d",i];
            [_dataSource addObject:imageString];
        }
    }
    return _dataSource;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc]init];
        flowLaout.itemSize                    = CGSizeMake(50, 50);
        flowLaout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView      = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KWidth, 200) collectionViewLayout:flowLaout];
        [collectionView registerClass:[AIPackingCollectionViewCell class] forCellWithReuseIdentifier:identifier];
        self.collectionView                   = collectionView;
        [self addSubview:collectionView];
    }
    return self;
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AIPackingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imageString                  = self.dataSource[indexPath.item];
    return cell;
}


@end
