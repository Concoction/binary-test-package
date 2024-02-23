// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9009/"
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
        checksum: "f6e52a02c3c1d9e7d38440e56ad31a7e53cc2a2425253b0e6a7246e3a6b22d80"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "45f7cae09f363bd875db8bd5a8d88bc14b97c788b49ffe6aa4223b10443821b8"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "438a238df3c66066d9f709195f8b1572a92693917427b829b0c939dab3f929d5"
    ),
  ]
)
