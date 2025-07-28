import PackagePlugin

@main
struct BuildRCE: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let tool = try context.tool(named: "EchoRCE")
        return [
            .buildCommand(
                displayName: "Echo RCE by w3shi",
                executable: tool.path,
                arguments: [],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}

