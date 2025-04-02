load("@rules_nixpkgs_cc//:cc.bzl", "nixpkgs_cc_configure")

def _non_module_dependencies_impl(_ctx):
    pass


non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)
