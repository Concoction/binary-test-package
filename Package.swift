// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.1/"
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
        checksum: "09ef7d3bd32ad3620cf70946b679d1572e1d61ecb699975340b4f64c7b96d587"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "d61b18dc95815bf6a180d7071dc573887fcfb2607cc483f87c8efb10453cde87"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "37e35ad7fb608ae13063aa094d16fbec190c9215dfd584a3b510b855e8bb742b"
    ),
  ]
)
