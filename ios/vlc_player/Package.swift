// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "vlc_player",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "vlc-player", targets: ["vlc_player"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .binaryTarget(
            name: "MobileVLCKit",
            url: "https://github.com/showbie/MobileVLCKit-SPM/releases/download/3.7.3/MobileVLCKit.xcframework.zip",
            checksum: "0346e458e119d57d4768d4096e2f7b4f77b7a0df4e21d0e728856f309cc6e8ab"
        ),
        .target(
            name: "vlc_player",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                "MobileVLCKit"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
