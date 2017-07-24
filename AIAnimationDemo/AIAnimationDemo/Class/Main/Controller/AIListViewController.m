//
//  AIMainViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 16/9/26.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIListViewController.h"
#import "AIListModel.h"
#import "AIListTableViewCell.h"
#import "AIPop1ViewController.h"
#import "AIPopSpringAnimationViewController.h"
#import "AIMarqueeViewController.h"
#import "GCD.h"
#import "UIView+AnimationProperty.h"
#import "AppleSystemService.h"
#import "AIBaseViewController.h"          //父类
#import "AISpringScaleViewController.h"   //pop缩放动画
#import "AIBaiduLoadHUDViewController.h"  //防百度加载提示
#import "AIShimmerViewController.h"       //facebook辉光动画
#import "AICAGradientLayerViewController.h" //Gradinent
#import "AIScrollImageViewController.h"   //scrollViews视差效果
#import "AIWellComeLoadViewController.h"  //wellCome加载动画
#import "AIButtonsViewController.h"       //多个按钮按照微博九宫格排布
#import "AIPictureViewerViewController.h"          //模仿qq图片浏览
#import "AIResearchLineChartViewController.h"    //researchKit的lineChart
#import "AIPresentCustomTransition.h"            //自定义模态转场动画
#import "AIBezierPathViewController.h"     //心电图
#import "AITableViewTapAnimationController.h" //Cell点击动画
#import "AISettingViewController.h"         //设置页面
#import "AILoginAnimationViewController.h"  //登录页面
#import "AITmallLoadingViewController.h"     //天猫loading
#import "AIMultiplayerViewController.h"      //多人游戏
#import "AIIrregularityViewController.h"    //不规则图形
#import "AIAutoTextViewViewController.h"    //自适应高度textView
#import "AIBlurImageViewController.h"       //模糊效果
#import "AIPlayMusicViewController.h"       //音乐播放按钮
#import "AIFlightInfoViewController.h"      //航班信息
#import "AIPackingListViewController.h"     //包裹
#import "AISlideToRevealViewController.h"   //gradientLayer动画
#import "AIDiscreteViewController.h"        //离散图
#import "AIBeginnerCookViewController.h"    //BeginnerCook
#import "AILocationClockViewController.h"   //本地闹钟
#import "AILogoRevealViewController.h"      //Twitter开场动画
#import "AIDoodleViewController.h"          //画板
#import "AIDownloadButtonViewController.h"  //下载按钮
#import "AIContainerViewController.h"       //officebuddy
#import "AIFoldViewController.h"            //折叠
#import "AIImageGalleryViewController.h"    //类似Safari效果
@interface AIListViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 主要的tableView*/
@property(nonatomic,strong)UITableView *tableView;
/** 数据源*/
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,assign,getter=isTableViewLoadData)BOOL tableViewLoadData;
@end

@implementation AIListViewController

