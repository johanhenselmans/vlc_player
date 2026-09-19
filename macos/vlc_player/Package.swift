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
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .binaryTarget(
            name: "VLCKit",
            url: "https://github.com/johanhenselmans/vlc_player/releases/download/3.7.3/VLCKit.xcframework.zip",
            checksum: "3e02386a3319306348cd80392e15079d921033e893d716b796cd9b4b7f00e511"
        ),
        .target(
            name: "vlc_player",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                "VLCKit"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
