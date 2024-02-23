// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.6/"
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
        checksum: "84cdca0d932bb8350cfeb6baf77ba7820236d25f7a4b524ed3225e9e82a5b1c7"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "027f10497328fc0395a61b19f04add20c9ec549c73f51c5229fd10f88cecc601"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "7e1017cc72a230d9eefcb3367a3dd914ab26572bc1c6d674e2a59517b664e74f"
    ),
  ]
)
