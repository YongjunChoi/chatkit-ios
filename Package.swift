// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatKit",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ChatKit",
            targets: ["ChatKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: /* package url */"https://github.com/sendbird/sendbird-uikit-ios-spm", from: "3.3.6"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "ChatKit",dependencies: [.product(name: "SendbirdUIKit", package: "sendbird-uikit-ios-spm")]),
//        .target(name: "ChatKit",dependencies: [
//            .target(name: "ChatKit"),
//            .product(name: "SendbirdUIKit", package: "sendbird-uikit-ios-spm")]),
        .testTarget(
            name: "ChatKitTests",
            dependencies: ["ChatKit"]),
    ]
)
