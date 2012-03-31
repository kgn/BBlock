###NSArray+BBlock.h

Enumerate each object in the array.

```obj-c
- (void)enumerateEachObjectUsingBlock:(void(^)(id obj))block;
```
###NSImage+BBlock.h

Returns a `NSImage` rendered with the drawing code in the block. This method does not cache the image object. 

```obj-c
+ (NSImage *)imageForSize:(NSSize)size withDrawingBlock:(void(^)())drawingBlock;
```
Returns a cached `NSImage` rendered with the drawing code in the block. The `NSImage` is cached in an `NSCache` with the identifier provided. 

```obj-c
+ (NSImage *)imageWithIdentifier:(NSString *)identifier forSize:(NSSize)size andDrawingBlock:(void(^)())drawingBlock;
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

Returns a `UIImage` rendered with the drawing code in the block. This method does not cache the image object. 

```obj-c
+ (UIImage *)imageForSize:(CGSize)size withDrawingBlock:(void(^)())drawingBlock;
```
Returns a cached `UIImage` rendered with the drawing code in the block. The `UIImage` is cached in an `NSCache` with the identifier provided. 

```obj-c
+ (UIImage *)imageWithIdentifier:(NSString *)identifier forSize:(CGSize)size andDrawingBlock:(void(^)())drawingBlock;
```
