//
//  UIActionSheet+BBlock.m
//  BBlock
//
//  Created by David Keegan on 6/4/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIActionSheet+BBlock.h"
#import <objc/runtime.h>

static char UIActionSheetBBlockKey;
static char UIActionSheetDelegateBBlockKey;

@interface UIActionSheetDelegate : NSObject
<UIActionSheetDelegate>
@end

@implementation UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)sheetView clickedButtonAtIndex:(NSInteger)buttonIndex{
	UIActionSheetBBlock block = objc_getAssociatedObject(self, &UIActionSheetBBlockKey);
    if(block)block(buttonIndex, sheetView);
}

@end

@implementation UIActionSheet(BBlock)

- (id)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle destructiveButtonTitle:(NSString *)destructiveTitle 
   otherButtonTitle:(NSString *)otherTitle completionBlock:(UIActionSheetBBlock)block{
    if((self = [self initWithTitle:title delegate:nil cancelButtonTitle:cancelTitle
            destructiveButtonTitle:destructiveTitle otherButtonTitles:otherTitle, nil])){
        [self setCompletionBlock:block];
    }
    return self;
}

- (void)setCompletionBlock:(UIActionSheetBBlock)block{
    UIActionSheetDelegate *actionSheetDelegate = [[UIActionSheetDelegate alloc] init];
    objc_setAssociatedObject(self, &UIActionSheetDelegateBBlockKey, actionSheetDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(actionSheetDelegate, &UIActionSheetBBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = actionSheetDelegate;
}

@end
