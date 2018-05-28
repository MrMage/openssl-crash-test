// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "openssl-crash-test",
    dependencies: [
        // 🔵 Swift ORM (queries, models, relations, etc)

        .package(url: "https://github.com/mrmage/grpc-swift.git", .branch("dev")),
		
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.0.3"),
        
        
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "openssl-crash-test",
            dependencies: ["NIOOpenSSL",
			"SwiftProtobuf",
			"SwiftGRPC"]),
        .testTarget(
            name: "openssl-crash-testTests",
            dependencies: ["openssl-crash-test"]),
    ]
)
