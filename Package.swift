// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9006/"
let modules = ["ModuleA", "ModuleB", "ModuleC"]

let package = Package(
  name: "binary-test-package",
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
        checksum: "e1074b247fb63bf76053ab800dee710f919bfbf19439af2e2ed92387e2913d6b"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "8c467e49b72b7493f26cccae56d081a2ef36c702685ff886d24858994c46004c"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "b8b1699b76fffd5cdc4df82fb9ba5477953b42e464951b1a15ce0df3abbe4f63"
    ),
  ]
)
