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

@interface UIGestureRecognizer(BBlockPrivate)
- (void)gestureAction:(UIGestureRecognizer *)gesture;
@end

@implementation UIGestureRecognizer(BBlock)

- (id)initWithBlock:(UIGestureRecognizerBBlock)block{
    if((self = [self initWithTarget:self action:@selector(gestureAction:)])){
        objc_setAssociatedObject(self, &UIGestureRecognizerBBlockKey, 
                                 block, OBJC_ASSOCIATION_COPY_NONATOMIC);        
    }
    return self;
}

+ (id)gestureWithBlock:(UIGestureRecognizerBBlock)block{
    return [[[self class] alloc] initWithBlock:block];
}

- (void)gestureAction:(UIGestureRecognizer *)gesture{
	UIGestureRecognizerBBlock block = objc_getAssociatedObject(self, &UIGestureRecognizerBBlockKey);
    if(block)block(gesture);
}

@end


@implementation UISwipeGestureRecognizer(BBlock)

- (id)initWithDirection:(UISwipeGestureRecognizerDirection)direction andBlock:(UIGestureRecognizerBBlock)block{
    if((self = [self initWithBlock:block])){
        self.direction = direction;
    }
    return self;
}

+ (id)gestureWithDirection:(UISwipeGestureRecognizerDirection)direction andBlock:(UIGestureRecognizerBBlock)block{
    return [[[self class] alloc] initWithDirection:direction andBlock:block];
}

@end
