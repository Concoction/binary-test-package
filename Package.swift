// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9027/"
let modules = ["ModuleA", "ModuleB", "ModuleC"]

let package = Package(
    name: "test-package",


    products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


    targets: [
        .target(name: "test-package_Binder", dependencies: modules.map { .target(name: $0) }),
        .binaryTarget(
            name: "ModuleA",
            url: repo + "ModuleA.xcframework.zip",
            checksum: "e57ef51282b9b6c6808cdd718f8159fc1946ed7613fbe9d3be109fcc4e764745"
        ),
        .binaryTarget(
            name: "ModuleB",
            url: repo + "ModuleB.xcframework.zip",
            checksum: "5a964cb1792c5b190bd28e9e9a1fe205039afd0651250c0d16c26be7f01f0102"
        ),
        .binaryTarget(
            name: "ModuleC",
            url: repo + "ModuleC.xcframework.zip",
            checksum: "ef1c6882fdc839d98b453623a02850ae14ebbed5972c830866a8cd01f196a4db"
        ),
    ]
)
