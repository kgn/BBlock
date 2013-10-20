//
//  SKStoreProductViewController+BBlock.m
//  BBlock
//
//  Created by David Keegan on 5/23/13.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "SKStoreProductViewController+BBlock.h"
#import <objc/runtime.h>

static char SKStoreProductViewControllerBBlockKey;

@interface SKStoreProductViewControllerBBlockDelegate : NSObject
<SKStoreProductViewControllerDelegate>
@property (strong, nonatomic) SKStoreProductViewControllerBBlock block;
@end

@implementation SKStoreProductViewControllerBBlockDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    if(self.block){
        self.block(viewController);
    }
}
@end

@implementation SKStoreProductViewController(BBlock)

+ (id)productViewControllerWithDidFinishBlock:(SKStoreProductViewControllerBBlock)block{
    return [[[self class] alloc] initWithProductViewControllerWithDidFinishBlock:block];
}

- (id)initWithProductViewControllerWithDidFinishBlock:(SKStoreProductViewControllerBBlock)block{
    NSParameterAssert(block != nil);
    if((self = [self init])){
        SKStoreProductViewControllerBBlockDelegate *storeDelegate =
        [[SKStoreProductViewControllerBBlockDelegate alloc] init];
        objc_setAssociatedObject(self, &SKStoreProductViewControllerBBlockKey,
                                 storeDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.delegate = storeDelegate;
        storeDelegate.block = block;
    }
    return self;
}

@end
