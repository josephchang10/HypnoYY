//
//  QuizViewController.m
//  Quiz
//
//  Created by 张嘉夫 on 16/11/25.
//  Copyright © 2016年 张嘉夫. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;

@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;

@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // 调用父类实现的初始化方法
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 创建两个数组对象，存储所需的问题和答案
        // 同时，将questions和answers分别指向问题数组和答案数组
        self.questions = @[@"世界上最英俊的人是谁?", @"世界上最蠢的人是谁?", @"不上班行不行?"];
        self.answers = @[@"张嘉夫", @"姚瑶", @"我养你啊"];
        //设置标签项的标题
        self.tabBarItem.title = @"课堂测验";
        // 从图像文件创建一个UIImage对象
        // 在Retina显示屏上会加载Hypno@2x.png，而不是Hypno.png
        UIImage *i = [UIImage imageNamed:@"Quiz.png"];
        // 将UIImage对象赋给标签项的image属性
        self.tabBarItem.image = i;
        self.currentQuestionIndex = -1;
    }
    //返回新对象的地址
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // 进入下一个问题
    self.currentQuestionIndex++;
    // 是否已经回答完了所有问题？
    if (self.currentQuestionIndex == [self.questions count]) {
        // 回答第一个问题
        self.currentQuestionIndex = 0;
    }
    // 根据正在回答的问题序号从数组中取出问题字符串
    NSString *question = self.questions[self.currentQuestionIndex];
    // 将问题字符串显示在标签上
    self.questionLabel.text = question;
    // 重置答案字符串
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    // 当前问题的答案是什么？
    NSString *answer = self.answers[self.currentQuestionIndex];
    // 在答案标签上显示相应的答案
    self.answerLabel.text = answer;
}



@end
