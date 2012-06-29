//
//  UIGestureRecognizer+BBlock.h
//  BBlock
//
//  Created by David Keegan on 12/29/11.
//  Copyright (c) 2011-12 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer(BBlock)

typedef void (^UIGestureRecognizerBBlock)(UIGestureRecognizer *gesture);
- (id)initWithBlock:(UIGestureRecognizerBBlock)block;
+ (id)gestureWithBlock:(UIGestureRecognizerBBlock)block;

@end

@interface UISwipeGestureRecognizer(BBlock)

- (id)initWithDirection:(UISwipeGestureRecognizerDirection)direction 
               andBlock:(UIGestureRecognizerBBlock)block;
+ (id)gestureWithDirection:(UISwipeGestureRecognizerDirection)direction 
                  andBlock:(UIGestureRecognizerBBlock)block;

@end
