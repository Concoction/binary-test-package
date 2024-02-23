// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.10/"
let modules = ["ModuleA", "ModuleB", "ModuleC"]

let package = Package(
  name: "test-package",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  
  products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "Binder"]
    ) },

  targets: [
    .target(name: "Binder"),
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "4d15345b7ea4e122e9a00490dc203124e22281ad4c86a0b6abe8a76f0c606d7f"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "2431a4b14af7fc0e30170b9f09bdeaef1ce61d0059c3df5296ad0796f38b4a02"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "a7c3ae1aebcb93914d88eb7f15843154b7f036fcfb680a4aedd56541d0ebf019"
    ),
  ]
)
