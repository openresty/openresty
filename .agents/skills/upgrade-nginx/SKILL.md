---
name: upgrade-nginx
description: Upgrade the OpenResty nginx core to a user-specified version, coordinating patch migration, related repository compatibility fixes, CI version updates, packaging, and integration tests. Use for maintainer workflows spanning one or more repositories, rather than end-user installation upgrades, standalone service deployment, or general website edits.
---

# Upgrade the OpenResty nginx Core

Adapt OpenResty to the requested nginx version and deliver reviewable repository changes with traceable verification results. Reuse existing tools and resolve compatibility issues using the actual source and build results. Write and maintain all skill files, including references and UI metadata, in English.

## Inputs and Scope

- Required: a target nginx version in `X.Y.Z` format. If missing, ask for it; read-only discovery can continue, but do not select the latest version and start editing.
- Optional: the OpenResty repository path, related repository paths or inventory, old patch baseline, build platform, dependency paths, test scope, and delivery actions. Step 3 sets the OpenResty version to `<target-nginx-version>.1`.
- Locate the OpenResty repository from the working directory and discover related repositories from packaging configuration. Verify repository identities and directory layout rather than relying on directory names.
- Read the old nginx, OpenResty, and component versions from current files. Do not hard-code versions, commits, or repository counts in this skill.
- The user explicitly requires OpenResty and no-pool-nginx to commit and push directly to `master` after tests pass, without new version branches or PRs. Carry this requirement into full workflow runs without asking again. Honor requests limited to specific stages or local work. This instruction does not extend to other repositories; tagging or deployment needs its own explicit authorization.
- Include website, system package, or other release repositories only when requested or when a direct dependency requires them. Do not upgrade every related component to its latest version.

## Before Starting

1. Read each target repository's `AGENTS.override.md` or `AGENTS.md`, relevant documentation, build configuration, and CI configuration. Record Git status, the current branch, and the full starting commit.
2. Read [Repository Tools and Build Conventions](references/repository-workflow.md), then inspect the scripts in the current checkout before using them. The reference is a navigation aid; the current implementation determines actual behavior.
3. Verify the target release source or tag and its commit. Compare source and release notes between the old and target versions. Report missing source or tags rather than substituting a nearby version.
4. Include sibling repositories `../no-pool-nginx` and `../nginx`, which its script uses. Classify other modules and version references as needing source adaptation, CI updates only, no changes, or further investigation. Start discovery with `util/mirror-tarballs` and add user-named repositories and actual dependencies.
5. Preserve existing tracked, staged, and untracked user files. Use dedicated worktrees when isolation is necessary, keeping sibling layouts compatible with build scripts. Do not automatically reset, clean, stash, or switch branches in working trees containing user changes.
6. Verify the push remote, `master`, and starting commit separately in OpenResty and `../no-pool-nginx`. Switch each repository to its own `master` before editing or running a script that commits, while preserving user changes. Check local and remote history; use verified fast-forward operations to update the baseline without resetting or discarding changes. No new version branch is required.

## Upgrade State

Once an actual upgrade starts, record state at the user-specified location, or default to `work/upgrade-nginx/<target-version>/STATE.md` in OpenResty. Record only actual information. Do not create upgrade state merely to author or edit this skill.

Keep at least:

- The target and old nginx versions, target source commit, and chosen OpenResty version.
- The requested scope and authorized delivery actions.
- Each repository's path, branch, starting and current commits, uncommitted diff identifier, and current stage.
- The push remote, local `master` commit, remote `master` commits before and after pushing, and push result for both OpenResty and no-pool-nginx.
- Patch decisions, build inputs, binary paths, test commands and results, logs, and artifact locations.
- Failures, open questions, and next actions. Record PRs, tags, and upload destinations only when those actions actually occur within scope.

A repository progress table can use these columns, adjusted as needed:

| Repository | Path / branch | Starting / current commit | Changes and uncommitted diff identifier | Verification | Next action |
| --- | --- | --- | --- | --- | --- |

Update state after a stage succeeds or fails. Before resuming, verify the target version, Git status, diffs, and existing external artifacts; the state file does not replace live checks. Rerun affected verification when source, patches, or build inputs change. Preserve successful results and resume failed work without duplicating commits, pushes, or uploads.

## Step 1: Upgrade the no-pool-nginx Patch

After preflight, the first upgrade operation is running `bump-nginx-patch.sh` in sibling `../no-pool-nginx`. Next package and upload the nginx tarball in step 2, then adapt OpenResty patches and other repositories.

