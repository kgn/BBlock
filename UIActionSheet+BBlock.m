//
//  UIActionSheet+BBlock.m
//  BBlock
//
//  Created by David Keegan on 6/4/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIActionSheet+BBlock.h"
#import <objc/runtime.h>

static char UIAlertViewBBlockKey;

@interface UIActionSheet(BBlockPrivate)
<UIActionSheetDelegate>
@end

@implementation UIActionSheet(BBlock)

- (id)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle destructiveButtonTitle:(NSString *)destructiveTitle 
   otherButtonTitle:(NSString *)otherTitle completionBlock:(UIActionSheetBBlock)block{
    if((self = [self initWithTitle:title delegate:self cancelButtonTitle:cancelTitle 
            destructiveButtonTitle:destructiveTitle otherButtonTitles:otherTitle, nil])){
        [self setCompletionBlock:block];
    }
    return self;
}

- (void)setCompletionBlock:(UIActionSheetBBlock)block{
    objc_setAssociatedObject((self.delegate = self), &UIAlertViewBBlockKey, 
                             block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)actionSheet:(UIActionSheet *)sheetView clickedButtonAtIndex:(NSInteger)buttonIndex{
	UIActionSheetBBlock block = objc_getAssociatedObject(self, &UIAlertViewBBlockKey);
    if(block)block(buttonIndex, sheetView);
}

@end
