//
//  SKProductsRequest+BBlock.m
//  BBlock
//
//  Created by David Keegan on 8/7/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "SKProductsRequest+BBlock.h"
#import <objc/runtime.h>

static char SKProductsRequestDelegateBBlockKey;

@interface SKProductsRequestBBlockDelegate : NSObject
<SKProductsRequestDelegate>
@property (strong, nonatomic) SKProductsRequestBBlock block;
@end

@implementation SKProductsRequestBBlockDelegate
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    if(self.block){
        self.block(response, nil);
    }
}
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    if(self.block){
        self.block(nil, error);
    }
}
@end

@implementation SKProductsRequest(BBlock)

+ (instancetype)requestWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block{
    return [[[self class] alloc] initWithProductIdentifiers:productIdentifiers andBlock:block];
}

- (instancetype)initWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block{
    NSParameterAssert(block != nil);
    if((self = [self initWithProductIdentifiers:productIdentifiers])){
        SKProductsRequestBBlockDelegate *productsRequestDelegate = [[SKProductsRequestBBlockDelegate alloc] init];
        objc_setAssociatedObject(self, &SKProductsRequestDelegateBBlockKey,
                                 productsRequestDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.delegate = productsRequestDelegate;
        productsRequestDelegate.block = block;
        [self start];
    }
    return self;
}

@end
