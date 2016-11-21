//
//  AIDestTwoViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2016/11/21.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIDestTwoViewController.h"
#import "AISettingModelAdapter.h"
#import "AISettingModel.h"
#import "PPNumberButton.h"
@interface AIDestTwoViewController ()

@end

@implementation AIDestTwoViewController


#pragma mark --Over
-(NSMutableArray<NSMutableArray *> *)getDataSource{
    NSMutableArray  *dataSource            = [NSMutableArray array];
    
    //第一组
    NSMutableArray *group1 = [NSMutableArray array];
    UIImageView *imageiew  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrowRightLandscape"]];
    imageiew.frame         = CGRectMake(0, 0, 10, 20);
    AISettingModel *model1 = [[AISettingModel alloc]initWithIcon:@"banben" title:@"版本" destClass:nil andAccessibilityView:imageiew];
    
    AISettingCellAdapter *adapter1 = [[AISettingModelAdapter alloc]initWithData:model1];
    [group1 addObject:adapter1];
    
    //第二组
    NSMutableArray *group2         = [NSMutableArray array];
    UISwitch *switchBtn            = [[UISwitch alloc]init];
    [switchBtn addTarget:self action:@selector(onClickSwitch) forControlEvents:(UIControlEventTouchUpInside)];
    AISettingModel *model2         = [[AISettingModel alloc]initWithIcon:@"changjing" title:@"场景" destClass:nil andAccessibilityView:switchBtn];
    AISettingCellAdapter *adapter2 = [[AISettingModelAdapter alloc]initWithData:model2];
    [group2 addObject:adapter2];
    
    AISettingModel *model3          =\
    [[AISettingModel alloc]initWithIcon:@"guanyu" title:@"关于" destClass:nil andAccessibilityView:nil];
    [model3 setBlock:^{
        AILog(@"点击关于");
    }];
    AISettingCellAdapter *adapter3  = [[AISettingModelAdapter alloc]initWithData:model3];
    [group2 addObject:adapter3];
    
    //第三组
    NSMutableArray *group3          = [NSMutableArray array];
    PPNumberButton *number          = [[PPNumberButton alloc]init];
    AISettingModel *model31         =\
    [[AISettingModel alloc]initWithIcon:@"wangguan" title:@"网关" destClass:nil andAccessibilityView:number];
    
    AISettingCellAdapter *adapter31 = [[AISettingModelAdapter alloc]initWithData:model31];
    [group3 addObject:adapter31];
    
    UITextField   *textField        = [[UITextField alloc]init];
    textField.layer.borderColor     = [UIColor blueColor].CGColor;
    textField.layer.borderWidth     = 2.;
    textField.frame                 = CGRectMake(0, 0, 200, 30);
    AISettingModel *model32         = [[AISettingModel alloc]initWithIcon:@"wangguan" title:@"填空" destClass:nil andAccessibilityView:textField];
    AISettingCellAdapter *adapter32 = [[AISettingModelAdapter alloc]initWithData:model32];
    [group3 addObject:adapter32];
    
    [dataSource addObject:group2];
    [dataSource addObject:group1];
    [dataSource addObject:group3];
    return dataSource;
}

#pragma mark -- lifecycle
-(void)viewDidLoad{
    [super viewDidLoad];
}

#pragma mark --Action
-(void)onClickSwitch{
    
}



@end
