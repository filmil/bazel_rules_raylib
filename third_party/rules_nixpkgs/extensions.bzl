load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

def _nixpkgs_impl(ctx):
    for mod in ctx.modules:
        if mod.is_root:
            rules_nixpkgs_dependencies(toolchains = ["cc"])


nixpkgs = module_extension(
    implementation = _nixpkgs_impl,
)
