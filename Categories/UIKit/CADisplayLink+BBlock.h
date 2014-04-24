//
//  CADisplayLink+BBlock.h
//  BBlock
//
//  Created by David Keegan on 4/23/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

@import QuartzCore;

@interface CADisplayLink(BBlock)

typedef void (^BBlockCADisplayLinkBlock)(CADisplayLink *displayLink);

+ (instancetype)displayLinkWithBlock:(BBlockCADisplayLinkBlock)block;

@end
