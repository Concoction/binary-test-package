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
        checksum: "9c6b9377f05d3d57442978feca9d00a61d1e8cd1c658cbff43614a1639c03b37"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "02623652f7a8b61713a3e51c5c00e73d298ed686619131e9b5cced11d5142a98"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "ce669dff58b7c80abff5e09a745035863e655798b08d44539039a0994c05d5b0"
    ),
  ]
)
