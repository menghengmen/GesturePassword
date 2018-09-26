//
//  MHGesturePasswordView.h
//  MHGesturePassword
//
//  Created by 哈哈 on 2018/9/25.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
#define kNormalColor [UIColor grayColor]  //默认颜色
#define kSelectColor [UIColor blueColor]  //选中颜色
#define kErrorColor  [UIColor redColor]   //错误颜色

typedef void(^returnBlcok)(NSMutableArray *returnArray);

@interface MHGesturePasswordView : UIView

-(instancetype)initWithFrame:(CGRect)frame block:(returnBlcok)block;

@end

NS_ASSUME_NONNULL_END
