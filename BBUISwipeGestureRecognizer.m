//
//  BBUISwipeGestureRecognizer.m
//  BBlock
//
//  Created by David Keegan on 12/29/11.
//  Copyright (c) 2011-12 David Keegan. All rights reserved.
//

#import "BBUISwipeGestureRecognizer.h"

@interface BBUISwipeGestureRecognizer()
- (void)swipeAction:(id)sender;
@end

@implementation BBUISwipeGestureRecognizer{
    BBUISwipeGestureRecognizerAction _action;
}

- (void)swipeAction:(id)sender{
    if(_action){
        _action(self);
    }
}

- (id)initForDirection:(UISwipeGestureRecognizerDirection)direction withAction:(BBUISwipeGestureRecognizerAction)action{
    if((self = [super initWithTarget:self action:@selector(swipeAction:)])){
        self.direction = direction;
        _action = [action copy];
    }
    return self;
}

@end
