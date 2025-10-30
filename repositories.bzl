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

