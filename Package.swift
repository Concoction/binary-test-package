// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/Concoction/binary-test-package/raw/1.0.9029/"
let frameworks = ["ModuleA", "ModuleC", "ModuleB", /*"test-package"*/]

let package = Package(
    name: "test-package",


    products: ["ModuleA", "ModuleB", "ModuleC"].map {
      .library(name: $0, type: .static, targets: [$0, "test-package_Binder"]
    ) },


    targets: [
        .target(name: "test-package_Binder", dependencies: frameworks.map { .target(name: $0) }),
        .binaryTarget(
            name: "ModuleA",
            url: repo + "ModuleA.xcframework.zip",
            checksum: "edf79a5a72553f821ab6e216cd11387320ae091231f06c9508edd96362782bd3"
        ),
        .binaryTarget(
            name: "ModuleC",
            url: repo + "ModuleC.xcframework.zip",
            checksum: "a5c6936e688a35a282658f474ec0ce828a3722cc469a3658d83dcc3fdd76dbec"
        ),
        .binaryTarget(
            name: "ModuleB",
            url: repo + "ModuleB.xcframework.zip",
            checksum: "20ccaffd77479afff53ae84095f9250cbd7b0a9c312ab23407bdd1d9f015c5b3"
        ),
        .binaryTarget(
            name: "test-package",
            url: repo + "test-package.xcframework.zip",
            checksum: "8c1695653bceae970bfeade18e82173a1d4dd08c8c22f1df72e9e2bf11843fb6"
        ),
    ]
)