1. Determine the old no-pool patch baseline and the target nginx version. Prefer the user's baseline; otherwise use existing patches and the upgrade baseline. Verify `nginx-<old-version>-no_pool.patch` exists rather than assuming its version matches `util/ver`.
2. Ensure no-pool-nginx is on its `master`. Inspect its documentation, status, and current script, plus the sibling nginx repository's status, `release-<target-version>`, and local `master`. The script creates a patch, validates it in nginx, clears tracked validation changes there, returns that nginx repository to `master`, and commits the new patch on no-pool-nginx's `master`. Preflight and authorization must cover these actions.
3. Substitute the actual versions into this example and run it from no-pool-nginx:

   ```bash
   cd ../no-pool-nginx
   ./bump-nginx-patch.sh 1.31.3 1.31.4
   ```

   Here `1.31.3` is the old patch version and `1.31.4` is the target; both are examples. Because the script commits automatically, a local-edit-only request without commit authorization requires equivalent generation and validation steps without committing. Continue other authorized work.
4. Inspect `nginx-<target-version>-no_pool.patch`, validation logs, the actual diff, and the commit result. Record the artifact and commit as applicable, and verify the final nginx working tree. If the script fails or the target patch exists, inspect the state before repairing or reusing it; do not overwrite it or blindly rerun.
5. Continue to step 2. Later OpenResty patches and build inputs must incorporate this result, with verification of `--with-no-pool-patch`; generating the sibling patch alone does not complete integration.

## Step 2: Package and Upload the nginx Tarball

Return to the OpenResty repository root after step 1 and use the user-specified entry point:

```bash
./util/package-nginx.sh NEW-VERSION
```

Replace `NEW-VERSION` with the target nginx version used in step 1.

1. Inspect the current script and sibling nginx Git status. The script performs a hard reset, switches to `master`, pulls, and recreates sibling `nginx-NEW-VERSION/` and `nginx-NEW-VERSION.tar.gz`. Verify these exact targets are safe to recreate and contain no changes or files that must be preserved.
2. Verify `release-NEW-VERSION` is available, the script's `git co` alias works, and the upload destination and transfer environment match the request. The script requires `../nginx/.git` to be a directory; a standard Git worktree is not an equivalent input.
3. Check the tarball path, source release and commit, archive layout, and checksum. Output currently resides in OpenResty's parent directory. Verify upload success before continuing. If the upload result is uncertain, inspect the remote state before rerunning the entire script.
4. Record packaging and upload results. Honor existing authorization to perform this step. If the current request explicitly limits work to local operations, package locally and record uploading as pending; do not report an upload that did not happen.

Use `util/package-nginx.sh` for this step rather than substituting `util/repack-nginx-for-openresty`. Verify each tool's source processing, artifacts, and upload configuration independently.

## Step 3: Update the OpenResty Version

After step 2, edit `./util/ver` in OpenResty:

- Record the original `main_ver` before editing as a baseline for step 4. If the user specifies another old patch version, verify that its source patch directory exists and is suitable.
- Set `main_ver` to the target nginx version used in the earlier steps.
- Set `minor_ver` to `1`, preserving the existing version composition and output logic.
- Run `./util/ver`, verify it prints `<target-nginx-version>.1`, and inspect the diff.

## Step 4: Migrate the OpenResty nginx Patches

From the OpenResty repository root, run:

```bash
./util/upgrade-patches.pl 1.31.6 1.31.7
```

These versions are examples: the first argument is the old patch version and the second is the target nginx version. Use the baseline recorded before step 3, or a valid user-specified baseline; do not infer the old version from the updated `main_ver`.

1. Verify `patches/nginx/<old-version>/` exists and contains the source patches. Inspect the target directory before running the script to preserve existing repairs and user changes.
2. Run the script to migrate patches into `patches/nginx/<target-version>/`. It copies files, replaces version text and integer versions, and runs `git add`, but does not commit. Inspect both working tree and staged diffs.
3. Check target filenames, contents, and packaging references, and reconcile the no-pool patch with step 1. Script success means only that initial migration completed; continue to step 5 for verification and repair.

## Step 5: Run mirror-tarballs and Repair Patches

From the OpenResty repository root, run:

```bash
./util/mirror-tarballs
```

1. Verify `util/ver` prints the target version, target patches exist, the nginx archive uploaded in step 2 is accessible, and the generated directory can be rebuilt without losing valuable content. Save complete stdout, stderr, and the exit status outside that directory so retries preserve logs.
2. For patch failures, locate the patch and hunk in the logs. Compare target nginx source, earlier applied patches, and reject files, then fix the source patch under `patches/nginx/<target-version>/`. Do not repair only the generated bundle.
3. After each fix, rerun the complete `./util/mirror-tarballs` command against regenerated source to verify ordering and cumulative results. Continue diagnosing, repairing, and rerunning until the script succeeds. Do not stop after one failed run or after validating a single patch.
4. Resolve download, dependency, permission, and documentation-generation failures according to their actual cause. Do not edit unrelated patches, skip stages, or swallow errors to produce success. If an environmental requirement cannot be satisfied, preserve logs and record the blocker explicitly.
5. Success requires a complete run with exit status zero, no ignored patch failures in the logs, and no unresolved rejects. Some patch commands do not immediately stop the script, so inspect results even after exit status zero. Preserve the script's exit status when piping logs.
6. Inspect `openresty-<target-nginx-version>.1/`, its distribution tarball, patch diffs, and staging state. Record results. This step verifies patches applied during packaging; optional patches such as no-pool applied during configure still need build verification.

