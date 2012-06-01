//
//  NSObject+BBlock.m
//  BBlock
//
//  Created by David Keegan on 5/31/12.
//  Copyright 2012 David Keegan. All rights reserved.
//

#import "NSObject+BBlock.h"
#import <objc/runtime.h>

#if __has_feature(objc_arc)
#define BBKVOObjectVoidBridge __bridge void *
#else
#define BBKVOObjectVoidBridge void *
#endif

static NSString *BBKVOObjectKey = @"BBKVOObjectKey";

@interface BBKVOObject : NSObject
@end

@implementation BBKVOObject{
    NSObjectBBlock _block;
}
- (id)initWithBlock:(NSObjectBBlock)block{
    if((self = [super init])){
        _block = [block copy];
    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if(_block){
        _block(keyPath, object, change);
    }
}
#if !__has_feature(objc_arc)
- (void)dealloc{
    [_block release];
    [super dealloc];
}
#endif
@end

@implementation NSObject(BBlock)

- (NSString *)addObserverForKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options block:(NSObjectBBlock)block{
    BBKVOObject *kvoObject = [[BBKVOObject alloc] initWithBlock:block];
    [self addObserver:kvoObject forKeyPath:keyPath options:options context:nil];
    
    NSString *identifier = [[NSProcessInfo processInfo] globallyUniqueString];
    NSMutableDictionary *observers = objc_getAssociatedObject(self, (BBKVOObjectVoidBridge)BBKVOObjectKey) ?: [NSMutableDictionary dictionary];
    [observers setObject:kvoObject forKey:identifier];
    objc_setAssociatedObject(self, (BBKVOObjectVoidBridge)BBKVOObjectKey, observers, OBJC_ASSOCIATION_RETAIN);    
#if !__has_feature(objc_arc)
    [kvoObject release];
#endif    
    return identifier;
}

- (void)removeObserverForToken:(NSString *)identifier{
    NSMutableDictionary *observers = objc_getAssociatedObject(self, (BBKVOObjectVoidBridge)BBKVOObjectKey) ?: [NSMutableDictionary dictionary];   
    [observers removeObjectForKey:identifier];
    objc_setAssociatedObject(self, (BBKVOObjectVoidBridge)BBKVOObjectKey, observers, OBJC_ASSOCIATION_RETAIN);      
}

@end
