//
//  NSImage+BBlock.h
//  BBlock
//
//  Created by David Keegan on 2/28/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage(BBlock)

/// Returns an `NSImage` that can be used to cache drawing. This method does not cache the image object.
+ (NSImage *)imageForSize:(NSSize)size withDrawingBlock:(void(^)())drawingBlock;

/// Returns a cached `NSImage` that can be used for drawing. The `NSImage` is cached in an `NSCache` with the name provided.
+ (NSImage *)imageNamed:(NSString *)name forSize:(NSSize)size andDrawingBlock:(void(^)())drawingBlock;

@end