## Step 6: Test the Distribution with dist-check

After step 5 succeeds, enter the generated distribution from the OpenResty repository root and run:

```bash
cd "openresty-$(./util/ver)"
../util/dist-check 16
```

The directory is `openresty-NEW-VER`, where `NEW-VER` is the full OpenResty version printed by `./util/ver`, namely `<target-nginx-version>.1`. The argument `16` sets build parallelism.

1. Verify this is the distribution generated in step 5. Inspect the current `util/dist-check` and environment. It uses sudo, cleans and installs several configurations into fixed prefixes, writes `/tmp/nginx.conf`, and starts and stops test nginx processes. Check paths and ports while preserving existing files and services.
2. Run the complete `../util/dist-check 16` from that directory. Save stdout, stderr, exit status, and logs for failing configurations. Record effective dependency paths, including `OPENSSL_PREFIX` when used, and actual test binaries to avoid testing stale installations.
3. If configuration, compilation, or runtime tests reveal patch problems, fix source patches, repeat step 5 to regenerate the distribution, and rerun step 6. For component problems, fix the owning repository and verify those changes enter the new bundle. Do not repair only generated files.
4. Record configuration results after a complete successful run. Report specific failures or missing environmental requirements rather than treating partial coverage as success. Inspect and stop any test nginx processes left running, limiting cleanup to this run's resources.

## Step 7: Commit and Push Both Repositories Directly to master

Once the first six steps and other necessary checks pass, follow the user's explicit instruction to commit and push OpenResty and no-pool-nginx directly to their respective `master` branches, without new version branches or PRs. The automatic no-pool commit in step 1 does not eliminate its push requirement.

1. Compare Git status, working tree diffs, and staged diffs against the initial state. Identify only upgrade files: normally `util/ver`, target patches under `patches/nginx/<target-version>/`, and packaging configuration, tests, or documentation actually changed for the upgrade. Exclude generated directories, archives, logs, temporary files, and unrelated user changes.
2. Stage explicit paths with `git add -- ...`. The migration script edits versions after staging, and steps 5 and 6 may add repairs, so stage final content again rather than committing an outdated index. Run `git diff --cached --check` and review the staged diff to ensure the intended commit matches tested source. Preserve unrelated staged changes by committing only this task's paths without including them.
3. Ensure OpenResty is on `master` and commit using repository conventions. A suitable subject is `feature: update openresty to <target-nginx-version>.1.` For nontrivial changes, explain the core version, patch adaptations, and actual test results in the body, following punctuation and line-wrapping conventions. Report only checks that actually ran.
4. In no-pool-nginx, verify the step 1 commit is on `master`, contains the target patch, and excludes unrelated changes. Reuse that commit. Commit any necessary later repairs separately and rerun affected verification. Handle other in-scope repositories under their own authorization, keeping repositories separate.
5. Verify each push remote, remote `master`, and the complete outgoing diff and commit list. Include only intended delivery content. If resuming work with commits on an earlier version branch, inspect and integrate necessary upgrade commits into `master` without losing commits or rewriting user history. Rerun affected checks if integration changes source.
6. Push local `master` to remote `master` with an explicit remote in each repository. For example, after verifying the remote is `origin`, run `git push origin master:master`. Do not force-push or skip hooks. On rejection, inspect remote changes and the cause, resolve necessary conflicts, rerun affected checks, and retry. Preserve existing commits after a push failure rather than creating duplicates.
7. Verify both remote `master` branches contain the intended commits and unrelated local user changes remain intact. Record and report final commits, remote `master` commits, and push results. Query remote state before retrying an uncertain result. If only one repository succeeded, report the other as pending. Do not create PRs, add tags, or deploy as part of this step.

## Patch Adaptation Principles

- Inventory patches in actual application order and under their version conditions, including optional configure-time patches. Classify each as unchanged, needing rework, already included upstream, or obsolete, with supporting evidence.
- Apply patches sequentially to clean target source. Record failures, fuzz, offsets, and rejects, checking placement and semantics. Generate replacement patches from reproducible clean-source differences.
- Compare upstream implementations and callers before removing an upstreamed patch or changing its application conditions. Preserve patches and paths still required by older versions.
- Trace changes affecting HTTP, stream, upstreams, resolver, SSL callbacks, process lifetime, and memory lifetime. Check changed structure fields, function signatures, exported symbols, version macros, and compile conditions beyond the default build.
- Update necessary source references. Generate bundle files such as `configure` from their source and tooling rather than treating edits to a generated directory as the repository fix.

