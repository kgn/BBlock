//
//  NSArray+BBlock.h
//  BBlock
//
//  Created by David Keegan on 3/7/12.
//  Copyright (c) 2012 InScopeApps {+}. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(BBlock)
- (void)enumerateEachObjectUsingBlock:(void(^)(id obj))block;
@end
