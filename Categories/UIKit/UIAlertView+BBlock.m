//
//  UIAlertView+BBlock.m
//  BBlock
//
//  Created by Dominic Tham on 5/14/12.
//  Updated by David Keegan on 6/4/12.
//

#import "UIAlertView+BBlock.h"
#import <objc/runtime.h>

static char UIAlertViewDelegateBBlockKey;

@interface UIAlertViewBBlockDelegate : NSObject
<UIAlertViewDelegate>
@property (strong, nonatomic) UIAlertViewBBlock block;
@end

@implementation UIAlertViewBBlockDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(self.block){
        self.block(buttonIndex, alertView);
    }
}
@end

@implementation UIAlertView(BBlock)

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle
             otherButtonTitle:(NSString *)otherButtonTitle completionBlock:(UIAlertViewBBlock)block{
    if((self = [self initWithTitle:title message:message delegate:nil
                  cancelButtonTitle:cancelTitle otherButtonTitles:otherButtonTitle, nil])){
        [self setCompletionBlock:block];
        return self;
    }
    return nil;
}

- (void)setCompletionBlock:(UIAlertViewBBlock)block{
    UIAlertViewBBlockDelegate *alertViewDelegate = [[UIAlertViewBBlockDelegate alloc] init];
    objc_setAssociatedObject(self, &UIAlertViewDelegateBBlockKey, alertViewDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    alertViewDelegate.block = block;
    self.delegate = alertViewDelegate;
}

@end
