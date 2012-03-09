//
//  NSArray+BBlock.h
//  BBlock
//
//  Created by David Keegan on 3/7/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(BBlock)

// Enumerate each object in the array
- (void)enumerateEachObjectUsingBlock:(void(^)(id obj))block;

@end
