// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9032/"
let modules = ["ModuleA", "ModuleC", "ModuleB", "test-package"]

let package = Package(
    name: "test-package",


    products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


    targets: [
        .target(name: "test-package_Binder", dependencies: modules.map { .target(name: $0) }),
        .binaryTarget(
            name: "ModuleA",
            url: repo + "ModuleA.xcframework.zip",
            checksum: "a184bf86751c180abe921f5338ee58cf955e19fee3c1a7c1a86fcc3d15c55005"
        ),
        .binaryTarget(
            name: "ModuleC",
            url: repo + "ModuleC.xcframework.zip",
            checksum: "524aab504f2a21d9961b664112713607c2541e271d80b75a806172663ff48b31"
        ),
        .binaryTarget(
            name: "ModuleB",
            url: repo + "ModuleB.xcframework.zip",
            checksum: "1521df03abb0ec78598d86369e3d5d0bf2edcdf8081003302a4b156862c775fa"
        ),
        .binaryTarget(
            name: "test-package",
            url: repo + "test-package.xcframework.zip",
            checksum: "902f5f9e5b57e920b4ec4acc5e3520e4ae9f7da40ffa7dae0c6350c35b22204d"
        ),
    ]
)
