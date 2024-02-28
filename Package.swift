// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9022/"
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
        checksum: "0b77767b38dff5d44dd309696ca10f0633eda7d047caf92e6d5328f8d22e94ff"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "bdbdbd0cf03852b0b7d0e910419c0d770c63551d260324f0b265907e16b9b87c"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "81b465afc4ffc78422f3d48fb6d1d51ac74d08a48e165a4d6bfea54cdec8f739"
    ),
  ]
)
