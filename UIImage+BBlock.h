//
//  UIImage+BBlock.h
//  BBlock
//
//  Created by David Keegan on 3/21/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(BBlock)

+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock;

@end
