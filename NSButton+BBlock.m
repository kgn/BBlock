//
//  NSButton+BBlock.m
//  BBlock
//
//  Created by David Keegan on 4/4/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "NSButton+BBlock.h"
#import "NSImage+BBlock.h"

@interface NSButton(BBlockPrivate)
- (NSImage *)imageForSize:(NSSize)size withBackgroundImage:(NSImage *)background andIcon:(NSImage *)icon;
@end

@implementation NSButton(BBlock)

- (NSImage *)imageWithBackgroundImage:(NSImage *)background andIcon:(NSImage *)icon{
    return [NSImage imageForSize:background.size withDrawingBlock:^{
        NSRect bounds = NSZeroRect;
        bounds.size = background.size;
        
        NSRect iconRect = NSZeroRect;
        iconRect.size = icon.size;
        iconRect.origin.x = round(background.size.width*0.5f-iconRect.size.width*0.5f);
        iconRect.origin.y = round(background.size.height*0.5f-iconRect.size.height*0.5f);    
        
        [background drawInRect:bounds fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];
        [icon drawInRect:iconRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];
    }];
}

- (void)setBackgroundImage:(NSImage *)backgroundImage{
    [self setImage:[self imageWithBackgroundImage:backgroundImage 
                              andIcon:self.image]];
    [self setButtonType:NSMomentaryChangeButton];
    [self setBordered:NO];
}

- (void)setAlternateBackgroundImage:(NSImage *)alternateBackgroundImage{
    [self setAlternateImage:[self imageWithBackgroundImage:alternateBackgroundImage 
                                       andIcon:self.alternateImage ?: self.image]];
    [self setButtonType:NSMomentaryChangeButton];
    [self setBordered:NO];
}

@end
