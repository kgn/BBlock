//
//  BBlock.h
//  BBlock
//
//  Created by David Keegan on 4/10/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBlock : NSObject

/// Execute the block on the main thread
+ (void)dispatchOnMainThread:(void (^)())block;

@end
