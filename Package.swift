// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "rce-s",
    targets: [
        .executableTarget(
            name: "EchoRCE"
        ),
        .plugin(
            name: "BuildRCE",
            capability: .buildTool(),
            dependencies: ["EchoRCE"]
        )
    ]
)
