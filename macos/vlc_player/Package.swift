// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "vlc_player",
    platforms: [
        .macOS("10.15")
    ],
    products: [
        .library(name: "vlc-player", targets: ["vlc_player"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://code.videolan.org/videolan/VLCKit.git", exact: "4.0.0-a24")
    ],
    targets: [
        .target(
            name: "vlc_player",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "VLCKit", package: "VLCKit")
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