#pragma mark ----lazy
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        NSArray *array = @[[AIListModel initWithTitle:@"衰减动画" andTargetVC:[AIPop1ViewController class]],
                           [AIListModel initWithTitle:@"弹簧动画" andTargetVC:[AIPopSpringAnimationViewController class]],
                           [AIListModel initWithTitle:@"跑马灯效果" andTargetVC:[AIMarqueeViewController class]],
                           [AIListModel initWithTitle:@"Pop缩放动画" andTargetVC:[AISpringScaleViewController class]],
                           [AIListModel initWithTitle:@"防百度加载提示" andTargetVC:[AIBaiduLoadHUDViewController class]],
                           [AIListModel initWithTitle:@"facebook辉光动画" andTargetVC:[AIShimmerViewController class]],
                           [AIListModel initWithTitle:@"Gradinent转场动画" andTargetVC:[AICAGradientLayerViewController class]],
                           [AIListModel initWithTitle:@"scrollViews视差效果" andTargetVC:[AIScrollImageViewController class]],
                           [AIListModel initWithTitle:@"wellCome加载动画" andTargetVC:[AIWellComeLoadViewController class]],
                           [AIListModel initWithTitle:@"多个按钮按照微博九宫格排布" andTargetVC:[AIButtonsViewController class]],
                           [AIListModel initWithTitle:@"模仿qq图片浏览" andTargetVC:[AIPictureViewerViewController class]],
                           [AIListModel initWithTitle:@"researchKit的lineChart" andTargetVC:[AIResearchLineChartViewController class]],
                           [AIListModel initWithTitle:@"自定义模态转场动画" andTargetVC:[AIPresentCustomTransition class]],
                           [AIListModel initWithTitle:@"心电图" andTargetVC:[AIBezierPathViewController class]],
                           [AIListModel initWithTitle:@"Cell点击动画" andTargetVC:[AITableViewTapAnimationController class]],
                           [AIListModel initWithTitle:@"设置页面" andTargetVC:[AISettingViewController class]],
                           [AIListModel initWithTitle:@"登录页面" andTargetVC:[AILoginAnimationViewController class]],
                           [AIListModel initWithTitle:@"天猫Loading" andTargetVC:[AITmallLoadingViewController class]],
                           [AIListModel initWithTitle:@"多人游戏" andTargetVC:[AIMultiplayerViewController class]],
                           [AIListModel initWithTitle:@"不规则按钮" andTargetVC:[AIIrregularityViewController class]],
                           [AIListModel initWithTitle:@"自适应高度textView" andTargetVC:[AIAutoTextViewViewController class]],
                           [AIListModel initWithTitle:@"模糊效果" andTargetVC:[AIBlurImageViewController class]],
                           [AIListModel initWithTitle:@"音乐播放按钮" andTargetVC:[AIPlayMusicViewController class]],
                           [AIListModel initWithTitle:@"航班信息" andTargetVC:[AIFlightInfoViewController class]],
                           [AIListModel initWithTitle:@"包裹" andTargetVC:[AIPackingListViewController class]],
                           [AIListModel initWithTitle:@"gradientLayer动画" andTargetVC:[AISlideToRevealViewController class]],
                           [AIListModel initWithTitle:@"离散图" andTargetVC:[AIDiscreteViewController class]],
                           [AIListModel initWithTitle:@"BeginnerCook" andTargetVC:[AIBeginnerCookViewController class]],
                           [AIListModel initWithTitle:@"本地闹钟" andTargetVC:[AILocationClockViewController class]],
                           [AIListModel initWithTitle:@"Twitter开场动画" andTargetVC:[AILogoRevealViewController class]],
                           [AIListModel initWithTitle:@"画板" andTargetVC:[AIDoodleViewController class]],
                           [AIListModel initWithTitle:@"下载按钮" andTargetVC:[AIDownloadButtonViewController class]],
                           [AIListModel initWithTitle:@"officebuddy" andTargetVC:[AIContainerViewController class]],
                           [AIListModel initWithTitle:@"折叠" andTargetVC:[AIFoldViewController class]],
                           [AIListModel initWithTitle:@"类似Safari效果" andTargetVC:[AIImageGalleryViewController class]]
                           ];
        
        _dataSource = [NSMutableArray arrayWithCapacity:array.count];
        for (int i = 0; i < array.count; i++) {
            AIListModel *model = array[i];
            model.index        = i+1;
            [model createAttributedString];
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}

#pragma mark ----life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title                 = @"😎";
    
    self.navigationController.navigationBar.barTintColor   = [UIColor flatRedColor];
//    self.navigationController.t
    // LaunchImage
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    iconImageView.image        = [AppleSystemService launchImage];
    [self.view addSubview:iconImageView];
    
    // Do animation
    [UIView animateKeyframesWithDuration:1.f delay:1.f options:0 animations:^{
        
        iconImageView.scale = 1.2f;
        iconImageView.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [iconImageView removeFromSuperview];
        [self setUI];
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark ----UI
/**设置ui*/
-(void)setUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, AINavgationBarH,MainSize.width , MainSize.height-AINavgationBarH)
                                                 style:(UITableViewStylePlain)];
    //去掉自带分割线
    [_tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [GCDQueue executeInMainQueue:^{
        // Load data.
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (int i = 0; i < self.dataSource.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:0]];
        }
        self.tableViewLoadData = YES;
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    } afterDelaySecs:0.25f];
}

#pragma mark -UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 立即取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    AIListModel *model             = self.dataSource[indexPath.row];
    AIBaseViewController *targetVC = [[model.targetVC alloc]init];
    targetVC.title                 = model.title;
    [self.navigationController pushViewController:targetVC  animated:YES];
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.isTableViewLoadData ? self.dataSource.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AIListTableViewCell *cell = [AIListTableViewCell createTableViewCellWithTableView:tableView];
    cell.indexPath            = indexPath;
    cell.model                = self.dataSource[indexPath.row];
    return cell;
}

@end
