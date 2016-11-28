//
//  HypnosisViewController.m
//  HypnoYY
//
//  Created by 张嘉夫 on 16/11/28.
//  Copyright © 2016年 张嘉夫. All rights reserved.
//

#import "HypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation HypnosisViewController

- (void)loadView {
    //创建一个BNRHypnosisView对象
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]init];
    //将BNRHypnosisView对象赋给视图控制器的view属性
    self.view = backgroundView;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        //设置标签项的标题
        self.tabBarItem.title = @"催眠";
        // 从图像文件创建一个UIImage对象
        // 在Retina显示屏上会加载Hypno@2x.png，而不是Hypno.png
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        // 将UIImage对象赋给标签项的image属性
        self.tabBarItem.image = i;
    }
    return self;
}

-(void)viewDidLoad {
    //必须调用父类的viewDidLoad
    [super viewDidLoad];
    NSLog(@"HypnosisViewController loaded its view.");
}

@end
