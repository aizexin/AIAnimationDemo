//
//  AILocationClockViewController.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2017/3/15.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

#import "AILocationClockViewController.h"
#import <EventKit/EventKit.h>

@interface AILocationClockViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AILocationClockViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"AILocationClockViewController" owner:nil options:nil].firstObject;
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];

    
   
}
- (IBAction)onClickCalendar:(id)sender {
    
    [self addEventNotify:[NSDate dateWithTimeIntervalSinceNow:60] title:self.textField.text];
}
- (IBAction)onClickReminder:(id)sender {
    [self addReminderNotify:[NSDate dateWithTimeIntervalSinceNow:60] title:self.textField.text];
}

-(void)addEventNotify:(NSDate *)date title:(NSString *)title

{
    //生成事件数据库对象
    
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    //申请事件类型权限
    
    [eventDB requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) { //授权是否成功
            
            EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB]; //创建一个日历事件
            
            myEvent.title     = title;  //标题
            
            myEvent.startDate = date; //开始date   required
            
            myEvent.endDate   = date;  //结束date    required
            
            [myEvent addAlarm:[EKAlarm alarmWithAbsoluteDate:date]]; //添加一个闹钟  optional
            
            [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]]; //添加calendar  required
            
            NSError *err;
            
            [eventDB saveEvent:myEvent span:EKSpanThisEvent error:&err]; //保存
            
        }
        
    }];
    
}

-(void)addReminderNotify:(NSDate *)date title:(NSString *)title

{
    
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    //申请提醒权限
    
    [eventDB requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) {
            //创建一个提醒功能
            
            EKReminder *reminder = [EKReminder reminderWithEventStore:eventDB];
            //标题
            
            reminder.title = title;
            //添加日历
            
            [reminder setCalendar:[eventDB defaultCalendarForNewReminders]];
            
            NSCalendar *cal = [NSCalendar currentCalendar];
            
            [cal setTimeZone:[NSTimeZone systemTimeZone]];
            
            NSInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth |
            
            NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute |
            
            NSCalendarUnitSecond;
            
            NSDateComponents* dateComp = [cal components:flags fromDate:date];
            
            dateComp.timeZone = [NSTimeZone systemTimeZone];
            
            reminder.startDateComponents = dateComp; //开始时间
            
            reminder.dueDateComponents = dateComp; //到期时间
            
            reminder.priority = 1; //优先级
            
            EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date]; //添加一个车闹钟
            
            [reminder addAlarm:alarm];
            
            NSError *err;
            
            [eventDB saveReminder:reminder commit:YES error:&err];
            
            if (err) {
                
                
            }
            
        }
        
    }];
    
}



@end
