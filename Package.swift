// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9024/"
let modules = ["ModuleC", "ModuleA", "ModuleB", "test-package"]

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
        checksum: "d3a4d326c48b220cec089419cbc70ca606b7a92601d31c24e8b72e1c576db30a"
    ),
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "d91b5d85ff50cbd64438456f4026993c1c72e4c1bc79733a14f4edd605d38e24"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "b6c8cfc93343a091529f638fd3262f6ca8377ae66ede9b0a5beef6ced95d5585"
    ),
    .binaryTarget(
        name: "test-package",
        url: repo + "test-package.xcframework.zip",
        checksum: "4fcaaaf60803e65b41a15dd172a11c25961c4050f527c56ae6ff97bd4519e0a4"
    ),
  ]
)
