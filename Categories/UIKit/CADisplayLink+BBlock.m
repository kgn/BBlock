//
//  CADisplayLink+BBlock.m
//  BBlock
//
//  Created by David Keegan on 4/23/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

#import "CADisplayLink+BBlock.h"
#import <objc/runtime.h>

static char BBlockCADisplayLinkKey;

@implementation CADisplayLink(BBlock)

+ (void)executeBlock:(CADisplayLink *)displayLink{
	BBlockCADisplayLinkBlock block = objc_getAssociatedObject(displayLink, &BBlockCADisplayLinkKey);
    if(block){
        block(displayLink);
    }
}

+ (instancetype)displayLinkWithBlock:(BBlockCADisplayLinkBlock)block{
    NSParameterAssert(block != nil);
    CADisplayLink *displayLink =
    [CADisplayLink displayLinkWithTarget:self selector:@selector(executeBlock:)];
    objc_setAssociatedObject(displayLink, &BBlockCADisplayLinkKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return displayLink;
}

@end
