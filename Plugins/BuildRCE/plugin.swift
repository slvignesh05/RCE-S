import PackagePlugin

@main
struct BuildRCE: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let script = context.pluginWorkDirectory.appending("echo_rce.sh")

        try """
        #!/bin/bash
        echo rce
        """.write(to: URL(fileURLWithPath: script.string), atomically: true, encoding: .utf8)

        try FileManager.default.setAttributes([.posixPermissions: 0o755], ofItemAtPath: script.string)

        return [
            .buildCommand(
                displayName: "Echo RCE",
                executable: script,
                arguments: [],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}
