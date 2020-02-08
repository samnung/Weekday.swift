# Weekday.swift

[![CocoaPods](https://img.shields.io/cocoapods/v/Weekday.svg)](https://cocoapods.org/pods/Weekday)
[![Platforms](https://img.shields.io/cocoapods/p/Weekday.svg)](https://cocoapods.org/pods/Weekday)

Is neat Swift library for dealing with weekdays. All of us hates when we have to deal with weekdays, they don't make much sense in code. That's why exists this library.

Work in Progress for now, but already using in several applications in pruduction. Follows SemVer, don't worry about breaking changes.

## Main features

- cyclying through all days in week
- it is an Swift enum (🎉 for static validation)
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

// find first next working day (not today)
let friday = Weekday.friday
friday.firstNext(from: Weekday.workingDays) == .monday


Weekday.all.forEach {
  let label = UILabel()
  label.text = $0.localizedName

  if $0.isToday {
    label.textColor = .red
  } else if Weekday.workingDays.contains($0) {
    label.textColor = .white
  } else {
    label.textColor = .lightGray
  }

  // some other configuration

  stackView.addArrangedSubview(label)
}
```

## Installation

Weekday.swift is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Weekday'
```

### Swift Package Manager

Weekday.swift is also available through Swift Package Manager. Add following line to dependecies in your `Package.swift` file:

```swift
    .package(url: "https://github.com/samnung/Weekday.swift.git", .upToNextMajor(from: "0.2")),
```

## License

MIT. See the [`LICENSE`](LICENSE) file for details.
