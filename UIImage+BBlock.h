//
//  UIImage+BBlock.h
//  BBlock
//
//  Created by David Keegan on 3/21/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

// Helper method for creating unique image identifiers
#define BBlockImageIdentifier(fmt, ...) [NSString stringWithFormat:(@"%@%@" fmt), \
    NSStringFromClass([self class]), NSStringFromSelector(_cmd), ##__VA_ARGS__]

@interface UIImage(BBlock)

/** Returns a `UIImage` rendered with the drawing code in the block. 
This method does not cache the image object. */
+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock;
+ (UIImage *)imageForSize:(CGSize)size opaque:(BOOL)opaque withDrawingBlock:(void(^)())drawingBlock;

/** Returns a cached `UIImage` rendered with the drawing code in the block. 
The `UIImage` is cached in an `NSCache` with the identifier provided. */
+ (UIImage *)imageWithIdentifier:(NSString *)identifier forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock;
+ (UIImage *)imageWithIdentifier:(NSString *)identifier opaque:(BOOL)opaque forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock;

/** Return the cached image for the identifier, or nil if there is no cached image. */
+ (UIImage *)imageWithIdentifier:(NSString *)identifier;

@end