## Related Repositories and CI

1. Start with contracts among `lua-nginx-module`, `stream-lua-nginx-module`, `lua-resty-core`, and core patches, then expand according to actual changes. Adjust LuaJIT, OpenSSL, and PCRE only when compatibility or user requirements demand it.
2. Check C and Lua FFI declarations, symbols, layouts, return values, and version conditions together. Trace creation, use, failure, and cleanup when changing callbacks or connection behavior.
3. Fix compatibility in component source repositories and add minimal regression tests that trigger the actual issue. Verify version conditions and existing compatibility coverage when older nginx versions remain supported.
4. Discover CI version references from each repository's configuration. Check download URLs, environment variables, matrices, and build commands after edits. Preserve intentional older-version coverage and thresholds instead of replacing every version indiscriminately.
5. Use `util/update-ci-nginx-version --dry-run VERSION` only for candidate discovery; it does not preview file diffs. Normal mode commits, pushes, and creates PRs, so it cannot implement a local-edit-only request. Edit verified CI files directly in that case.
6. Ensure local module fixes actually enter the tested bundle. Archives downloaded from tags usually omit local changes. Record local assembly or overlays and their source diffs, and verify configure selects the correct module directories. After release references point to obtainable component versions, verify the real packaging path too.

## Build and Verification

Choose coverage according to risk, preferring the dependencies, options, and test entry points in current CI:

- Check patch application and changed files first, then run new or modified tests and relevant subsystem regressions.
- Distinguish locally assembled builds from release-archive builds. Record every input commit and identify uncommitted inputs with diffs or file checksums.
- Build and install the generated bundle in separate directories. Check `nginx -V`, the actual core version, compile options, and dynamic library paths. The displayed OpenResty version alone does not prove the internal nginx version.
- Record actual Test::Nginx, nginx binary, and Lua library paths to avoid testing system nginx or stale `resty.core`. Consult the reference and each repository's current test configuration for commands.
- Cover relevant HTTP/stream, SSL, debug, thread, and optional module combinations. Check both sides of conditional compilation. Report unavailable platforms or dependencies as unverified.
- Update version and generated-output expectations in tests such as `t/000-sanity.t` only from correct new results. Review diffs rather than accepting all output from a failing run. Number Test::Nginx blocks with consecutive integers.
- Check diffs, unexpected staging, generated files, and preserved user changes in every target repository. Clean up only confirmed resources from this test run, retaining logs needed to diagnose failures.

Compilation, a zero script exit status, and successful CI each establish only the corresponding check. Missing PRs or checks, skipped or pending jobs, and unavailable dependencies do not establish successful verification.

## Authorized Delivery

Follow authorized stage actions: the no-pool-nginx `master` commit in step 1, the tarball upload in step 2, and commits and direct `master` pushes for both repositories in step 7 after verification. Perform other release actions only within their authorization and after relevant review and checks. For local-only work, deliver local results and list pending actions rather than stopping adaptation for a future permission need.

- Follow each repository's commit conventions and include only task files. OpenResty and no-pool-nginx push directly to `master` under the user's explicit instruction and do not create PRs.
- Explain the target version, behavior changes, repository dependencies, and verification in commit bodies and upgrade state.
- Record source tags or commits, archive layout, output path, and checksum before uploading. Take destinations from current configuration and the request rather than hard-coding server details in this skill.
- Query actual state before retrying an uncertain upload or push. Do not report partial success as a complete release.
- Merging is a separate action. Ordinary merge authorization does not imply permission to bypass approvals or branch protection. `util/check-ci-nginx-version --merge` uses administrative merging; inspect its semantics and authorization before use.

Use a single primary agent by default. When the user requests parallel work, split independent repositories or tests into separate directories. Keep patch baselines, build inputs, and integration conclusions coordinated by the primary agent.

## Completion Report

Briefly report the target version, repository changes, tested source and binaries, passed and failed checks, unverified items, and paths to state and key artifacts. Report commits, PRs, uploads, and merges only when they actually occurred.

For a full workflow, report push remotes, final commits, and remote `master` verification for OpenResty and no-pool-nginx separately. Step 7 is complete only after both repositories have successfully pushed `master`.

Local adaptation is complete when version references and patches agree, the changes enter the build, required verification finishes, and diffs are reviewable. If dependencies are unpublished, builds fail, or necessary checks have not run, identify the incomplete stage and cause explicitly.
