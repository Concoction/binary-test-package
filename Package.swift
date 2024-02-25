// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9013/"
let modules = ["ModuleA", "ModuleB", "ModuleC"]

let package = Package(
  name: "test-package",


  products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "_Binder"]
    ) },


  targets: [
    .target(name: "_Binder"),
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "98b90117ee45a93edc02dc40d405e513d2291a9ee9c77cd6c5786a9727f0f202"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "2948fdb9e71e8ae28e790b9a7d4f65347d89458e63f7797f410c8096fc627bc0"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "3d25003760d144b538a299c403f9fcf07a2903b8a01a8a2ee1d308e997729c1e"
    ),
  ]
)
