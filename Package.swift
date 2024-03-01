// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9025/"
let modules = ["ModuleC", "test-package", "ModuleA", "ModuleB"]

let package = Package(
  name: "test-package",


  products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


  targets: [
    .target(name: "test-package_Binder"),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "5b5e06d45a3baf44189a3eae5c9c99462234e25c11cdf43d326c0cde501597c8"
    ),
    .binaryTarget(
        name: "test-package",
        url: repo + "test-package.xcframework.zip",
        checksum: "e2b1dd7813c8a53f88ccaf6ac7c670f13d24d01ab5e51b183cb0dd29b382c667"
    ),
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "6f9a7ce031081777c34108d517a1fc65b0c7421c7039929ff03b6345aa82f43a"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "29b4082a23e56aa623c7b793891599761ba1bb73bf2f39eca5c64b4d0d6e5fdd"
    ),
  ]
)
