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

+ (id)requestWithProductIdentifiers:(NSSet *)productIdentifiers andCompletionBlock:(SKProductsRequestBBlock)completionBlock{
    return [[[self class] alloc] initWithProductIdentifiers:productIdentifiers andCompletionBlock:completionBlock];
}

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers andCompletionBlock:(SKProductsRequestBBlock)completionBlock{
    if((self = [self initWithProductIdentifiers:productIdentifiers])){
        objc_setAssociatedObject((self.delegate = self), &SKProductsRequestBBlockKey,
                                 completionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self start];
    }
    return self;
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
	SKProductsRequestBBlock block = objc_getAssociatedObject(self, &SKProductsRequestBBlockKey);
    if(block){
        block(response);
    }
}

@end
