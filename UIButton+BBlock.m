//
//  UIButton+BBlock.m
//  BBlock
//
//  Created by David Keegan on 7/16/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIButton+BBlock.h"
#import <objc/runtime.h>

static char BBlockUIButtonBlockKey;

@implementation UIButton(BBlock)

// TODO: this is a very poor implementation as it does not 'add'

- (void)addActionForControlEvents:(UIControlEvents)events withBlock:(BBlockUIButtonBlock)block{  
    objc_setAssociatedObject(self, &BBlockUIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);    
    [self addTarget:self action:@selector(blockAction:forEvent:) forControlEvents:events];
}

- (void)blockAction:(UIButton *)button forEvent:(UIEvent *)event{
	BBlockUIButtonBlock block = objc_getAssociatedObject(self, &BBlockUIButtonBlockKey);
    if(block)block(button, event);
}

@end
