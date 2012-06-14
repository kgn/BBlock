//
//  BBUISwipeGestureRecognizer.m
//  BBlock
//
//  Created by David Keegan on 12/29/11.
//  Copyright (c) 2011-12 David Keegan. All rights reserved.
//

#import "BBUIGestureRecognizer.h"

@interface BBUISwipeGestureRecognizer()
- (void)swipeAction:(id)sender;
@end

@implementation BBUISwipeGestureRecognizer{
    BBUISwipeGestureRecognizerAction _action;
}

- (void)swipeAction:(id)sender{
    if(_action)_action(self);
}

- (id)initForDirection:(UISwipeGestureRecognizerDirection)direction withAction:(BBUISwipeGestureRecognizerAction)action{
    if((self = [super initWithTarget:self action:@selector(swipeAction:)])){
        self.direction = direction;
        _action = [action copy];
    }
    return self;
}

#if !__has_feature(objc_arc)
- (void)dealloc{
    [_action release];
    [super dealloc];
}
#endif

@end


@interface BBUIPinchGestureRecognizer()
- (void)pinchAction:(id)sender;
@end

@implementation BBUIPinchGestureRecognizer{
    BBUIPinchGestureRecognizerAction _action;
}

- (void)pinchAction:(id)sender{
    if(_action)_action(self);
}

- (id)initWithAction:(BBUIPinchGestureRecognizerAction)action{
    if((self = [super initWithTarget:self action:@selector(pinchAction:)])){
        _action = [action copy];
    }
    return self;
}

#if !__has_feature(objc_arc)
- (void)dealloc{
    [_action release];
    [super dealloc];
}
#endif

@end

@interface BBUITapGestureRecognizer()
- (void)tapAction:(id)sender;
@end

@implementation BBUITapGestureRecognizer{
    BBUITapGestureRecognizerAction _action;
}

- (id)initWithAction:(BBUITapGestureRecognizerAction)action{
    if((self = [super initWithTarget:self action:@selector(tapAction:)])){
        _action = [action copy];
    }
    return self;    
}

- (void)tapAction:(id)sender{
    if(_action)_action(self);
}

#if !__has_feature(objc_arc)
- (void)dealloc{
    [_action release];
    [super dealloc];
}
#endif

@end