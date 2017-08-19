//
//  AITextView.m
//  AISchoolDiscipline
//
//  Created by 艾泽鑫 on 2016/12/20.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITextView.h"
#import "NSString+Extension.h"

@interface AITextView ()
/**
 *  占位文字View: 为什么使用UITextView，这样直接让占位文字View = 当前textView,文字就会重叠显示
 */
@property (nonatomic, weak) UITextView *placeholderView;

/**
 当前高度
 */
@property (nonatomic,assign)CGFloat currentHeight;

/**
 空百高度
 */
@property (nonatomic,assign)CGFloat spaceHeight;

/**
 是否满
 */
@property (nonatomic,assign,getter=isFill)BOOL fill;
@end

@implementation AITextView

- (UITextView *)placeholderView {
    if (_placeholderView == nil) {
        UITextView *placeholderView = [[UITextView alloc] init];
        _placeholderView = placeholderView;
        _placeholderView.scrollEnabled = NO;
        _placeholderView.showsHorizontalScrollIndicator = NO;
        _placeholderView.showsVerticalScrollIndicator = NO;
        _placeholderView.userInteractionEnabled = NO;
        _placeholderView.font = self.font;
        _placeholderView.textColor = [UIColor lightGrayColor];
        _placeholderView.backgroundColor = [UIColor clearColor];
        
    }
    return _placeholderView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
        //默认属性
        _maxHeight  = 100;
        _fill       = NO;
        self.font   = [UIFont systemFontOfSize:13];
        // 监听键盘弹出
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ai_textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    //一行的高度文字
    CGFloat lineWith = [@"x" sizeWithFont:self.font maxSize:CGSizeMake(self.frame.size.width, MAXFLOAT)].height;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentHeight   = self.bounds.size.height;
        _spaceHeight     = self.bounds.size.height - lineWith;
    });
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setup {
    [self addSubview:self.placeholderView];
    self.scrollEnabled = YES;
    self.scrollsToTop  = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.layer.borderColor              = [UIColor lightGrayColor].CGColor;
    
    
    [self.placeholderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    
}
-(void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderView.font = font;
    _currentHeight  = self.bounds.size.height;
}


#pragma mark --通知
// 键盘弹出会调用
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 获取键盘frame
    CGRect endFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 获取键盘弹出时长
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    //如果没有被键盘遮盖
    if (endFrame.origin.y < self.frame.origin.y ) {
        return;
    }
    // 修改底部视图距离底部的间距
    [self.superview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(endFrame.origin.y != screenH?endFrame.origin.y - KHeight:0);
    }];
    // 约束动画
    [UIView animateWithDuration:duration animations:^{
        [self.superview layoutIfNeeded];
    }];
}

- (void)ai_textDidChange
{
    // 占位文字是否显示
    self.placeholderView.hidden = self.text.length > 0;
    CGFloat textHeight          = ceilf([self.text sizeWithFont:self.font maxSize:CGSizeMake(self.frame.size.width, MAXFLOAT)].height);
    //完整高度
    //如果上下和父类有间距这里要增加
    CGFloat height              = self.distanceToSuperView + textHeight + _spaceHeight;
    if (_currentHeight != height ) {
        self.fill       = height >= _maxHeight && _maxHeight > 0;
        if (!self.isFill) {
            [self.superview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);;
            }];
            _currentHeight             = height;
            self.placeholderView.frame = self.bounds;
        }
    }
    
}


#pragma mark --public
-(void)setPlaceholder:(NSString *)placeholder {
    _placeholder              = placeholder;
    self.placeholderView.text = placeholder;
}
#pragma overwrite

/**
 重写赋值方法，因为在直接settext的时候不会走代理方法

 @param text text
 */
-(void)setText:(NSString *)text {
    [super setText:text];
    [self ai_textDidChange];
}

@end
