// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AOC",
    platforms: [.macOS(.v13)],
    products: [
        // 2022 solutions
        .library(name: "TwentyOneKit", targets: ["TwentyOneKit"]),
        .executable(name: "advent2021", targets: ["Advent2021"])
    ],
    dependencies: [
    ],
    targets: [
        // 2022 solutions
        .target(
            name: "TwentyOneKit",
            resources: [.copy("Input")]),
            
        .testTarget(
            name: "TwentyOneKitTests",
            dependencies: ["TwentyOneKit"]),

        .executableTarget(name: "Advent2021", dependencies: 
["TwentyOneKit"])
    ]
)
