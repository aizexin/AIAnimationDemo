//
//  AIListModel.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIListModel.h"
#import "UIFont+Fonts.h"
#import "StringAttribute.h"
#import "FontAttribute.h"
#import "NSMutableAttributedString+StringAttribute.h"
#import "ForegroundColorAttribute.h"

@interface AIListModel ()
@property (nonatomic, strong) NSMutableAttributedString *titleString;
@end
@implementation AIListModel


-(instancetype)initWithTitle:(NSString *)title andTargetVC:(Class )targetVC{
    self = [super init];
    if (self) {
        _title = title;
        _targetVC = targetVC;
    }
    return self;
}
+(instancetype)initWithTitle:(NSString *)title andTargetVC:(Class )targetVC{
    AIListModel *model = [[AIListModel alloc]initWithTitle:title andTargetVC:targetVC];
    return model;
}

- (void)createAttributedString {
    
    NSString *fullStirng = [NSString stringWithFormat:@"%02ld. %@", (long)self.index, self.title];
    
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:fullStirng];
    
    {
        FontAttribute *fontAttribute = [FontAttribute new];
        fontAttribute.font           = [UIFont HeitiSCWithFontSize:16.f];
        fontAttribute.effectRange    = NSMakeRange(0, richString.length);
        [richString addStringAttribute:fontAttribute];
    }
    
    {
        FontAttribute *fontAttribute = [FontAttribute new];
        fontAttribute.font           = [UIFont fontWithName:@"GillSans-Italic" size:16.f];
        fontAttribute.effectRange    = NSMakeRange(0, 3);
        [richString addStringAttribute:fontAttribute];
    }
    
    {
        ForegroundColorAttribute *foregroundColorAttribute = [ForegroundColorAttribute new];
        foregroundColorAttribute.color                     = [[UIColor blackColor] colorWithAlphaComponent:0.65f];
        foregroundColorAttribute.effectRange               = NSMakeRange(0, richString.length);
        [richString addStringAttribute:foregroundColorAttribute];
    }
    
    {
        ForegroundColorAttribute *foregroundColorAttribute = [ForegroundColorAttribute new];
        foregroundColorAttribute.color                     = [[UIColor redColor] colorWithAlphaComponent:0.65f];
        foregroundColorAttribute.effectRange               = NSMakeRange(0, 3);
        [richString addStringAttribute:foregroundColorAttribute];
    }
    
    self.titleString = richString;
}
@end
