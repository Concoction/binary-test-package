// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9026/"
let modules = ["test-package", "ModuleA", "ModuleB", "ModuleC"]

let package = Package(
    name: "test-package",


    products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


    targets: [
        .target(name: "test-package_Binder", dependencies: modules.map { .target(name: $0) }),
        .binaryTarget(
            name: "test-package",
            url: repo + "test-package.xcframework.zip",
            checksum: "1fb9d3024d16173fb0a30321f375ebda932fdd973e79e48549ccd7f2dc39a61e"
        ),
        .binaryTarget(
            name: "ModuleA",
            url: repo + "ModuleA.xcframework.zip",
            checksum: "688eb01848e7492d5ce82a7119628b9aa60de0a96b576804f6159b274c324177"
        ),
        .binaryTarget(
            name: "ModuleB",
            url: repo + "ModuleB.xcframework.zip",
            checksum: "0625237ee1e0d96782027a83ba551da4c25b4510148253ec4f4ce953777209f5"
        ),
        .binaryTarget(
            name: "ModuleC",
            url: repo + "ModuleC.xcframework.zip",
            checksum: "86647272269862f275ebe2b051fc49a24cb7a27878e6f1d60cf53c01bffa9926"
        ),
    ]
)
