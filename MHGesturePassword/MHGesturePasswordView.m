//
//  MHGesturePasswordView.m
//  MHGesturePassword
//
//  Created by 哈哈 on 2018/9/25.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "MHGesturePasswordView.h"

@interface MHGesturePasswordView()

@property (nonatomic,strong)  NSMutableArray *pointArray;///所有点
@property (nonatomic,strong)  NSMutableArray *selectedPointArray;//连接点
@property (nonatomic,assign)  CGFloat radius ;//圆的半径
@property (nonatomic,assign)  CGFloat space;//边距
@property (nonatomic,assign)  CGPoint currentPoint; //当前选择的点
@property (nonatomic,assign)  BOOL isError;
@end
@implementation MHGesturePasswordView

-(NSMutableArray*)pointArray{
    if (!_pointArray) {
        _pointArray = [NSMutableArray new];
       
        for (int i =0 ; i <9 ; i++) {
            CGFloat x = self.radius * 2 + (self.radius * 2 + self.space) * (i % 3);
            CGFloat y = self.radius * 2 + (self.radius * 2 + self.space) * (i / 3);
            CGPoint point = CGPointMake(x, y);
            NSValue *value = [NSValue valueWithCGPoint:point];
            [_pointArray addObject:value];
        
        }
    }
    
    
    return _pointArray;
}

-(NSMutableArray*)selectedPointArray{
    if (!_selectedPointArray) {
        _selectedPointArray = [NSMutableArray new];
    }
    return _selectedPointArray;
    
}



-(instancetype)initWithFrame:(CGRect)frame block:(returnBlcok)block{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        self.radius = frame.size.width/10;
        self.space = self.radius;
     }
    
    return self;
}
///设置颜色
-(UIColor*)setColor{
    return self.isError? kErrorColor :kSelectColor;
}

-(void)drawRect:(CGRect)rect{
    for (int i = 0 ; i <self.pointArray.count; i ++) {
        /// 静态的九个圆
        UIBezierPath *bezier = [UIBezierPath  bezierPathWithArcCenter:[self.pointArray[i] CGPointValue] radius:self.radius startAngle:0 endAngle:M_PI*2 clockwise:NO];
        [bezier setLineWidth:2];
        [bezier stroke];
  
        ///画线上的小圆球
        if ([self.selectedPointArray containsObject:self.pointArray[i]]) {
             [[UIBezierPath bezierPathWithArcCenter:[self.pointArray[i]CGPointValue] radius:self.radius/5 startAngle:0 endAngle:M_PI*2 clockwise:NO] fill];
            [[self setColor] setFill];
        }
    
    }
   
    ///画线
    if (self.selectedPointArray.count==0) {
        return;
    }
    UIBezierPath *linePath = [UIBezierPath new];
    [linePath moveToPoint:[self.selectedPointArray[0] CGPointValue]];
    for (int i = 0 ; i <self.selectedPointArray.count; i ++) {
        if (i >0) {
            [linePath addLineToPoint:[self.selectedPointArray[i] CGPointValue]];

        }
    }
    [linePath addLineToPoint:self.currentPoint];

    [[self setColor] setStroke];
    [linePath setLineWidth:5];
    [linePath stroke];

   


}

#pragma mark touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    for (int i =0; i <self.pointArray.count; i++) {
        if ([self compareLocationWithPoint:[self.pointArray[i]CGPointValue] moveToPoint:point]) {
            [self.selectedPointArray addObject:self.pointArray[i]];
            self.currentPoint = [self.pointArray[i] CGPointValue];

        }
    }
    [self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    self.currentPoint = point;
    for (int i =0; i <self.pointArray.count; i++) {
        if ([self compareLocationWithPoint:[self.pointArray[i]CGPointValue] moveToPoint:point] && ![self.selectedPointArray containsObject:self.pointArray[i]]) {
            [self.selectedPointArray addObject:self.pointArray[i]];
        }
    }
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (int i = 0 ; i <self.selectedPointArray.count; i ++) {
        if (![self compareLocationWithPoint:[self.selectedPointArray[i] CGPointValue] moveToPoint:self.currentPoint]) {
            self.currentPoint = [[self.selectedPointArray lastObject] CGPointValue];
        }
    }
    //清除痕迹
    [self performSelector:@selector(resetView) withObject:nil afterDelay:2];

    [self setNeedsDisplay];
}

#pragma mark 比较触摸点是否在y圆内

-(BOOL)compareLocationWithPoint:(CGPoint)circlePoint moveToPoint:(CGPoint)movePoint{
    CGFloat chaX = fabs(circlePoint.x - movePoint.x);
    CGFloat chaY = fabs(circlePoint.y -movePoint.y);
    if (chaX <= self.radius && chaY<=self.radius) {
        return YES; //在圆内
    }
    return NO;
}

#pragma mark 清除痕迹
-(void)resetView{
    [self.selectedPointArray removeAllObjects];
    self.isError = NO;
    self.currentPoint = CGPointMake(0, 0);
    [self setNeedsDisplay];
    
}

@end
