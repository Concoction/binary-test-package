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
  
  products: [],

  targets: [
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "bc9eb370e3929cbd4406bf2ef3de7bbdb9d5938216c398931b2405552bdbafd8"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "12b3bc5b5dfaa387f04f7acecd3150d9771bf17e2685aed25fc2dcd3673f6e37"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "f797a6d0640f0039e76e09e192e8158aa8c6ac8f6f4f9048c80b535446bc2b72"
    ),
  ]
)
