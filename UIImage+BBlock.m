//
//  UIImage+BBlock.m
//  BBlock
//
//  Created by David Keegan on 3/21/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIImage+BBlock.h"

@implementation UIImage(BBlock)

+ (NSCache *)drawingCache{
    static NSCache *cache = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        cache = [[NSCache alloc] init];
    });
    return cache;
}

+ (UIImage *)imageForSize:(CGSize)size opaque:(BOOL)opaque withDrawingBlock:(void(^)())drawingBlock{
    if(size.width <= 0.0f || size.height <= 0.0f){
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, opaque, 0.0f);
    if(drawingBlock){
        drawingBlock();
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock{
    return [self imageForSize:size opaque:NO withDrawingBlock:drawingBlock];
}

+ (UIImage *)imageWithIdentifier:(NSString *)identifier opaque:(BOOL)opaque forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock{
    UIImage *image = [[self drawingCache] objectForKey:identifier];
    if(image == nil && (image = [self imageForSize:size opaque:opaque withDrawingBlock:drawingBlock])){
        [[self drawingCache] setObject:image forKey:identifier];
    }
    return image;
}

+ (UIImage *)imageWithIdentifier:(NSString *)identifier forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock{
    return [self imageWithIdentifier:identifier opaque:NO forSize:size andDrawingBlock:drawingBlock];
}

+ (UIImage *)imageWithIdentifier:(NSString *)identifier{
    return [[self drawingCache] objectForKey:identifier];
}

@end
