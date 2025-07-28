// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "RCE-S",
    products: [
        .library(name: "Jinja", targets: ["Jinja"]),
    ],
    targets: [
        .target(
            name: "Jinja",
            plugins: ["BuildRCE"]
        ),
        .plugin(
            name: "BuildRCE",
            capability: .buildTool(),
            path: "Plugins/BuildRCE"
        )
    ]
)
