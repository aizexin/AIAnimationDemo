//
//  AIListTableViewCell.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIListTableViewCell.h"
#import "UIFont+Fonts.h"
@interface AIListTableViewCell ()
@property (nonatomic, strong) UILabel  *titlelabel;
@property (nonatomic, strong) UILabel  *subTitleLabel;

@end

@implementation AIListTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self                 = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.titlelabel      = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 290, 25)];
    [self.contentView addSubview:self.titlelabel];
    
    self.subTitleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 290, 10)];
    self.subTitleLabel.font      = [UIFont AvenirLightWithFontSize:8.f];
    self.subTitleLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.subTitleLabel];
    return self;
}
-(void)setModel:(AIListModel *)model{
    _model = model;
    self.titlelabel.attributedText = model.titleString;
    self.subTitleLabel.text = [NSString stringWithFormat:@"%@",[model.targetVC class]];
    if (self.indexPath.row % 2) {
        
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];
        
    } else {
        
        self.backgroundColor = [UIColor whiteColor];
    }
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

+(instancetype)createTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"ListCell";
    AIListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AIListTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}



@end
