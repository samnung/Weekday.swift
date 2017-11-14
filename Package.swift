// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Weekday",
    products: [
        .library(
            name: "Weekday",
            targets: ["Weekday"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMinor(from: "7.0.2")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMinor(from: "1.2.0")),
    ],
    targets: [
        .target(
            name: "Weekday",
            dependencies: []),
        .target(
            name: "OverrideLocale",
            dependencies: [],
            path: "Tests/OverrideLocale"),
        .testTarget(
            name: "WeekdayTests",
            dependencies: ["Weekday", "Nimble", "Quick", "OverrideLocale"]),
    ],
    swiftLanguageVersions: [3, 4]
)
