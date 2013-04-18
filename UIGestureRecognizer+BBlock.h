//
//  UIGestureRecognizer+BBlock.h
//  BBlock
//
//  Created by David Keegan on 12/29/11.
//  Copyright (c) 2011-12 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer(BBlock)

typedef void (^UIGestureRecognizerBBlock)(id gestureRecognizer);
- (instancetype)initWithBlock:(UIGestureRecognizerBBlock)block;
+ (instancetype)gestureRecognizerWithBlock:(UIGestureRecognizerBBlock)block;

@end

@interface UISwipeGestureRecognizer(BBlock)

- (instancetype)initWithDirection:(UISwipeGestureRecognizerDirection)direction
                         andBlock:(UIGestureRecognizerBBlock)block;
+ (instancetype)gestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction
                                      andBlock:(UIGestureRecognizerBBlock)block;

@end
