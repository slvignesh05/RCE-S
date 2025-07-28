import PackagePlugin

@main
struct BuildRCE: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let script = context.pluginWorkDirectory.appending("echo_rce.bat")

        try """
        @echo off
        echo rce
        """.write(to: URL(fileURLWithPath: script.string), atomically: true, encoding: .utf8)

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

