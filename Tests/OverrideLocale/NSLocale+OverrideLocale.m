#import "NSLocale+OverrideLocale.h"
#import "NSObject+MethodSwizzling.h"
#import <objc/runtime.h>

static NSLocale *ttt_locale = nil;


@implementation NSCalendar (OverrideLocale)

+ (void)ttt_swizzleLocales
{
    [self ttt_swizzleClassMethod:@selector(autoupdatingCurrentCalendar) withReplacement:@selector(ttt_autoupdatingCurrentCalendar)];
    [self ttt_swizzleClassMethod:@selector(currentCalendar) withReplacement:@selector(ttt_currentCalendar)];
}

+ (id /* NSCalendar * */)ttt_autoupdatingCurrentCalendar
{
    NSCalendar *calendar = [NSCalendar ttt_autoupdatingCurrentCalendar];
    if (ttt_locale) {
        calendar.locale = ttt_locale;
    }

    return calendar;
}

+ (id /* NSCalendar * */)ttt_currentCalendar
{
    NSCalendar *calendar = [NSCalendar ttt_currentCalendar];
    if (ttt_locale) {
        calendar.locale = ttt_locale;
    }

    return calendar;
}

@end


@implementation NSLocale (OverrideLocale)

+ (void)load
{
    [self ttt_swizzleLocales];
    [NSCalendar ttt_swizzleLocales];
}

+ (void)ttt_overrideRuntimeLocale:(NSLocale *)locale
{
    ttt_locale = locale;
}

+ (void)ttt_resetRuntimeLocale
{
    ttt_locale = nil;
}

+ (void)ttt_swizzleLocales
{
    [self ttt_swizzleClassMethod:@selector(autoupdatingCurrentLocale) withReplacement:@selector(ttt_autoupdatingCurrentLocale)];
    [self ttt_swizzleClassMethod:@selector(currentLocale) withReplacement:@selector(ttt_currentLocale)];
    [self ttt_swizzleClassMethod:@selector(systemLocale) withReplacement:@selector(ttt_systemLocale)];
}

+ (id /* NSLocale * */)ttt_autoupdatingCurrentLocale
{
    return ttt_locale ?: [self ttt_autoupdatingCurrentLocale];
}

+ (id /* NSLocale * */)ttt_currentLocale
{
    return ttt_locale ?: [self ttt_currentLocale];
}

+ (id /* NSLocale * */)ttt_systemLocale
{
    return ttt_locale ?: [self ttt_systemLocale];
}

@end
