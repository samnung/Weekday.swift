import Foundation

public enum Weekday: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7

    public init(sundayStarting: Int) {
        self.init(rawValue: sundayStarting)!
    }

    public init(mondayStarting: Int) {
        switch mondayStarting {
        case 1: self = .monday
        case 2: self = .tuesday
        case 3: self = .wednesday
        case 4: self = .thursday
        case 5: self = .friday
        case 6: self = .saturday
        case 7: self = .sunday
        default:
            fatalError()
        }
    }

    public init(date: Date) {
        let weekdayIndex = Calendar.current.component(.weekday, from: date)
        self.init(sundayStarting: weekdayIndex)
    }

    public static var current: Weekday {
        return Weekday(date: Date())
    }

    public static var all: [Weekday] {
        let starting = Calendar.current.firstWeekday

        return (1...7).map {
            let round = starting - 1

            let newValue = $0 + round
            if newValue > 7 {
                return Weekday(rawValue: newValue - 7)!
            } else {
                return Weekday(rawValue: newValue)!
            }
        }
    }

    public var next: Weekday {
        var index = Weekday.all.index(of: self)!
        index += 1
        if index > 6 {
            index -= 7
        }
        return Weekday.all[index]
    }

    public var previous: Weekday {
        var index = Weekday.all.index(of: self)!
        index -= 1
        if index < 0 {
            index += 7
        }
        return Weekday.all[index]
    }

    public var sundayStartingRawValue: Int {
        return rawValue
    }

    /**
     Returns value that can be used as index to array where first item is Monday
     */
    public var indexValueForMondayStarting: Int {
        return indexValueFor(starting: Weekday.monday.rawValue)
    }

    public var indexValueForSundayStarting: Int {
        return indexValueFor(starting: Weekday.sunday.rawValue)
    }

    public var isToday: Bool {
        let weekdayIndex = Calendar.current.component(.weekday, from: Date())
        return rawValue == weekdayIndex
    }

    public var localizedName: String {
        struct Static {
            static let weekdays = DateFormatter().standaloneWeekdaySymbols!
        }

        return Static.weekdays[self.indexValueForSundayStarting]
    }

    public var shortLocalizedName: String {
        struct Static {
            static let weekdays = DateFormatter().shortWeekdaySymbols!
        }

        return Static.weekdays[self.indexValueForSundayStarting]
    }

    public func indexValueFor(starting: Int) -> Int {
        let round = starting - 1

        let newValue = self.rawValue - round - 1 // - 1 because of index starts at 0
        if newValue < 0 {
            return newValue + 7
        } else {
            return newValue
        }
    }

    public static func compare(_ lhs: Weekday, _ rhs: Weekday) -> Bool {
        let firstday = Calendar.current.firstWeekday

        let lhsAligned = lhs.indexValueFor(starting: firstday)
        let rhsAligned = rhs.indexValueFor(starting: firstday)
        return lhsAligned < rhsAligned
    }

    static func compare(_ lhs: Int, _ rhs: Int) -> Bool {
        return compare(Weekday(sundayStarting: lhs), Weekday(sundayStarting: rhs))
    }
}
