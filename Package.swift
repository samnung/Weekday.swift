// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Weekday",
    products: [
        .library(
            name: "Weekday",
            targets: ["Weekday"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "8.0.2")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "2.2.0")),
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
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
