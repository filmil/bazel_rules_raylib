load(":repositories.bzl", "dependencies")

def _raylib_impl(ctx):
    for mod in ctx.modules:
        if mod.is_root:
            dependencies()


raylib = module_extension(
    implementation = _raylib_impl,
)

