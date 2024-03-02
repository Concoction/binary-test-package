// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9028/"
let frameworks = [/*"ModuleC",*/ /*"test-package",*/ "ModuleA", "ModuleB"]

let package = Package(
    name: "test-package",


    products: ["ModuleA", "ModuleB"].map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


    targets: [
        .target(name: "test-package_Binder", dependencies: frameworks.map { .target(name: $0) }),
        .binaryTarget(
            name: "ModuleC",
            url: repo + "ModuleC.xcframework.zip",
            checksum: "f8574016cd4ba48ea324fc7e7b5c2b448da4171c5c1c6844a5a7a55d854a02d9"
        ),
        .binaryTarget(
            name: "test-package",
            url: repo + "test-package.xcframework.zip",
            checksum: "d398a26efb50f25f7864cf45b650e954cc760e7609d4d616ab56c82bb29fef3a"
        ),
        .binaryTarget(
            name: "ModuleA",
            url: repo + "ModuleA.xcframework.zip",
            checksum: "9653814e6bc4ca7042f030e9e98774b1de00016a258049aa81466158a3dea654"
        ),
        .binaryTarget(
            name: "ModuleB",
            url: repo + "ModuleB.xcframework.zip",
            checksum: "c3c1bb28e0221b8f24f99398a89d8907ddfee6286a8fbb69bb4707faf108469f"
        ),
    ]
)
