//
//  NSApplication+BBlock.m
//  BBlock
//
//  Created by Jonathan Willing on 5/11/12.
//  Copyright 2012 Jonathan Willing. All rights reserved.
//

#import "NSApplication+BBlock.h"
#import <objc/runtime.h>

static NSString *key = @"kSheetBlocksKey";

@implementation NSApplication(BBlock)

- (void)beginSheet:(NSWindow*)sheet 
    modalForWindow:(NSWindow*)modalWindow 
 completionHandler:(void (^)(NSInteger returnCode))handler {
   
    [self beginSheet:sheet
      modalForWindow:modalWindow
       modalDelegate:self
      didEndSelector:@selector(_sheetDidEnd:returnCode:contextInfo:)
         contextInfo:NULL];
    objc_setAssociatedObject(self, (__bridge const void *)(key), handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)_sheetDidEnd:(NSWindow*)sheet
          returnCode:(int)returnCode
         contextInfo:(void*)contextInfo {
    
    void (^handler)(NSInteger returnCode) = objc_getAssociatedObject(self, (__bridge const void *)(key));
    handler(returnCode);
    objc_setAssociatedObject(self, (__bridge const void *)(key), nil, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [sheet orderOut:nil];
}

@end