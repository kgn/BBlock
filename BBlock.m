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
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
}

@end
