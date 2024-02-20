// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FXCoreUI",
    platforms: [
        .iOS(.v13) // This sets the minimum deployment target to iOS 13
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FXCoreUI",
            targets: ["FXCoreUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", 
                 from: "4.3.4"),
        .package(url: "https://github.com/ApricodeMembangunNegeri/FXCore.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FXCoreUI",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm"),
                "FXCore"
            ],
            resources: [
                .process("Resources"),
                .process("Fonts")
            ]),
        .testTarget(
            name: "FXCoreUITests",
            dependencies: ["FXCoreUI"]),
    ]
)
