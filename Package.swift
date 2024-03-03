// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9031/"
let modules = ["ModuleC", "ModuleB", "test-package", "ModuleA"]

let package = Package(
    name: "test-package",


    products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


    targets: [
        .target(name: "test-package_Binder", dependencies: modules.map { .target(name: $0) }),
        .binaryTarget(
            name: "ModuleC",
            url: repo + "ModuleC.xcframework.zip",
            checksum: "82d21d033a038b3c8e628dbf5e2824f78de251fd0b3a59663f09d0dbc045be0c"
        ),
        .binaryTarget(
            name: "ModuleB",
            url: repo + "ModuleB.xcframework.zip",
            checksum: "12e0933672e5805d31cf3351579477fec3236ddc86771315528727b6fa758fea"
        ),
        .binaryTarget(
            name: "test-package",
            url: repo + "test-package.xcframework.zip",
            checksum: "9ddbf03857a3f1f6c647e00279bf015f71cf450433beb981455dea792f55a24a"
        ),
        .binaryTarget(
            name: "ModuleA",
            url: repo + "ModuleA.xcframework.zip",
            checksum: "72e8bf3ddd61ac5265cd12e5f2a09e4d827a6215c3f183a12f5fbbf5612ab6d5"
        ),
    ]
)
