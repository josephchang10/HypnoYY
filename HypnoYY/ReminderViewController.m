//
//  ReminderViewController.m
//  HypnoYY
//
//  Created by 张嘉夫 on 16/11/28.
//  Copyright © 2016年 张嘉夫. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation ReminderViewController

-(IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"催眠我！";
    note.fireDate = date;
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        //设置标签项的标题
        self.tabBarItem.title = @"提醒";
        // 从图像文件创建一个UIImage对象
        // 在Retina显示屏上会加载Hypno@2x.png，而不是Hypno.png
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        // 将UIImage对象赋给标签项的image属性
        self.tabBarItem.image = i;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ReminderViewController loaded its view.");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
