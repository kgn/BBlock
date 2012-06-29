//
//  BBUISwipeGestureRecognizer.h
//  BBlock
//
//  Created by David Keegan on 12/29/11.
//  Copyright (c) 2011-12 David Keegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBUISwipeGestureRecognizer : UISwipeGestureRecognizer

typedef void (^BBUISwipeGestureRecognizerAction)(BBUISwipeGestureRecognizer *gesture);
- (id)initForDirection:(UISwipeGestureRecognizerDirection)direction withAction:(BBUISwipeGestureRecognizerAction)action;

@end


@interface BBUIPinchGestureRecognizer : UIPinchGestureRecognizer

typedef void (^BBUIPinchGestureRecognizerAction)(BBUIPinchGestureRecognizer *gesture);
- (id)initWithAction:(BBUIPinchGestureRecognizerAction)action;

@end

@interface BBUITapGestureRecognizer : UITapGestureRecognizer

typedef void (^BBUITapGestureRecognizerAction)(BBUITapGestureRecognizer *gesture);
- (id)initWithAction:(BBUITapGestureRecognizerAction)action;

@end

@interface BBUIPanGestureRecognizer : UIPanGestureRecognizer

typedef void (^BBUIPanGestureRecognizerAction)(BBUIPanGestureRecognizer *gesture);
- (id)initWithAction:(BBUIPanGestureRecognizerAction)action;

@end
