// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9030/"
let modules = ["ModuleB", "ModuleA", "test-package", "ModuleC"]

let package = Package(
    name: "test-package",


    products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


    targets: [
        .target(name: "test-package_Binder", dependencies: modules.map { .target(name: $0) }),
        .binaryTarget(
            name: "ModuleB",
            url: repo + "ModuleB.xcframework.zip",
            checksum: "fcac4d1e504a39c0231ac45cacd72dc425fbc9ed19ca2024201125b4167c0ed7"
        ),
        .binaryTarget(
            name: "ModuleA",
            url: repo + "ModuleA.xcframework.zip",
            checksum: "4d2ff24f1755eed8e93127c001febe37dc3e9b6e3dc104a34f17cb673891b6f6"
        ),
        .binaryTarget(
            name: "test-package",
            url: repo + "test-package.xcframework.zip",
            checksum: "8b0006def97a855d12d946713bc6b20091b36b568769ab5b2422a0de1601bf03"
        ),
        .binaryTarget(
            name: "ModuleC",
            url: repo + "ModuleC.xcframework.zip",
            checksum: "476e90ad060cf58ac0f4ca1c858731996fe91674c13efd56b2fe641dc07fe13c"
        ),
    ]
)
