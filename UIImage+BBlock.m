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

@end
