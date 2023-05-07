// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "HashingSwift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "HashingSwift",
            targets: ["HashingSwift"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/sublabdev/common-swift.git", exact: "1.0.0"),
        .package(url: "https://github.com/daisuke-t-jp/xxHash-Swift", exact: "1.1.1"),
        .package(url: "https://github.com/keefertaylor/Base58Swift.git", exact: "2.1.10"),
        .package(url: "https://github.com/tesseract-one/Blake2.swift.git", exact: "0.1.2"),
        .package(path: "/Users/alexoakley/Projects/keccak-swift")
    ],
    targets: [
        .target(
            name: "HashingSwift",
            dependencies: [
                .productItem(name: "CommonSwift", package: "common-swift"),
                .productItem(name: "KeccakSwift", package: "keccak-swift"),
                .productItem(name: "xxHash-Swift", package: "xxHash-Swift"),
                .productItem(name: "Base58Swift", package: "Base58Swift"),
                .productItem(name: "Blake2", package: "Blake2.swift"),
            ]
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
