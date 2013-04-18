//
//  SKProductsRequest+BBlock.h
//  BBlock
//
//  Created by David Keegan on 8/7/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@interface SKProductsRequest(BBlock)

typedef void (^SKProductsRequestBBlock)(SKProductsResponse *response, NSError *error);

/// Request a StoreKit response for a set of product identifiers
+ (instancetype)requestWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block;
- (instancetype)initWithProductIdentifiers:(NSSet *)productIdentifiers andBlock:(SKProductsRequestBBlock)block;

@end
