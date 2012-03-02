//
//  NSImage+BBlock.m
//  BBlock
//
//  Created by David Keegan on 2/28/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "NSImage+BBlock.h"

@implementation NSImage(BBlock)

+ (NSImage *)imageForSize:(NSSize)size withDrawingBlock:(void(^)())drawingBlock{
    NSImage *image = [[NSImage alloc] initWithSize:size];
    [image lockFocus];
    drawingBlock();
    [image unlockFocus];
    return image;
}

@end
