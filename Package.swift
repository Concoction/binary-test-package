// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9018/"
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
        checksum: "93050e17a9dc9d818f83f28f9d662ae898c08c53e6ca1e007e265b0ca940b718"
    ),
    .binaryTarget(
        name: "ModuleB",
        url: repo + "ModuleB.xcframework.zip",
        checksum: "37a6a342608d544be19ad4694e9d23d40d9f7e15e97a3a67dbfd3266eecaffa0"
    ),
    .binaryTarget(
        name: "ModuleC",
        url: repo + "ModuleC.xcframework.zip",
        checksum: "4983132c9de118643ffa868b42c3c1c60d2b27df9beaa91595d45cbe51ea55da"
    ),
  ]
)
