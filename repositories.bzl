load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file", "http_archive")
load(
    "@bazel_tools//tools/build_defs/repo:utils.bzl",
    "maybe",
)
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:local.bzl", "local_repository")


def dependencies():
    http_archive(
        name = "raylib_src",
        urls = ["https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_linux_amd64.tar.gz"],
        integrity = "sha256-PZXvA9WzjfpVwKFsoSLTghNLB48OWycLUv5+rgVJwAA=",
        build_file = "//third_party/raylib:BUILD.bazel.raylib",
        strip_prefix = "raylib-5.5_linux_amd64",
    )
    maybe(
        http_archive,
        name = "io_tweag_rules_nixpkgs",
        sha256 = "480df4a7777a5e3ee7a755ab38d18ecb3ddb7b2e2435f24ad2037c1b084faa65",
        strip_prefix = "rules_nixpkgs-126e9f66b833337be2c35103ce46ab66b4e44799",
        urls = ["https://github.com/tweag/rules_nixpkgs/archive/126e9f66b833337be2c35103ce46ab66b4e44799.tar.gz"],
    )
    #git_repository(
        #name = "bazel_local_nix",
        #remote = "https://github.com/filmil/bazel_local_nix",
        #commit = "7b9c11000995e5ecbe08878084341f2650bf17ba",
    #)
    maybe(
        local_repository,
        name = "bazel_local_nix",
        path = "../bazel_local_nix",
    )
    maybe(
        repo_rule = http_file,
        name = "nix_portable",
        # This is x86_64 on Linux only.
        url = "https://github.com/DavHau/nix-portable/releases/download/v012/nix-portable-x86_64",
        sha256 = "b409c55904c909ac3aeda3fb1253319f86a89ddd1ba31a5dec33d4a06414c72a",
        executable = True,
        downloaded_file_path = "nix-portable",
    )

