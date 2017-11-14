import Quick
import Nimble
import OverrideLocale

public func with<T>(locale: Locale, block: () -> T) -> T {
    NSLocale.ttt_overrideRuntimeLocale(locale)
    let result = block()
    NSLocale.ttt_resetRuntimeLocale()

    return result
}

public func with<T>(locale: String, block: () -> T) -> T {
    return with(locale: Locale(identifier: locale), block: block)
}
