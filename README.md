# rules_raylib

[![Publish to BCR](https://github.com/filmil/rules_raylib/actions/workflows/publish-bcr.yml/badge.svg)](https://github.com/filmil/rules_raylib/actions/workflows/publish-bcr.yml)
[![Publish](https://github.com/filmil/rules_raylib/actions/workflows/publish.yml/badge.svg)](https://github.com/filmil/rules_raylib/actions/workflows/publish.yml)
[![Tag and Release](https://github.com/filmil/rules_raylib/actions/workflows/tag-and-release.yml/badge.svg)](https://github.com/filmil/rules_raylib/actions/workflows/tag-and-release.yml)
[![Test](https://github.com/filmil/rules_raylib/actions/workflows/test.yml/badge.svg)](https://github.com/filmil/rules_raylib/actions/workflows/test.yml)

raylib rules for bazel

not hermetic.

## Prerequisites

### Ubuntu

```shell
bazel run //third_party/deps:ubuntu
```

### ChromeOS

```shell
bazel run //third_party/deps:chromeos
```

## Build

```shell
bazel build //...
```

## Test

```shell
bazel test //...
```

## Integration

```
cd integration && bazel build //third_party/luk707_games/examples/...
```
