//
//  BBNSButton.m
//  BBlock
//
//  Created by David Keegan on 4/10/12.
//  Copyright (c) 2012 David Keegan. All rights reserved.
//

#import "BBNSButton.h"

@implementation BBNSButton{
    BBNSButtonCallback _inCallback;
    BBNSButtonCallback _outCallback;
}

- (void)setInCallback:(BBNSButtonCallback)block{
    _inCallback = [block copy];
}

- (void)setOutCallback:(BBNSButtonCallback)block{
    _outCallback = [block copy];
}

- (void)setInCallback:(BBNSButtonCallback)inBlock
       andOutCallback:(BBNSButtonCallback)outBlock{
    [self setInCallback:inBlock];
    [self setOutCallback:outBlock];
}

- (id)initWithFrame:(NSRect)frame{
    if((self = [super initWithFrame:frame])){
        NSTrackingArea *trackingArea = 
        [[NSTrackingArea alloc] 
         initWithRect:self.visibleRect
         options:NSTrackingMouseEnteredAndExited|NSTrackingActiveAlways
         owner:self userInfo:nil];
        [self addTrackingArea:trackingArea];
    }
    return self;
}

- (void)mouseEntered:(NSEvent *)theEvent{
    if(self.isEnabled && _inCallback){
        _inCallback();
    }
}

- (void)mouseExited:(NSEvent *)theEvent{
    if(_outCallback){
        _outCallback();
    }
}

@end
