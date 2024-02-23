// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9007/"
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
        checksum: "f31e6c08aa55d59a535f267cdde28982e458d980c52794573961c2293f7ad70c"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "92502f40d2d38320b4bba23cb0ff1b0f2d104e394134ef7fdaa288b76b4920ff"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "9bf02d7343b8ee7674a0814975e886ac72cbe3409ab9bae758573e0a9d29936c"
    ),
  ]
)
