//
//  HypnosisViewController.m
//  HypnoYY
//
//  Created by 张嘉夫 on 16/11/28.
//  Copyright © 2016年 张嘉夫. All rights reserved.
//

#import "HypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface HypnosisViewController()<UITextFieldDelegate>
@property (nonatomic, weak) UITextField *textField;
@end

@implementation HypnosisViewController

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    //创建一个BNRHypnosisView对象
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]initWithFrame:frame];
    CGRect textFieldRect = CGRectMake(40, -20, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    //设置UITextField对象的边框样式，便于查看它在屏幕上的位置
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"催眠我";
    textField.returnKeyType = UIReturnKeyDone;
    //这里Xcode会提示一处警告信息，下一节将介绍原因并消除该警告
    textField.delegate = self;
    [backgroundView addSubview:textField];
    self.textField = textField;
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

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.25 initialSpringVelocity:0.0 options:0 animations:^{
        CGRect frame = CGRectMake(40, 70, 240, 30);
        self.textField.frame = frame;
    } completion:NULL];
}

-(void)drawHypnoticMessage:(NSString*)message {
    for (int i = 0; i<30; i++) {
        UILabel *messageLabel = [[UILabel alloc]init];
        //设置UILabel对象的文字和颜色
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        messageLabel.font = [UIFont systemFontOfSize:25];
        //根据需要显示的文字调整UILabel对象的大小
        [messageLabel sizeToFit];
        //获取随机x坐标，
        //使UILabel对象的宽度不超出HypnosisViewController的view宽度
        int width = (int)(self.view.bounds.size.width-messageLabel.bounds.size.width);
        int x = arc4random() % width;
        //获取随机y坐标，
        //使UILabel对象的高度不超出HypnosisViewController的view的高度
        int height = (int)(self.view.bounds.size.height-messageLabel.bounds.size.height);
        int y = arc4random() % height;
        // 设UILabel对象的frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        //将UILabel对象添加到HypnosisViewController的view中
        [self.view addSubview:messageLabel];
        //设置messageLabel透明度的起始值
        messageLabel.alpha = 0.0;
        //让messageLabel的透明度由0.0变为1.0
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            messageLabel.alpha = 1.0;
        } completion:NULL];
        [UIView animateKeyframesWithDuration:1.0 delay:0.0 options:0 animations:^{
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.8 animations:^{
                messageLabel.center = self.view.center;
            }];
            [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
                int x = arc4random() % width;
                int y = arc4random() % height;
                messageLabel.center = CGPointMake(x, y);
            }];
        } completion:^(BOOL finished) {
            NSLog(@"动画结束");
        }];
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        motionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

@end
