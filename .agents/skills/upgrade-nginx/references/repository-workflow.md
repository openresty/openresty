# Repository Tools and Build Conventions

Paths below are relative to the OpenResty source root. Inspect the current checkout before use because parameters and side effects can change. This reference records conventions observed while authoring the skill.

## The no-pool-nginx Tool Used in Step 1

Run `../no-pool-nginx/bump-nginx-patch.sh OLD_VERSION NEW_VERSION` from the no-pool-nginx repository as the first upgrade operation. The arguments are the old patch version and target nginx version, both in `X.Y.Z` format and different from each other.

The current implementation:

1. Copies `nginx-OLD_VERSION-no_pool.patch` to `nginx-NEW_VERSION-no_pool.patch`, replacing version strings and the nginx integer version. It refuses to overwrite an existing target.
2. Checks sibling `../nginx` for tracked changes and verifies local `release-NEW_VERSION` and `master` references. It does not fetch missing references.
3. Checks out the target release in nginx and validates the patch with `patch -p1 --batch`.
4. Clears tracked nginx changes with `git checkout .` and switches to `master`. It does not restore the original branch or preflight untracked conflicts. Inspect untracked validation artifacts such as reject files separately.
5. After successful validation and cleanup, stages the new patch in no-pool-nginx and commits only that file with `git commit --only`. The script does not push.

Check that the current authorization covers its automatic commit and nginx working tree changes. For local edits without commit authorization, perform equivalent generation and validation without committing. A failed run may leave the target patch behind; inspect its contents and nginx state before retrying rather than deleting unknown files to satisfy preflight.

Switch no-pool-nginx to its own `master` before running the script. The script's internal branch switches affect the sibling nginx source repository; the no-pool commit remains on no-pool-nginx's current branch. Under the user's delivery requirement, step 7 pushes that commit directly to no-pool-nginx's remote `master`; OpenResty separately commits and pushes its own `master`. Neither repository creates a new version branch or PR.

OpenResty later integrates `patches/nginx/<target-version>/nginx-<target-version>-no_pool.patch`. The mirror script copies it to `nginx-no_pool.patch` in the bundle and adjusts the displayed version. Configure applies it with `patch -p0` when `--with-no-pool-patch` is enabled. Check paths, format, and contents when integrating; sibling validation with `-p1` does not establish bundle integration success.

## The nginx Packaging and Upload Tool Used in Step 2

From the OpenResty repository root, run `./util/package-nginx.sh NEW-VERSION`, using the same target nginx version as step 1. This is the user-selected step 2 entry point.

The current script:

1. Enters sibling `../nginx`, requires a `.git` directory, and runs `git reset --hard`, `git checkout master`, and `git pull --force`.
2. Removes same-named `nginx-NEW-VERSION/` and `nginx-NEW-VERSION.tar.gz` in OpenResty's parent directory. It clones the local nginx repository into a temporary source directory and runs `git co release-NEW-VERSION`. The `git co` command requires a Git alias in the environment.
3. Removes `.git`, `.hgtags`, and `src/mysql` from archive source, moves `auto/configure` to the source root, and creates `nginx-NEW-VERSION.tar.gz`.
4. Uploads the tarball with `scp` to the configured OpenResty server directory. It has no dry-run or package-only option and does not use the other repack tool's environment overrides.

Preflight must cover the nginx working tree, exact recreated targets, and upload destination. Record the source commit, archive layout, checksum, and upload result. A local archive does not prove upload success. On failure, preserve logs and inspect actual state instead of blindly rerunning resets, deletions, and uploads.

The mirror script later downloads the same-version nginx archive from OpenResty's download site. Verify the site serves the expected artifact after uploading, so an old cache does not hide an unsuccessful upload.

## Versions, Source, and the Bundle

