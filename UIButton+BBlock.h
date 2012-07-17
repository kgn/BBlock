//
//  UIButton+BBlock.h
//  BBlock
//
//  Created by David Keegan on 7/16/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton(BBlock)

// WARNING: this category is under developement and is not yet suitable for production

typedef void (^BBlockUIButtonBlock)(UIButton *button, UIEvent *event);
- (void)addActionForControlEvents:(UIControlEvents)events withBlock:(BBlockUIButtonBlock)block;

@end
