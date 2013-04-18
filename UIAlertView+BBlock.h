//
//  UIAlertView+BBlock.h
//  BBlock
//
//  Created by Dominic Tham on 5/14/12.
//  Updated by David Keegan on 6/4/12.
//

#import <UIKit/UIKit.h>

@interface UIAlertView(BBlock)

typedef void (^UIAlertViewBBlock)(NSInteger buttonIndex, UIAlertView *alertView);

- (void)setCompletionBlock:(UIAlertViewBBlock)block;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle
             otherButtonTitle:(NSString *)otherButtonTitle completionBlock:(UIAlertViewBBlock)block;

@end
