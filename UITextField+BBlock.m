//
//  UITextField+BBlock.m
//  SignNow
//
//  Created by David Keegan on 11/16/12.
//  Copyright (c) 2012 SignNow. All rights reserved.
//

#import "UITextField+BBlock.h"
#import <objc/runtime.h>

static char UITextFieldShouldReturnBBlockKey;

@interface UITextField(BBlockPrivate)
<UITextFieldDelegate>
@end

@implementation UITextField(BBlock)

- (void)textFieldShouldReturnWithBlock:(UITextFieldShouldReturnBBlock)block{
    objc_setAssociatedObject((self.delegate = self), &UITextFieldShouldReturnBBlockKey,block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	UITextFieldShouldReturnBBlock block = objc_getAssociatedObject(self, &UITextFieldShouldReturnBBlockKey);
    if(block){
        return block(self);
    }
    return YES;
}

@end
