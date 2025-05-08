// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "RemoveStoreKit",
    platforms: [.macOS(.v13)],
    dependencies: [
        // For CLI argument parsing:
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
        // For Xcode project manipulation:
        .package(url: "https://github.com/tuist/XcodeProj.git", from: "8.0.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
    ],
    targets: [
        .executableTarget(
            name: "RemoveStoreKit",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "XcodeProj", package: "XcodeProj"),
                .product(name: "PathKit", package: "PathKit"),
            ]
        ),
    ]
)