//
//  UIView+SU.h
//  Universal Projects
//
//  Created by 侯 on 2017/4/14.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SU)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

@end

IB_DESIGNABLE
@interface UIView (SUIBInspectable)

@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat borderWidth;
@property (nonatomic, strong)IBInspectable UIColor *borderColor;

@end


@interface UIView (Response)
- (void)addTapAction:(SEL)tapAction target:(id)target;
@end
