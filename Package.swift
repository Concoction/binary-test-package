// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9021/"
let modules = ["ModuleA", "ModuleB", "ModuleC"]

let package = Package(
  name: "test-package",


  products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


  targets: [
    .target(name: "test-package_Binder"),
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "e7b040e9839d20d8768a177de82e77fa873c3e460fae877671e3f3d215a7b312"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "d569be9b0baaaa690d0ddcf05a31e8ce500a3efdf94784c8e81d0509c80ed5c4"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "9a575593b9a565122ac0bd8aa21763b59c251cbe324a7d2e6660ea8cb252a6cb"
    ),
  ]
)
