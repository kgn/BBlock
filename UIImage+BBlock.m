//
//  UIImage+BBlock.m
//  BBlock
//
//  Created by David Keegan on 3/21/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIImage+BBlock.h"

@implementation UIImage(BBlock)

+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock{
    UIImage *image = nil;
    if([UIScreen instancesRespondToSelector:@selector(scale)]){
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    drawingBlock();
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();    
    return image;
}

@end
