//
//  SKStoreProductViewController+BBlock.h
//  BBlock
//
//  Created by David Keegan on 5/23/13.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@interface SKStoreProductViewController(BBlock)

typedef void (^SKStoreProductViewControllerBBlock)(SKStoreProductViewController *productViewController);

+ (id)productViewControllerWithDidFinishBlock:(SKStoreProductViewControllerBBlock)block;
- (id)initWithProductViewControllerWithDidFinishBlock:(SKStoreProductViewControllerBBlock)block;

@end
