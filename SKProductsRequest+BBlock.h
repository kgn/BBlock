//
//  SKProductsRequest+BBlock.h
//  BBlock
//
//  Created by David Keegan on 8/7/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@interface SKProductsRequest(BBlock)

typedef void (^SKProductsRequestBBlock)(SKProductsResponse *response);

+ (id)requestWithProductIdentifiers:(NSSet *)productIdentifiers andCompletionBlock:(SKProductsRequestBBlock)completionBlock;
- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers andCompletionBlock:(SKProductsRequestBBlock)completionBlock;

@end
