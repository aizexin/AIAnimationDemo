//
//  AITapTableViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITapTableViewCell.h"


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
    [super setSelected:selected animated:animated];

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
    [self.contentView addSubview:self.lineView];
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat titleX = 30;
    CGFloat titleY = 8;
    CGFloat titleW = 100;
    CGFloat titleH = 50;
    self.titleLabel.frame        = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat viewX  = MainSize.width - 10;
    CGFloat viewY  = titleY;
    CGFloat viewW  = 35;
    CGFloat viewH  = 35;
    self.view.frame              = CGRectMake(viewX, viewY, viewW, viewH);
    
    self.iconImageView.frame     = CGRectMake(viewX, viewY, viewW+5, viewH+5);
    
    self.lineView.frame          = CGRectMake(titleX, self.frame.size.height - 1, titleW, 1);
    
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
