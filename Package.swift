// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/"
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
      .library(name: $0, type: .static, targets: [$0]
               + []
    ) },

  targets: [
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "63789cbb283d9c5186ed6f7234225ea3b2e2d06736243e0cce3b7770199723f4"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "c3227013b81cf3ef8fe0b463b4acadffe3f092d148ee58bd2909fe1d38950ced"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "cedfb57d5f08684819921fa6df268f7a113c841401b162abc54735c25f76128d"
    ),
  ]
)
