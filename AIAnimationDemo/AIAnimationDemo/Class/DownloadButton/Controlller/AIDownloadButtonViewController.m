//
//  AIDownloadButtonViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/5/8.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AIDownloadButtonViewController.h"
#import "AIDownloadButton.h"
#import "AFNetHelper.h"
#import "AIDownLoadTaskModel.h"
@interface AIDownloadButtonViewController ()
@property (weak, nonatomic) IBOutlet AIDownloadButton *downLoadButton;
/** 进程*/
@property(nonatomic,strong)NSURLSessionTask *task;
@end

@implementation AIDownloadButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AIWeakSelf
    [self.downLoadButton setBlock:^(AIDownloadButton *button){
        
        switch (button.state) {
            case AIDownloadButtonLoading:
                [weakSelf dowload];
                break;
            case AIDownloadButtonResume:
                [weakSelf.task resume];
                break;
            case AIDownloadButtonSuspend:
                [weakSelf.task suspend];
                break;

            default:
                break;
        }
       
    }];
    
}

- (void)dowload {
    //    AIDownLoadTaskModel *downTask           = [[AIDownLoadTaskModel alloc]init];
    //    downTask.lastDate                       = [NSDate date];
    AIWeakSelf
    self.task =  [AFNetHelper downloadWithURL:@"http://wvideo.spriteapp.cn/video/2016/0116/569a048739c11_wpc.mp4" fileDir:@"xx" progress:^(NSProgress *progress) {
        weakSelf.downLoadButton.progress    = progress.fractionCompleted;
        weakSelf.downLoadButton.text        = [self transitionUnit:progress.completedUnitCount];
        //如果要计算下载速度xxkb/s 这种可以打开注释
        //           //一秒中内的数据
        //           downTask.readData                   += (downTask.completedUnitCount - progress.completedUnitCount);
        //           downTask.completedUnitCount          = progress.completedUnitCount;
        //           //获得当前时间
        //           NSDate *nowdate                      = [NSDate date];
        //           if ([nowdate timeIntervalSinceDate:downTask.lastDate] >= 1) {
        //               //时间差
        //               double time = [nowdate timeIntervalSinceDate:downTask.lastDate];
        //               //计算速度
        //               long long speed = downTask.readData/time;
        //               downTask.speed  = speed;
        //               //维护变量，将计算过的清零
        //               downTask.readData = 0.0;
        //               //维护变量，记录这次计算的时间
        //               downTask.lastDate = nowdate;
        //               AILog(@"下载速度:%@",[self transitionUnit:speed]);
        //           }
    } success:^(NSString *filePath) {
        weakSelf.downLoadButton.progress    = 1.;
        
    } failure:^(NSError *err) {
        
    }];
}

- (IBAction)resume:(id)sender {
    [self.task cancel];
    [self.downLoadButton reset];
}

/**
 转换单位

 @param size 文件大小
 @return 返回单位
 */
- (NSString *)transitionUnit:(int64_t)size {

    return [NSByteCountFormatter stringFromByteCount:size countStyle:NSByteCountFormatterCountStyleFile];
}



@end
