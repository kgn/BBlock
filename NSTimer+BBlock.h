//
//  NSTimer+BBlock.h
//  BBlock
//
//  Created by David Keegan on 3/12/12.
//  Copyright 2012 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer(BBlock)

+ (id)timerWithTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;
+ (id)timerRepeats:(BOOL)repeats withTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;
+ (id)scheduledTimerRepeats:(BOOL)repeats withTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;

@end
