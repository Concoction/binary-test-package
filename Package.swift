// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription
import Foundation

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9008/"
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
        checksum: "1b4298575ca43332c0b8d771dbf6d56c4c0c9b4a0c059e511689e5a246fecdee"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "4e665d9386c6ba6b3f6d0bd78586ec9483c23aa0682da7bb5b73035072ca3a67"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "46b8c350a5269f67f5009a2990d11ca6e207523ec91a3abdccdd435a71d134fd"
    ),
  ]
)
