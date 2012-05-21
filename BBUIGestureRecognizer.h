//
//  BBUISwipeGestureRecognizer.h
//  BBlock
//
//  Created by David Keegan on 12/29/11.
//  Copyright (c) 2011-12 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBUISwipeGestureRecognizer : UISwipeGestureRecognizer

typedef void (^BBUISwipeGestureRecognizerAction)(BBUISwipeGestureRecognizer *);
- (id)initForDirection:(UISwipeGestureRecognizerDirection)direction withAction:(BBUISwipeGestureRecognizerAction)action;

@end


@interface BBUIPinchGestureRecognizer : UIPinchGestureRecognizer

typedef void (^BBUIPinchGestureRecognizerAction)(BBUIPinchGestureRecognizer *);
- (id)initWithAction:(BBUIPinchGestureRecognizerAction)action;

@end
