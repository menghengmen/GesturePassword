//
//  MHGesturePasswordView.h
//  MHGesturePassword
//
//  Created by 哈哈 on 2018/9/25.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
typedef void(^returnBlcok)(NSMutableArray *returnArray);

@interface MHGesturePasswordView : UIView

-(instancetype)initWithFrame:(CGRect)frame block:(returnBlcok)block;

@end

NS_ASSUME_NONNULL_END
