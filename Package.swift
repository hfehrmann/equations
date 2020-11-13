// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Equations",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(name: "Equations", targets: ["Equations"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Equations",
            dependencies: []),
        .testTarget(
            name: "EquationsTests",
            dependencies: ["Equations"]),
    ]
)
