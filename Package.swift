// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.4/"
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
        checksum: "a87fa559190afb6fb733ddbc3280b174513cd6f586342983e9982cf5e7806560"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "d84134392ee5597d965e9dd37258068711adb263dc92f25fc75b47949f7a6682"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "4f8929794e724296080105b4af61bcfb42f52ae4d210c368949fe3eb61083c68"
    ),
  ]
)
