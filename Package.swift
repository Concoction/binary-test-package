// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.7/"
let modules = ["ModuleA", "ModuleB", "ModuleC"]

let package = Package(
  name: "test-package",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  
  products: [], /*modules.map {
      .library(name: $0, type: .static, targets: [$0]
               + []
    ) },*/

  targets: [
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "f0b2b4378fec0d94f555bdb300f54b403f81912c504863489e9f55ea6a807f16"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "3fd8285364f4171d8907f0a53332fe23c7c9b5d5f0fb05615199483387ce1ea5"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "7c014772201d04b3855361a4256bb65737924a2614df7e5f6ca30238d1b1b0ed"
    ),
  ]
)
