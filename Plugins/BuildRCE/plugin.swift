import PackagePlugin

@main
struct BuildRCE: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let tool = try context.tool(named: "BuildRCE")
        return [
            .buildCommand(
                displayName: "Executing BuildRCE Plugin",
                executable: tool.path,
                arguments: [],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}
