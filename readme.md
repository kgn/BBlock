##BBNSButton.h

###@interface BBNSButton : NSButton

Set the callback block to be called when the mouse **enters** the button.

```obj-c
- (void)setInCallback:(BBNSButtonCallback)block;
```

Set the callback block to be called when the mouse **exits** the button.

```obj-c
- (void)setOutCallback:(BBNSButtonCallback)block;
```

Set both the **enter* and **exit** callback blocks.

```obj-c
- (void)setInCallback:(BBNSButtonCallback)inBlock andOutCallback:(BBNSButtonCallback)outBlock;
```

##BBUISwipeGestureRecognizer.h

###@interface BBUISwipeGestureRecognizer : UISwipeGestureRecognizer

```obj-c
- (id)initForDirection:(UISwipeGestureRecognizerDirection)direction withAction:(BBUISwipeGestureRecognizerAction)action;
```

##BBlock.h

###@interface BBlock : NSObject

Execute the block on the main thread

```obj-c
+ (void)dispatchOnMainThread:(void (^)())block;
```

##NSArray+BBlock.h

###@interface NSArray(BBlock)

Enumerate each object in the array.

```obj-c
- (void)enumerateEachObjectUsingBlock:(void(^)(id obj))block;
```

##NSButton+BBlock.h

###@interface NSButton(BBlock)

**WARNING**: This category is still in early development.
Currently the order of calling these methods is important:

1. `setImage`
2. `setAlternateBackgroundImage`
3. `setBackgroundImage`

Tries to mimic `UIButton` by exposing a method to set the background image.
The image set with `setImage` is composited on-top of the background image. 

```obj-c
- (void)setBackgroundImage:(NSImage *)backgroundImage;
```

Tries to mimic `UIButton` by exposing a method to set the alternate background image.
The image set with `setAlternateImage` is composited on-top of the alternate background image.
If no `alternateImage` is set `image` will be used instead. 

```obj-c
- (void)setAlternateBackgroundImage:(NSImage *)alternateBackgroundImage;
```

##NSImage+BBlock.h

###@interface NSImage(BBlock)

Returns a `NSImage` rendered with the drawing code in the block.
This method does not cache the image object. 

```obj-c
+ (NSImage *)imageForSize:(NSSize)size withDrawingBlock:(void(^)())drawingBlock;
```

Returns a cached `NSImage` rendered with the drawing code in the block.
The `NSImage` is cached in an `NSCache` with the identifier provided. 

```obj-c
+ (NSImage *)imageWithIdentifier:(NSString *)identifier forSize:(NSSize)size andDrawingBlock:(void(^)())drawingBlock;
```

##NSTimer+BBlock.h

###@interface NSTimer(BBlock)

```obj-c
+ (id)timerWithTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;
```

```obj-c
+ (id)timerRepeats:(BOOL)repeats withTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;
```

```obj-c
+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;
```

```obj-c
+ (id)scheduledTimerRepeats:(BOOL)repeats withTimeInterval:(NSTimeInterval)timeInterval andBlock:(void (^)())block;
```

##UIImage+BBlock.h

###@interface UIImage(BBlock)

Returns a `UIImage` rendered with the drawing code in the block.
This method does not cache the image object. 

```obj-c
+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock;
```

Returns a cached `UIImage` rendered with the drawing code in the block.
The `UIImage` is cached in an `NSCache` with the identifier provided. 

```obj-c
+ (UIImage *)imageWithIdentifier:(NSString *)identifier forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock;
```

