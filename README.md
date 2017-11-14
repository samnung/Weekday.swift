# Weekday.swift

Is neat Swift library for dealing with weekdays. All of us hates when we have to deal with weekdays, they don't make much sense in code. That's why exists this library.

Work in Progress for now, but already using in several applications in pruduction.

## Main features

- cyclying through all days in week
- it is an enum (yay for static validation)
- methods like `.next` and `.previous` with edges of the week support

## Example of usages

```swift
import Weekday

let today = Weekday.current // it is monday for example
today.next == .tuesday

// when the week starts at sunday (USA, ...)
let saturday = Weekday.saturday
saturday.next == .sunday

// when the week starts at monday (Europe, ...)
let sunday = Weekday.sunday
sunday.next == .monday

// same for previous
let wednesday = Weekday.wednesday
wednesday.previous == .tuesday
```

## License

MIT. See the [`LICENSE`](LICENSE) file for details.
