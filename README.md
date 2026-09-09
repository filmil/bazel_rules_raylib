# rules_raylib

[![Publish to BCR](https://github.com/filmil/bazel_rules_raylib/actions/workflows/publish-bcr.yml/badge.svg)](https://github.com/filmil/bazel_rules_raylib/actions/workflows/publish-bcr.yml)
[![Publish](https://github.com/filmil/bazel_rules_raylib/actions/workflows/publish.yml/badge.svg)](https://github.com/filmil/bazel_rules_raylib/actions/workflows/publish.yml)
[![Tag and Release](https://github.com/filmil/bazel_rules_raylib/actions/workflows/tag-and-release.yml/badge.svg)](https://github.com/filmil/bazel_rules_raylib/actions/workflows/tag-and-release.yml)
[![Test](https://github.com/filmil/bazel_rules_raylib/actions/workflows/test.yml/badge.svg)](https://github.com/filmil/bazel_rules_raylib/actions/workflows/test.yml)

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

## Releasing and publishing

`Tag and Release` in `.github/workflows/tag-and-release.yml` runs monthly and
on `workflow_dispatch`.
It releases only when a commit landed since the last tag, computes the
version from the conventional-commit titles since that tag, and pushes it.
The release itself goes through bazel-contrib's `release_ruleset.yaml`:
it runs `bazel test //...` at the tag, has
`.github/workflows/release_prep.sh` build `bazel_rules_raylib-<tag>.zip` and
the release notes, and attests the archive's provenance.
A release then lists the archive and
`bazel_rules_raylib-<tag>.zip.intoto.jsonl`.

The same run publishes the release to [my Bazel registry][reg] as a pull
request, through `.github/workflows/publish.yml`, and then opens a pull
request against the Bazel Central Registry through
`.github/workflows/publish-bcr.yml`, with attested `MODULE.bazel` and
`source.json`, which is what the BCR presubmit verifies with `slsa-verifier`.
Only that publish attests: two attesting publishes would overwrite each
other's attestation files on the release.
The presubmit runs the tests in `integration/`, a module that depends on
rules_raylib the way a registry user does.

To check a release the way the BCR does, with the archive downloaded from
the release:

```
slsa-verifier verify-github-attestation \
  --attestation-path bazel_rules_raylib-<tag>.zip.intoto.jsonl \
  --source-uri github.com/filmil/bazel_rules_raylib \
  --builder-id https://github.com/bazel-contrib/.github/.github/workflows/release_ruleset.yaml \
  bazel_rules_raylib-<tag>.zip
```

[reg]: https://github.com/filmil/bazel-registry
