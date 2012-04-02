//
//  NSImage+BBlock.m
//  BBlock
//
//  Created by David Keegan on 2/28/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "NSImage+BBlock.h"

@interface NSImage(BBlockPrivate)
+ (NSCache *)drawingCache;
@end

@implementation NSImage(BBlock)

+ (NSCache *)drawingCache{
    static NSCache *cache = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        cache = [[NSCache alloc] init];
    });
    return cache;
}

+ (NSImage *)imageForSize:(NSSize)size withDrawingBlock:(void(^)())drawingBlock{
    NSImage *image = [[NSImage alloc] initWithSize:size];
    [image lockFocus];
    drawingBlock();
    [image unlockFocus];
    return image;
}

+ (NSImage *)imageWithIdentifier:(NSString *)identifier forSize:(NSSize)size andDrawingBlock:(void(^)())drawingBlock{
    NSImage *image = [[[self class] drawingCache] objectForKey:identifier];
    if(image == nil){
        image = [[self class] imageForSize:size withDrawingBlock:drawingBlock];
        [[[self class] drawingCache] setObject:image forKey:identifier];
    }
    return image;
}

@end
