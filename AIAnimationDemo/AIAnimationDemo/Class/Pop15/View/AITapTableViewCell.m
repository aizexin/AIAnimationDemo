//
//  AITapTableViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITapTableViewCell.h"

typedef enum : NSUInteger {
    
    kNormalState,
    kSelectedState,
    
} ETableViewTapAnimationCellState;
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
    self.iconImageView.image         = [UIImage imageNamed:@"plane"];
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
//    CGFloat titleX = 30;
//    CGFloat titleY = 8;
//    CGFloat titleW = 100;
//    CGFloat titleH = self.frame.size.height - 2 - titleY;
//    self.titleLabel.frame        = CGRectMake(titleX, titleY, titleW, titleH);
//    
    CGFloat viewY  = 8;
    CGFloat viewW  = 35;
    CGFloat viewH  = 35;
    CGFloat viewX  = MainSize.width - 30 - viewW;
    self.view.frame              = CGRectMake(viewX, viewY, viewW, viewH);
    
    self.iconImageView.frame     = CGRectMake(viewX, viewY, viewW+5, viewH+5);
    self.iconImageView.center    = _view.center;
//
//    self.lineView.frame          = CGRectMake(titleX, self.frame.size.height - 2, 0, 2);
    
}

- (void)changeToState:(ETableViewTapAnimationCellState)state animated:(BOOL)animated {
    
    if (state == kNormalState) {
        
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
        
    } else if (state == kSelectedState) {
        
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

#pragma mark --public func
-(void)setTapModel:(AITapModel *)tapModel{
    _tapModel                = tapModel;
    self.titleLabel.text     = tapModel.title;
//    self.iconImageView.alpha = tapModel.isSelected ? 1 : 0;
    if (tapModel.isSelected) {
        [self changeToState:kSelectedState animated:YES];
    }else{
        [self changeToState:kNormalState animated:YES];
    }
}

-(void)selecrEvent{
    if (self.tapModel.isSelected) {
        [self changeToState:kNormalState animated:YES];
    }else{
        [self changeToState:kSelectedState animated:YES];
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
