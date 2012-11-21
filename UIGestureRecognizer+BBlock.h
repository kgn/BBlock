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
- (id)initWithBlock:(UIGestureRecognizerBBlock)block;
+ (id)gestureRecognizerWithBlock:(UIGestureRecognizerBBlock)block;

@end

@interface UISwipeGestureRecognizer(BBlock)

- (id)initWithDirection:(UISwipeGestureRecognizerDirection)direction 
               andBlock:(UIGestureRecognizerBBlock)block;
+ (id)gestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction
                            andBlock:(UIGestureRecognizerBBlock)block;

@end
