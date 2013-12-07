//
//  UIControl+BBlock.h
//  BBlock
//
//  Created by David Keegan on 7/16/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl(BBlock)

// WARNING: this category is under developement and is not yet suitable for production

typedef void (^BBlockUIControlBlock)(id control, UIEvent *event);
- (void)addActionForControlEvents:(UIControlEvents)events withBlock:(BBlockUIControlBlock)block;

@end
