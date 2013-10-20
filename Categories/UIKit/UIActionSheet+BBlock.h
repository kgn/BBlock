//
//  UIActionSheet+BBlock.h
//  BBlock
//
//  Created by David Keegan on 6/4/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet(BBlock)

typedef void (^UIActionSheetBBlock)(NSInteger buttonIndex, UIActionSheet *actionSheet);

- (void)setCompletionBlock:(UIActionSheetBBlock)block;

- (instancetype)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle destructiveButtonTitle:(NSString *)destructiveTitle
             otherButtonTitle:(NSString *)otherTitle completionBlock:(UIActionSheetBBlock)block;

@end
