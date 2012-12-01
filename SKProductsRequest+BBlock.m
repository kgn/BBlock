//
//  SKProductsRequest+BBlock.m
//  BBlock
//
//  Created by David Keegan on 8/7/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "SKProductsRequest+BBlock.h"
#import <objc/runtime.h>

static char SKProductsRequestBBlockKey;
static char SKProductsRequestDelegateBBlockKey;

@interface SKProductsRequestBBlockDelegate : NSObject
<SKProductsRequestDelegate>
@end

@implementation SKProductsRequestBBlockDelegate

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
	SKProductsRequestBBlock block = objc_getAssociatedObject(self, &SKProductsRequestBBlockKey);
    block(response, nil);
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
	SKProductsRequestBBlock block = objc_getAssociatedObject(self, &SKProductsRequestBBlockKey);
    block(nil, error);
}

@end

@implementation SKProductsRequest(BBlock)

+ (id)requestWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block{
    return [[[self class] alloc] initWithProductIdentifiers:productIdentifiers andBlock:block];
}

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block{
    NSParameterAssert(block != nil);
    if((self = [self initWithProductIdentifiers:productIdentifiers])){
        SKProductsRequestBBlockDelegate *productsRequestDelegate = [[SKProductsRequestBBlockDelegate alloc] init];
        objc_setAssociatedObject(self, &SKProductsRequestDelegateBBlockKey, productsRequestDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(productsRequestDelegate, &SKProductsRequestBBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        self.delegate = productsRequestDelegate;
        [self start];
    }
    return self;
}

@end
