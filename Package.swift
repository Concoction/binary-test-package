// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/main/"
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
        checksum: "36e003bb5c4b6160d5da6a595f37685b06acfb7bdfbbf92b156dda24caf1090e"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "d5774e0883f6f7037ee7018823363d25da84923e409647c752f88787e0e7e255"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "c0f4574c4d2386e4144201d7372d6da74d55de0dd63b4baaab16e5abd512cbe6"
    ),
  ]
)
