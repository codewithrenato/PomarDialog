// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PomarDialog",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "PomarDialog",
            targets: ["PomarDialog"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PomarDialog",
            dependencies: [],
            resources: [
                .process("Screenshots")
            ]
        )
    ]
)
