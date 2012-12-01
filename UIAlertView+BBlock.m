//
//  UIAlertView+BBlock.m
//  BBlock
//
//  Created by Dominic Tham on 5/14/12.
//  Updated by David Keegan on 6/4/12.
//

#import "UIAlertView+BBlock.h"
#import <objc/runtime.h>

static char UIAlertViewBBlockKey;
static char UIAlertViewDelegateBBlockKey;

@interface UIAlertViewBBlockDelegate : NSObject
<UIAlertViewDelegate>
@end

@implementation UIAlertViewBBlockDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	UIAlertViewBBlock block = objc_getAssociatedObject(self, &UIAlertViewBBlockKey);
    if(block)block(buttonIndex, alertView);
}

@end

@implementation UIAlertView(BBlock)

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle 
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
    objc_setAssociatedObject(alertViewDelegate, &UIAlertViewBBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = alertViewDelegate;
}

@end
