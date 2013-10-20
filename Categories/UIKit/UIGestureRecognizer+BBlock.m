//
//  UIGestureRecognizer+BBlock.m
//  BBlock
//
//  Created by David Keegan on 12/29/11.
//  Copyright (c) 2011-12 David Keegan. All rights reserved.
//

#import "UIGestureRecognizer+BBlock.h"
#import <objc/runtime.h>

static char UIGestureRecognizerBBlockKey;

@implementation UIGestureRecognizer(BBlock)

- (instancetype)initWithBlock:(UIGestureRecognizerBBlock)block{
    if((self = [self initWithTarget:self action:@selector(gestureAction:)])){
        objc_setAssociatedObject(self, &UIGestureRecognizerBBlockKey, 
                                 block, OBJC_ASSOCIATION_COPY_NONATOMIC);        
    }
    return self;
}

+ (instancetype)gestureRecognizerWithBlock:(UIGestureRecognizerBBlock)block{
    return [[[self class] alloc] initWithBlock:block];
}

- (void)gestureAction:(id)gestureRecognizer{
	UIGestureRecognizerBBlock block = objc_getAssociatedObject(self, &UIGestureRecognizerBBlockKey);
    if(block){
        block(gestureRecognizer);
    }
}

@end


@implementation UISwipeGestureRecognizer(BBlock)

- (instancetype)initWithDirection:(UISwipeGestureRecognizerDirection)direction andBlock:(UIGestureRecognizerBBlock)block{
    if((self = [self initWithBlock:block])){
        self.direction = direction;
    }
    return self;
}

+ (instancetype)gestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction andBlock:(UIGestureRecognizerBBlock)block{
    return [[[self class] alloc] initWithDirection:direction andBlock:block];
}

@end
