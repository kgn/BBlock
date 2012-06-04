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

@interface UIActionSheet(BBlockPrivate)<UIActionSheetDelegate>
- (void)actionSheet:(UIActionSheet *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

@implementation UIActionSheet(BBlock)

- (id)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle destructiveButtonTitle:(NSString *)destructiveTitle 
   otherButtonTitle:(NSString *)otherTitle completionBlock:(UIActionSheetBBlock)block{
    if((self = [self initWithTitle:title delegate:self cancelButtonTitle:cancelTitle 
            destructiveButtonTitle:destructiveTitle otherButtonTitles:otherTitle, nil])){
        [self setCompletionBlock:block];
        return self;
    }
    return nil;    
}

- (void)setCompletionBlock:(UIActionSheetBBlock)block{
    if(block != nil){
        objc_setAssociatedObject((self.delegate = self), &UIAlertViewBBlockKey, 
                                 [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)actionSheet:(UIActionSheet *)sheetView clickedButtonAtIndex:(NSInteger)buttonIndex{
	UIActionSheetBBlock block = objc_getAssociatedObject(self, &UIAlertViewBBlockKey);
    if(block){
        block(buttonIndex, sheetView);
    }
}

@end
