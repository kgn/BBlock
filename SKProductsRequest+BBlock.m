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

@interface SKProductsRequest(BBlockPrivate)
<SKProductsRequestDelegate>
@end

@implementation SKProductsRequest(BBlock)

+ (id)requestWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block{
    return [[[self class] alloc] initWithProductIdentifiers:productIdentifiers andBlock:block];
}

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block{
    NSParameterAssert(block != nil);
    if((self = [self initWithProductIdentifiers:productIdentifiers])){
        objc_setAssociatedObject((self.delegate = self), &SKProductsRequestBBlockKey,
                                 block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self start];
    }
    return self;
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
	SKProductsRequestBBlock block = objc_getAssociatedObject(self, &SKProductsRequestBBlockKey);
    block(response, nil);
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
	SKProductsRequestBBlock block = objc_getAssociatedObject(self, &SKProductsRequestBBlockKey);
    block(nil, error);
}

@end
