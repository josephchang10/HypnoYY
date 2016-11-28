//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by 张嘉夫 on 16/11/28.
//  Copyright © 2016年 张嘉夫. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置BNRHypnosisView对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    // 根据bounds计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2,0;
    // 根据视图宽和高中的较少值计算圆形的半径
    float radius = (MIN(bounds.size.width, bounds.size.height)/2.0);
    UIBezierPath *path = [[UIBezierPath alloc]init];
    // 以中心点为圆心、radius的值为半径，定义一个0到M_PI * 2.0弧度的路径(整圆)
    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
    // 设置线条宽度为10点
    path.lineWidth = 10;
    // 设置绘制颜色为浅灰色
    [[UIColor lightGrayColor]setStroke];
    // 绘制路径！
    [path stroke];
}


@end
