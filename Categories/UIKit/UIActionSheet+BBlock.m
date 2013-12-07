//
//  UIActionSheet+BBlock.m
//  BBlock
//
//  Created by David Keegan on 6/4/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "UIActionSheet+BBlock.h"
#import <objc/runtime.h>

static char UIActionSheetDelegateBBlockKey;

@interface UIActionSheetDelegate : NSObject
<UIActionSheetDelegate>
@property (strong, nonatomic) UIActionSheetBBlock block;
@end

@implementation UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)sheetView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(self.block){
        self.block(buttonIndex, sheetView);
    }
}
@end

@implementation UIActionSheet(BBlock)

- (instancetype)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle destructiveButtonTitle:(NSString *)destructiveTitle 
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
    actionSheetDelegate.block = block;
    self.delegate = actionSheetDelegate;
}

@end
