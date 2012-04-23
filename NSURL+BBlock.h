//
//  NSURL+BBlock.h
//  BBlock
//
//  Created by David Keegan on 4/22/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL(BBlock)

/// Access a security scoped bookmark for sandboxed mac apps.
/// This method starts the access, runs the block, then stops the access.
-(void)accessSecurityScopedResourceWithBlock:(void (^)())block;

@end
