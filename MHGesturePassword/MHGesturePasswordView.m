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

@end
@implementation MHGesturePasswordView

-(NSMutableArray*)pointArray{
    if (!_pointArray) {
        _pointArray = [NSMutableArray new];
        for (int i =0 ; i <9 ; i++) {
            
        }
    }
    
    
    return _pointArray;
}


-(instancetype)initWithFrame:(CGRect)frame block:(returnBlcok)block{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
   
     }
    
    return self;
}

@end
