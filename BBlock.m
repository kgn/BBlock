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
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

@end


// Thanks to Larcus94 for suggesting this solution for creating a generic weak self define!
// http://stackoverflow.com/questions/10892361/generic-typeof-for-weak-self-references#comment14215007_10896047
@implementation NSObject(BBlockWeakReference)
- (instancetype)weakReference{
    __weak id obj = self; 
    return obj;
}
@end
