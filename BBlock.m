//
//  BBlock.m
//  BBlock
//
//  Created by David Keegan on 4/10/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "BBlock.h"

@implementation BBlock

+ (void)dispatchOnMainThread:(void (^)())block{
    NSParameterAssert(block != nil);
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (void)dispatchOnSynchronousQueue:(void (^)())block{
    NSParameterAssert(block != nil);
    static dispatch_queue_t queue;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        queue = dispatch_queue_create("bblock.queue.serial", DISPATCH_QUEUE_SERIAL);
    });
    dispatch_async(queue, block);
}

+ (void)dispatchOnDefaultPriorityConcurrentQueue:(void (^)())block{
    NSParameterAssert(block != nil);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, block);
}

+ (void)dispatchOnLowPriorityConcurrentQueue:(void (^)())block{
    NSParameterAssert(block != nil);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_async(queue, block);
}

+ (void)dispatchOnHighPriorityConcurrentQueue:(void (^)())block{
    NSParameterAssert(block != nil);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, block);
}

@end
