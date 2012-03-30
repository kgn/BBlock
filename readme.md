###NSArray+BBlock.h

Enumerate each object in the array.

```obj-c
- (void)enumerateEachObjectUsingBlock:(void(^)(id obj))block;
```
###NSImage+BBlock.h

Returns an `NSImage` that can be used to cache drawing.

```obj-c
+ (NSImage *)imageForSize:(NSSize)size withDrawingBlock:(void(^)())drawingBlock;
```
Returns a cached `NSImage` that can be used for drawing. The `NSImage` is cached in an `NSCache` with the name provided.

```obj-c
+ (NSImage *)imageNamed:(NSString *)name forSize:(NSSize)size andDrawingBlock:(void(^)())drawingBlock;
```
###NSTimer+BBlocks.h

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
###UIImage+BBlock.h

Returns a `UIImage` that can be used to cache drawing.

```obj-c
+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock;
```
Returns a cached `UIImage` that can be used for drawing. The `UIImage` is cached in an `NSCache` with the name provided.

```obj-c
+ (UIImage *)imageNamed:(NSString *)name forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock;
```
