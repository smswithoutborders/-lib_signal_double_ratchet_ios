// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libsig_doubleratchet_smswithoutborders",
    platforms: [.macOS(.v14), .iOS(.v13), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "libsig_doubleratchet_smswithoutborders",
            targets: ["libsig_doubleratchet_smswithoutborders"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift", from: "1.8.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "libsig_doubleratchet_smswithoutborders",
            dependencies: ["CryptoSwift"]),
        .testTarget(
            name: "libsig_doubleratchet_smswithoutbordersTests",
            dependencies: ["libsig_doubleratchet_smswithoutborders"]
        ),
    ]
)
