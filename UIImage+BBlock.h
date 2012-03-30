//
//  UIImage+BBlock.h
//  BBlock
//
//  Created by David Keegan on 3/21/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(BBlock)

/// Returns a `UIImage` that can be used to cache drawing. This method does not cache the image object.
+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock;

/// Returns a cached `UIImage` that can be used for drawing. The `UIImage` is cached in an `NSCache` with the name provided.
+ (UIImage *)imageNamed:(NSString *)name forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock;

@end
