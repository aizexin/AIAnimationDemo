//
//  AITapTableViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITapTableViewCell.h"

typedef enum : NSUInteger {
    
    AITapAnimationCellState_Normal,
    AITapAnimationCellState_Selected,
    
} AITapAnimationCellState;
@interface AITapTableViewCell ()

@property(nonatomic,strong)UILabel *titleLabel;
/** view*/
@property(nonatomic,strong)UIView *view;
/** 下划线*/
@property(nonatomic,strong)UIView *lineView;
/** 图标*/
@property(nonatomic,strong)UIImageView *iconImageView;
@end

@implementation AITapTableViewCell

//清空系统的高亮方法
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self                      = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //title
    self.titleLabel           = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLabel];
    
    //view
    self.view                    = [[UIView alloc]init];
    self.view .layer.borderWidth = 1.f;
    self.view .layer.borderColor = [UIColor grayColor].CGColor;
    [self.contentView addSubview:self.view];
    
    //icon
    self.iconImageView               = [[UIImageView alloc]init];
    self.iconImageView.image         = [UIImage imageNamed:@"plane1"];
    self.iconImageView.alpha         = 0.f;
    [self.contentView addSubview:self.iconImageView];
    
    //下划线
    self.lineView                    = [[UIView alloc]init];
    self.lineView.backgroundColor    = [UIColor redColor];
    self.lineView.alpha              = 1.f;
    [self.contentView addSubview:self.lineView];
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

    CGFloat viewY  = 8;
    CGFloat viewW  = 35;
    CGFloat viewH  = 35;
    CGFloat viewX  = MainSize.width - 30 - viewW;
    self.view.frame              = CGRectMake(viewX, viewY, viewW, viewH);
    
    self.iconImageView.frame     = CGRectMake(viewX, viewY, viewW+5, viewH+5);
    self.iconImageView.center    = _view.center;
    
    //由于lineView和title都是在设置状态的时候设置frame所以这里不设置
}

/**
 状态改变方法

 @param state    状态
 @param animated 是否有动画
 */
- (void)changeToState:(AITapAnimationCellState)state animated:(BOOL)animated {
    
    if (state == AITapAnimationCellState_Normal) {
        
        [UIView animateWithDuration:animated ? 0.5 : 0 delay:0 usingSpringWithDamping:7 initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                             animated ? [_iconImageView setTransform:CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0)] : 0;
                             _iconImageView.alpha     = 0.f;
                             _lineView.alpha          = 0.f;
                             _titleLabel.frame        = CGRectMake(30, 10, 300, 30);
                             _lineView.frame          = CGRectMake(30, CGRectGetMaxY(_titleLabel.frame) + 2, 0, 2);
                             
                             _view.layer.borderColor  = [UIColor grayColor].CGColor;
                             _view.transform          = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
                             _view.layer.cornerRadius = 0;
                             
                         } completion:nil];
        
    } else if (state == AITapAnimationCellState_Selected) {
        
        animated ? [_iconImageView setTransform:CGAffineTransformMake(2, 0, 0, 2, 0, 0)] : 0;
        
        [UIView animateWithDuration:animated ? 0.5 : 0 delay:0 usingSpringWithDamping:7 initialSpringVelocity:4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                             _iconImageView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
                             _iconImageView.alpha     = 1.f;
                             _lineView.alpha          = 1.f;
                             _titleLabel.frame        = CGRectMake(30 + 50, 10, 300, 30);
                             _lineView.frame          = CGRectMake(30, CGRectGetMaxY(_titleLabel.frame) + 2, 200, 2);
                             
                             _view.layer.borderColor  = [UIColor redColor].CGColor;
                             _view.transform          = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
                             _view.layer.cornerRadius = 4.f;
                             
                         } completion:nil];
    }
}
/**
 背景动画
 */
- (void)showSelectedAnimation {
    
    UIView *tmpView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainSize.width, self.frame.size.height)];
    tmpView.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.20];
    tmpView.alpha           = 0.f;
    [self addSubview:tmpView];
    
    [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        tmpView.alpha = 0.8f;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.20 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            tmpView.alpha = 0.f;
            
        } completion:^(BOOL finished) {
            
            [tmpView removeFromSuperview];
        }];
    }];
}

#pragma mark --public func

-(void)setTapModel:(AITapModel *)tapModel{
    _tapModel                = tapModel;
    self.titleLabel.text     = tapModel.title;
    if (tapModel.isSelected) {
        [self changeToState:AITapAnimationCellState_Selected animated:YES];
    }else{
        [self changeToState:AITapAnimationCellState_Normal animated:YES];
    }
}

-(void)selecrEvent{
    [self showSelectedAnimation];
    if (self.tapModel.isSelected) {
        [self changeToState:AITapAnimationCellState_Normal animated:YES];
    }else{
        [self changeToState:AITapAnimationCellState_Selected animated:YES];
    }
}

+(instancetype)createCellWithTabelView:(UITableView*)tableView{
    NSString *identifier     = @"TapCell";
    AITapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell                 = [[AITapTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}


@end