| Entry point | Current responsibility | Usage notes |
| --- | --- | --- |
| `util/ver` | Prints the full OpenResty version | Step 3 sets `main_ver` to the target nginx version and `minor_ver` to `1`. The packaging script sources it. |
| `util/mirror-tarballs` | Downloads components, applies patches, and assembles the distribution | nginx comes from the OpenResty download site; components usually come from tagged archives. Patch order, conditions, and versions are in the script. |
| `util/configure` | Provides the configure entry point copied into the bundle | Edit this source and regenerate rather than fixing only `openresty-*/configure`. |
| `patches/nginx/` | Holds patches for individual core versions | Directory and filenames must match packaging selection. Older directories may still be required. |
| `util/get-tarball` | Retrieves and caches archives | Its `work/` cache checks only whether a file is nonempty; a cache hit does not redownload or verify the source. |

The default `make` target calls `util/mirror-tarballs`. That script deletes and rebuilds the target `openresty-<version>` directory and manipulates the documentation repository under `work/`. Inspect the whole script, exact paths, and existing contents before running it against a working directory.

`MIRROR_JOBS` controls parallelism. Some patch commands do not explicitly check failure, so inspect complete logs and reject files rather than relying only on the final exit status.

Inputs connecting steps 3 through 5:

- Record the old `main_ver` and actual source patch directory before editing `util/ver`. Step 4 may use a different user-specified old version. After editing, `./util/ver` should print `<target-nginx-version>.1`.
- Run `./util/upgrade-patches.pl OLD_VERSION NEW_VERSION` from the root in step 4. It stages newly copied files before replacing working tree versions with `sed`, so staged content may not reflect final changes. Check staged and unstaged diffs after migration and repairs.
- In step 5, run the full `./util/mirror-tarballs` from the root, fix source patches on failure, and rerun until packaging succeeds. Keep logs outside the recreated distribution. Resolve network and dependency errors according to their actual causes.
- The generated directory is `openresty-<target-nginx-version>.1/`; a complete run also generates its `.tar.gz` distribution archive. Check exit status, complete patch logs, and rejects rather than using the final successful message as proof of a successful run.

Packaging usually ignores uncommitted changes in sibling module repositories. Explain how local fixes enter integration tests, and verify release references are obtainable for final packaging. Existing caches can hide source or download problems. Do not overwrite a same-named published archive to impersonate a new version; use an isolated cache to verify provenance and record checksums.

## Existing Helper Scripts and Side Effects

| Tool | Current interface | Side effects and limitations |
| --- | --- | --- |
| `util/upgrade-patches.pl` | `OLD_VERSION NEW_VERSION` | Copies patches, replaces text and integer versions, and stages new files. It does not adapt semantics and may modify patches already in the target directory. |
| `util/update-ci-nginx-version` | `[--dry-run] VERSION` | Normal mode switches branches, pulls, edits, stages, commits, pushes, and creates PRs. There is no edit-only option. |
| `util/check-ci-nginx-version` | `[--merge] VERSION` | Queries PRs and CI by default. `--merge` uses administrative rebase merges, then switches and updates local repositories. |
| `util/repack-nginx-for-openresty` | `VERSION [OUTPUT]` | Exports a Git tag, creates an archive, and immediately uploads with `scp`. There is no package-only option. |
| `util/package-nginx.sh` | `VERSION` | The user-selected step 2 packaging and upload entry point. Includes hard reset, forced pull, same-name artifact deletion, and upload; verify exact targets first. |
| `util/dist-check` | Run `../util/dist-check 16` from the distribution | The user-selected step 6 test entry point. Uses sudo, removes installation contents, and starts test services; verify paths and ports first. |
| `util/fix-tests` | Run from the repository root | Uses the generated bundle to update expected output into `t/*.t_` for review without replacing original tests. |

### Cross-repository CI Tools

These tools' behavior is separate from step 7 delivery for OpenResty and no-pool-nginx. Those two repositories still push directly to `master`; do not invoke these tools to create PRs for them.

Both CI scripts extract `github.com/openresty/...` URLs from `util/mirror-tarballs`, locate sibling repositories from OpenResty's parent directory, and check origin and CI configuration. Consequently:

