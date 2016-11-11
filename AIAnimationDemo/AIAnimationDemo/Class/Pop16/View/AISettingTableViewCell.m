//
//  AISettingTableViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/10.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AISettingTableViewCell.h"
#import "UIColor+AIExtension.h"
#import "UIView+SetRect.h"
@interface AISettingTableViewCell ()
/** 图标 */
@property (weak,nonatomic)UIImageView *iconImageView;
/** 标签label */
@property (weak,nonatomic)UILabel *tipsLabel;
/** 分割线 */
@property (weak,nonatomic)UIView *lineView;

/**
 要执行的block
 */
@property (nonatomic,copy)optionBlock optionBlock;

/** 目标控制器*/
@property(nonatomic,strong)Class destVC;
/** 辅助视图*/
//@property(nonatomic,strong)UIView *ai_accessibilityView;

@end

@implementation AISettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
    
}

#pragma mark --lazy
//-(UIView *)ai_accessibilityView{
//    if (!_ai_accessibilityView) {
//        _ai_accessibilityView = [[UIView alloc]init];
//    }
//    return _ai_accessibilityView;
//}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self                   = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //图片
    UIImageView *imageView = [[UIImageView alloc]init];
    self.iconImageView     = imageView;
    [self.contentView addSubview:imageView];
    //label
    UILabel *label         = [[UILabel alloc]init];
    label.textColor        = [UIColor colorWithHexString:@"#353535"];
    label.font             = [UIFont systemFontOfSize:14];
    self.tipsLabel         = label;
    [self.contentView addSubview:label];
    //分割线
    UIView *lineView         = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor blackColor];//[UIColor colorWithHexString:@"#f2f2f2"];
    self.lineView            = lineView;
    [self.contentView addSubview:lineView];
    //辅助视图
//    [self.contentView addSubview:self.ai_accessibilityView];
    
    [self fitUI];
    return self;
}
-(void)fitUI{
    //图标
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(20));
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(@(30));
        make.height.mas_equalTo(self.iconImageView.mas_width);
    }];
    //label
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset = 6;
        make.right.mas_equalTo(-2);
    }];
    //lineView
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset  = 8;
        make.right.mas_equalTo(@-8);
        make.height.mas_equalTo(@1);
        make.bottom.mas_equalTo(@0);
    }];

}

#pragma mark --public func

-(void)setData:(id<AISettingCellAdapterProtocol>)data{
    _data = data;
    self.iconImageView.image        = [UIImage imageNamed:[data iconNameString]];
    self.tipsLabel.text             = [data titleString];
    self.accessoryView              = [data accessibilityView]?[data accessibilityView]:nil;
}


+(instancetype)createTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *identifier  = @"systemSetCell";
    AISettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell                     = \
        [[AISettingTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}



@end
