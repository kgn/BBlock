//
//  BBlock.h
//  BBlock
//
//  Created by David Keegan on 4/10/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>

/// For when you need a weak reference to self, example: `BBlockWeakSelf wself = self;`
#define BBlockWeakSelf __weak typeof([self weakReference])

/// For when you need a weak reference of an object, example: `BBlockWeakObject(obj) wobj = obj;`
#define BBlockWeakObject(o) __weak typeof([o weakReference])


@interface BBlock

/// Execute the block on the main thread
+ (void)dispatchOnMainThread:(void (^)())block;

@end


@interface NSObject(BBlockWeakReference)
- (instancetype)weakReference;
@end
