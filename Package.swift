// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "RCE-S",
    products: [
        .library(name: "Jinja", targets: ["Jinja"])
    ],
    targets: [
        // Helper tool the plugin will run (prints "rce")
        .executableTarget(
            name: "EchoRCE",
            dependencies: []
        ),
        // Your normal target (anything minimal is fine)
        .target(
            name: "Jinja",
            dependencies: [],
            plugins: [
                .plugin(name: "BuildRCE")
            ]
        ),
        // Build tool plugin that invokes EchoRCE during build
        .plugin(
            name: "BuildRCE",
            capability: .buildTool(),
            path: "Plugins/BuildRCE"
        )
    ]
)
