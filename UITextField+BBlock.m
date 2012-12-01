//
//  UITextField+BBlock.m
//  SignNow
//
//  Created by David Keegan on 11/16/12.
//  Copyright (c) 2012 SignNow. All rights reserved.
//

#import "UITextField+BBlock.h"
#import <objc/runtime.h>

static char BBlockUITextFieldDelegateKey;
static char BBlockUITextFieldShouldReturnKey;

@interface BBlockUITextFieldDelegate : NSObject
<UITextFieldDelegate>
@end

@implementation BBlockUITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	UITextFieldShouldReturnBBlock block = objc_getAssociatedObject(self, &BBlockUITextFieldShouldReturnKey);
    if(block){
        return block(textField);
    }
    return YES;
}

@end

@implementation UITextField(BBlock)

- (void)textFieldShouldReturnWithBlock:(UITextFieldShouldReturnBBlock)block{
    BBlockUITextFieldDelegate *textFieldDelegate = [[BBlockUITextFieldDelegate alloc] init];
    objc_setAssociatedObject(self, &BBlockUITextFieldDelegateKey, textFieldDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(textFieldDelegate, &BBlockUITextFieldShouldReturnKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = textFieldDelegate;
}

@end
