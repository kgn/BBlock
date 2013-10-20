//
//  UIControl+BBlock.m
//  BBlock
//
//  Created by David Keegan on 7/16/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIControl+BBlock.h"
#import <objc/runtime.h>

static char BBlockUIControlBlockKey;

@implementation UIControl(BBlock)

// TODO: this is a very poor implementation as it does not 'add'

- (void)addActionForControlEvents:(UIControlEvents)events withBlock:(BBlockUIControlBlock)block{  
    objc_setAssociatedObject(self, &BBlockUIControlBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);    
    [self addTarget:self action:@selector(blockAction:forEvent:) forControlEvents:events];
}

- (void)blockAction:(id)control forEvent:(UIEvent *)event{
	BBlockUIControlBlock block = objc_getAssociatedObject(self, &BBlockUIControlBlockKey);
    if(block){
        block(control, event);
    }
}

@end
