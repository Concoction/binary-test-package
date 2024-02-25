// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9011/"
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
        checksum: "763c01d527b8859d96a08b9b568f5372d26642272189f04e690016616653f0c3"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "d0c97ad62d665f777b29e640a3d583894d18d682f8227c4dbd1b75eb8c103ff0"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "87d1c08af671c4971ed8189c6134f11b7ed00f8f954d510627a7e0f0575df1ac"
    ),
  ]
)
