//
//  UITextField+BBlock.h
//  SignNow
//
//  Created by David Keegan on 11/16/12.
//  Copyright (c) 2012 SignNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField(BBlock)

typedef BOOL (^UITextFieldShouldReturnBBlock)(UITextField *textField);

- (void)textFieldShouldReturnWithBlock:(UITextFieldShouldReturnBBlock)block;

@end
