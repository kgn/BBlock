//
//  NSButton+BBlock.h
//  BBlock
//
//  Created by David Keegan on 4/4/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSButton(BBlock)

/** **WARNING**: This category is still in early development.
 Currently the order of calling these methods is important:

 1. `setImage`
 2. `setAlternateBackgroundImage`
 3. `setBackgroundImage`
 */

/** Tries to mimic `UIButton` by exposing a method to set the background image.
 The image set with `setImage` is composited on-top of the background image. */
- (void)setBackgroundImage:(NSImage *)backgroundImage;

/** Tries to mimic `UIButton` by exposing a method to set the alternate background image.
 The image set with `setAlternateImage` is composited on-top of the alternate background image.
 If no `alternateImage` is set `image` will be used instead. */
- (void)setAlternateBackgroundImage:(NSImage *)alternateBackgroundImage;

@end
