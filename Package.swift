// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9014/"
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
        checksum: "61b32b199c0a914b63dd3dd6a5502cb5dc550dca75cda8b11fc4291c106ffb55"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "a3dd581f3c2cde609efb98bb20577fc3c49abab5efee66c17997177590bddf69"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "94806d344943091374d51f4646640d3c070bd7d6d7c77c7c013ad6cdb2f78e4a"
    ),
  ]
)
