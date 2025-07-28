import PackagePlugin

@main
struct BuildRCE: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        // Use the packaged helper tool so it works on Windows/macOS/Linux
        let tool = try context.tool(named: "EchoRCE")
        return [
            .buildCommand(
                displayName: "Echo RCE",
                executable: tool.path,
                arguments: [],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}

