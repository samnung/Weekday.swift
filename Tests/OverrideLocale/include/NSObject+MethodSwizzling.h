#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzling)

+ (void)ttt_swizzleClassMethod:(SEL)original withReplacement:(SEL)swizzled;

+ (void)ttt_swizzleInstanceMethod:(SEL)original withReplacement:(SEL)swizzled;

@end
