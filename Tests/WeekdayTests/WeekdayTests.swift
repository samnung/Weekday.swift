import Quick
import Nimble
@testable import Weekday

final class WeekdayTests: QuickSpec {
  override func spec() {
    super.spec()

    describe("sorting of weekdays") {
      it("can sort days when first day is sunday") {
        let days: [Weekday] = [
          .wednesday,
          .tuesday,
          .sunday,
          .saturday,
        ]

        let expected: [Weekday] = [
          .sunday,
          .tuesday,
          .wednesday,
          .saturday,
        ]

        let actual = with(locale: "en_US") {
          return days.sorted(by: Weekday.compare)
        }

        expect(actual).to(equal(expected))
      }

      it("can sort days when first day is monday") {
        let days: [Weekday] = [
          .wednesday,
          .tuesday,
          .sunday,
          .monday,
          .saturday,
        ]

        let expected: [Weekday] = [
          .monday,
          .tuesday,
          .wednesday,
          .saturday,
          .sunday,
        ]

        let actual = with(locale: "cs_CZ") {
          return days.sorted(by: Weekday.compare)
        }

        expect(actual).to(equal(expected))
      }
    }

    describe("all") {
      it("can generate all weekdays for current locale, monday starting") {
        let expected: [Weekday] = [
          .monday,
          .tuesday,
          .wednesday,
          .thursday,
          .friday,
          .saturday,
          .sunday,
        ]

        let actual = with(locale: "cs_CZ") {
          return Weekday.all
        }

        expect(actual).to(equal(expected))
      }

      it("can generate all weekdays for current locale, sunday starting") {
        let expected: [Weekday] = [
          .sunday,
          .monday,
          .tuesday,
          .wednesday,
          .thursday,
          .friday,
          .saturday,
          ]

        let actual = with(locale: "en_US") {
          return Weekday.all
        }

        expect(actual).to(equal(expected))
      }
    }

    describe("next") {
      it("can get to next weekday") {
        expect(Weekday.monday.next).to(equal(Weekday.tuesday))
        expect(Weekday.tuesday.next).to(equal(Weekday.wednesday))
        expect(Weekday.wednesday.next).to(equal(Weekday.thursday))
        expect(Weekday.thursday.next).to(equal(Weekday.friday))
        expect(Weekday.friday.next).to(equal(Weekday.saturday))
        expect(Weekday.saturday.next).to(equal(Weekday.sunday))
        expect(Weekday.sunday.next).to(equal(Weekday.monday))
      }
    }

    describe("previous") {
      it("can get to previous weekday") {
        expect(Weekday.monday.previous).to(equal(Weekday.sunday))
        expect(Weekday.sunday.previous).to(equal(Weekday.saturday))
        expect(Weekday.saturday.previous).to(equal(Weekday.friday))
        expect(Weekday.friday.previous).to(equal(Weekday.thursday))
        expect(Weekday.thursday.previous).to(equal(Weekday.wednesday))
        expect(Weekday.wednesday.previous).to(equal(Weekday.tuesday))
        expect(Weekday.tuesday.previous).to(equal(Weekday.monday))
      }
    }
  }
}

