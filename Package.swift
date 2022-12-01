// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AOC",
    platforms: [.macOS(.v13)],
    products: [
        // 2022 solutions
        .library(name: "TwentyTwoKit", targets: ["TwentyTwoKit"]),
        .executable(name: "advent2022", targets: ["Advent2022"])
    ],
    dependencies: [
    ],
    targets: [
        // 2022 solutions
        .target(
            name: "TwentyTwoKit",
            resources: [.copy("Input")]),
            
        .testTarget(
            name: "TwentyTwoKitTests",
            dependencies: ["TwentyTwoKit"]),

        .executableTarget(name: "Advent2022", dependencies: ["TwentyTwoKit"])
    ]
)
