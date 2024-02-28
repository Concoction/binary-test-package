// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9023/"
let modules = ["ModuleA", "ModuleB", "ModuleC"]

let package = Package(
  name: "test-package",


  products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


  targets: [
    .target(name: "test-package_Binder"),
    .binaryTarget(
        name: "ModuleA",
        url: repo + "ModuleA.xcframework.zip",
        checksum: "7a6ebf3dd9cc67ba051f67792b8ca29b47d85f731b9002ffea6109bde881324e"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "4cda45a5b47758cede4bcad8e80fcccb89c9a38f7a2a3e183c4f58b3fcffd307"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "cf48ee8b58e63cbca0e326a1313c44774aab8cf2a0cddda41bf7d8b18b90508f"
    ),
  ]
)
