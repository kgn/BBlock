//
//  BBlock.h
//  BBlock
//
//  Created by David Keegan on 4/10/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>

/// For when you need a weak reference of an object, example: `BBlockWeakObject(obj) wobj = obj;`
#define BBlockWeakObject(o) __weak __typeof__((__typeof__(o))o)

/// For when you need a weak reference to self, example: `BBlockWeakSelf wself = self;`
#define BBlockWeakSelf BBlockWeakObject(self)


@interface BBlock : NSObject

/// Execute the block on the main thread
+ (void)dispatchOnMainThread:(void (^)())block;

@end