- Candidates are not the full upgrade inventory and do not include every externally owned component.
- Do not pass repository inventory or directory options that do not exist. Worktree layout must match the scripts' path assumptions.
- The scripts currently use `v2.1-agentzh` as the luajit2 baseline and `master` for others. This is implementation behavior, not verification of each actual default branch.
- The feature branch name is `update-ci-nginx-VERSION`. Check ownership, contents, and state before reusing an existing branch or PR from an earlier run.
- `--dry-run` does not pull, edit, commit, push, or create PRs. It checks candidates and tracked state rather than generating file diffs; inspect untracked conflicts separately.
- Review normal-mode replacements, especially intentional older-version matrices. Generated commit messages must also follow current repository conventions.
- CI query exit status `8` means pending; `1` means failures or query errors. Status `0` does not guarantee a PR or CI exists for every repository or that all required checks ran; inspect per-repository output.
- The query script accepts `NEUTRAL` and `SKIPPED`, which do not establish that required tests ran.

### The Alternative nginx Repack Tool

This documents another existing tool, not a replacement for step 2's user-selected `util/package-nginx.sh`.

`util/repack-nginx-for-openresty` defaults to sibling nginx's `refs/tags/release-VERSION` rather than uncommitted working tree source. `NGINX_REPO` overrides the source repository.

It uses `git archive`, moves `auto/configure` to the archive root, normalizes permissions, and creates a deterministic archive with GNU tar and gzip before uploading. `NGINX_UPLOAD_DESTINATION` overrides the destination and `SCP_BIN` overrides the transfer program. These overrides do not grant authorization or constitute a dry-run mode.

For local packaging only, use reviewable local export steps or add a real package-only mode within scope. Do not invoke an uploading default entry point or use a dummy transfer program to manufacture an upload-success result.

## Test and Build Entry Points

- Step 6 runs `../util/dist-check 16` inside the distribution named by `openresty-$(./util/ver)`. Evaluate `util/ver` from the repository root before entering the distribution. The name uses the full OpenResty version; `16` sets build parallelism.
- Current dist-check configurations include no stream, no Gzip/SSL/PCRE, threads, no-pool, and normal builds. The enabled script code determines actual compilation and runtime coverage. Its `--with-no-pool-patch` configuration verifies the optional patch not applied in step 5.
- The script writes `/tmp/nginx.conf`, cleans specified installation prefixes matching `/usr/local/openresty-*`, and installs with sudo. Some configurations start nginx on local port 80. Check existing files and services; inspect leftover test processes after failure without modifying unrelated nginx services.
- The maintainer section of `README.markdown` describes reproducing the bundle with `make` and lists basic tool dependencies.
- The Makefile's `test` target runs `prove -I../test-nginx/lib -r t`, assuming a sibling Test::Nginx checkout.
- `.github/workflows/linux-build.yml` documents dependency builds, bundle generation, configure/build/install, and prove. Use its current versions, options, and architectures; do not copy CI sudo installation or system configuration changes blindly onto a development machine.
- Linux CI places Test::Nginx under repository-local `test-nginx/` and runs `prove -Itest-nginx/inc -Itest-nginx/lib -I. -r t/`. Choose the entry point matching actual dependency locations.
- macOS and Windows workflows are in `.github/workflows/macos-build.yml` and `.github/workflows/windows-build.yml`.
- `t/000-sanity.t` uses `t/Config.pm` to test configuration and build results inside `openresty-<version>`. Prepare the correct distribution and dependencies first.
- `t/001-resolver.t`, `t/002-reuseport-close-unused-fds.t`, and `t/003-stream-proxy-protocol.t` are starting points for relevant regressions. Select tests according to changes and check for additional tests introduced in the current checkout.

`t/Config.pm` writes observed results into `t/*.t_` when tests finish, including failing runs. `util/fix-tests` also produces these files. Verify expected behavior before updating assertions; generated result files do not prove tests passed.

Read component repositories' own test documentation and explicitly select this run's nginx and Lua libraries. Record actual paths, core version, and necessary dynamic library information to avoid false results from system installations.
