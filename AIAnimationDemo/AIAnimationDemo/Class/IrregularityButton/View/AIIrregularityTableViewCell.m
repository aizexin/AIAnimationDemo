//
//  AIIrregularityTableViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/12/19.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIIrregularityTableViewCell.h"

@interface AIIrregularityTableViewCell ()
@property(nonatomic,strong)CALayer *imageLayer;
/** 遮罩*/
@property(nonatomic,strong)CAShapeLayer *maskLayer;

@end

const CGFloat ImageHeight = 400;
const CGFloat CellHeight  = 200;
@implementation AIIrregularityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.imageLayer          = [CALayer layer];
        //遮罩
        self.maskLayer           = [CAShapeLayer layer];
        self.backgroundColor     = [UIColor clearColor];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageLayer.frame  = self.bounds;
//    self.imageLayer.frame  = CGRectMake(0, -_indexPath.row * 100, KWidth, ImageHeight);
    
}

- (UIBezierPath *)getRightPath {
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(0, 0)];
    [bezierPath addLineToPoint: CGPointMake(KWidth, CellHeight*0.5)];
    [bezierPath addLineToPoint: CGPointMake(0., CellHeight)];
    [bezierPath addLineToPoint: CGPointMake(0., 0.)];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    return bezierPath;
}
- (UIBezierPath *)getLeftPath {
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(KWidth, 0)];
    [bezierPath addLineToPoint: CGPointMake(KWidth, CellHeight)];
    [bezierPath addLineToPoint: CGPointMake(0., CellHeight*.5)];
    [bezierPath addLineToPoint: CGPointMake(KWidth, 0)];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    return bezierPath;
}

-(void)didMoveToWindow {
    [super didMoveToWindow];
    [self.contentView.layer addSublayer:self.imageLayer];
}
//判断点是否在响应范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden == NO) {
        UIBezierPath *path  = (_indexPath.row % 2 == 0)?[self getLeftPath]:[self getRightPath];
        if ( [path containsPoint:point] ) {
            return YES;
        }
        return NO;
    }else {
        return [super pointInside:point withEvent:event];
    }
}

#pragma mark -public

+ (instancetype)createTableViewCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"AIIrregularityTableViewCell";
    AIIrregularityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AIIrregularityTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}

-(void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath  = indexPath;
    if (indexPath.row %2 == 0) {
        self.maskLayer.path  = [self getLeftPath].CGPath;
    } else {
        self.maskLayer.path  = [self getRightPath].CGPath;
    }
    self.imageLayer.mask     = self.maskLayer;
}

-(void)setImageName:(NSString *)imageName {
    _imageName                  = imageName;
    self.imageLayer.contents    = (__bridge id _Nullable)([UIImage imageNamed:imageName].CGImage) ;
}


@end
