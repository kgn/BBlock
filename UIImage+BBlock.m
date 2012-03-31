//
//  UIImage+BBlock.m
//  BBlock
//
//  Created by David Keegan on 3/21/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIImage+BBlock.h"

@interface UIImage(BBlockPrivate)
+ (NSCache *)drawingCache;
@end

@implementation UIImage(BBlock)

+ (NSCache *)drawingCache{
    static NSCache *cache = nil;
    if(cache == nil){
        cache = [[NSCache alloc] init];
    }
    return cache;
}

+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock{
    if([UIScreen instancesRespondToSelector:@selector(scale)]){
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    drawingBlock();
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithIdentifier:(NSString *)identifier forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock{
    UIImage *image = [[[self class] drawingCache] objectForKey:identifier];
    if(image == nil){
        image = [[self class] imageForSize:size withDrawingBlock:drawingBlock];
        [[[self class] drawingCache] setObject:image forKey:identifier];
    }
    return image;
}

@end
