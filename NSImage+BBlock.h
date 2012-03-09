//
//  NSImage+BBlock.h
//  BBlock
//
//  Created by David Keegan on 2/28/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage(BBlock)

// Returns an `NSImage` that can be used to cache drawing
+ (NSImage *)imageForSize:(NSSize)size withDrawingBlock:(void(^)())drawingBlock;

@end
