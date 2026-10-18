---
name: update-ci-nginx-version
description: Update the nginx version used by CI in OpenResty organization repositories discovered from util/mirror-tarballs and checked out beside OpenResty. Refresh each repository's main development branch, create ngx-VERSION branches, and deliver separate pull requests. Use for CI version bumps, not nginx core upgrades or releases.
---

# Update OpenResty CI nginx Versions

Discover the OpenResty component repositories from `util/mirror-tarballs`, update their CI to the requested nginx version, and open one PR per changed repository. Keep skill instructions and UI metadata in English, following the existing repository skills.

## Inputs and Scope

- Require a target nginx version in `X.Y.Z` form. Ask if it is missing; read-only discovery can continue. Do not choose a version implicitly.
- Locate the OpenResty source checkout from the current directory or a supplied path. Its parent directory is the sibling checkout root unless the user supplies another location.
- Use the branch name `ngx-<target-version>`, for example `ngx-1.31.7`. `NEW-VER` means the nginx version, without the OpenResty `.1` suffix.
- A request to run the full workflow includes committing, pushing these feature branches, and creating PRs. Honor narrower requests such as discovery, previews, or local edits. Authoring or editing this skill alone does not authorize running that workflow.
- Limit changes to CI nginx inputs and directly related CI labels, download references, and build scripts. Core patches, distribution versions, releases, PR merges, and direct pushes to the main branch are outside this workflow.

## 1. Discover Repositories

Read the actual `util/mirror-tarballs` file. Extract and deduplicate repository names from GitHub URLs belonging to the `openresty` organization. Do not execute the packaging script for discovery.

From the OpenResty root, the current URL format can be extracted with:

```bash
perl -ne '
    next if /^\s*#/;
    while (m{https?://github\.com/openresty/([A-Za-z0-9_.-]+)}g) {
        print "$1\n";
    }
' util/mirror-tarballs | sort -u
```

Inspect context if the script changes how URLs are constructed. Use repository names from URLs, not archive output names: these may differ. Do not expand to every checkout under `../` or to repositories owned by other organizations.

For each candidate, locate `../<repository>` and verify the Git top level and upstream identity. Check fetch and push destinations separately; a directory name or a fork's `origin` alone is insufficient evidence. A fork may be the push destination, with the verified `openresty/<repository>` repository as the PR target. Record missing checkouts and identity mismatches rather than silently substituting another repository or cloning automatically.

Read each repository's applicable instructions, documentation, CI entry points, and recent commit conventions. Record its starting branch, full commit, and staged, unstaged, and untracked status. Find nginx inputs in GitHub Actions workflows, legacy CI configurations, local actions, and build scripts actually called by CI. Repositories with no CI or no configurable nginx version need no PR; record the reason.

Maintain a progress table with repository, path, base branch and commit, feature branch, changed files and old versions, verification, commit, PR URL, and outcome. Continue independent repositories when one is blocked, retaining enough detail to resume without repeating successful publication.

## 2. Refresh the Main Development Branch

Process repositories separately, preserving their own branch and build conventions.

1. Resolve the upstream main development branch from current remote metadata, for example `git ls-remote --symref <upstream-remote> HEAD`, and repository documentation. Do not assume it is named `main` or `master`. The current `luajit2` checkout uses `v2.1-agentzh`; verify rather than hard-code that exception.
2. Preserve all user changes. If staged or unstaged changes, conflicting untracked paths, or an unfinished Git operation would interfere, leave that checkout untouched and record it as blocked. Do not reset, clean, automatically stash, or discard work to switch branches.
3. Fetch the verified upstream and compare the local base with its remote branch. A local base containing unrelated commits is not a clean starting point for this PR. Do not publish those commits or rewrite them; use a clean isolated checkout when practical, otherwise record the blocker and continue other repositories.
4. Switch to the verified base branch and run `git pull --ff-only <upstream-remote> <base-branch>`. If the local branch is missing, first create it tracking the verified upstream branch. Stop this repository on divergence or pull failure rather than introducing an unrelated merge.
5. Verify the resulting commit matches the fetched upstream base and inspect status again, including any hook changes. Record the updated base commit before editing.

## 3. Create or Resume ngx-VERSION

Create `ngx-<target-version>` from the refreshed base, using `git switch -c` or the repository's supported equivalent.

Before creating it, check local and remote branches and query existing PRs for the exact upstream repository, head owner and branch, and base branch. If a matching branch or open PR exists, inspect its complete commits and base-to-head diff before resuming. Reuse it only when it belongs to this CI update and contains no unrelated work. Preserve existing commits; do not reset or force-push a colliding branch.

If a matching PR is already merged, verify the base's current CI configuration before treating the repository as complete. A closed unmerged PR or an unrelated branch collision requires resolution for that repository, not an automatic duplicate PR or branch overwrite.

## 4. Update the Effective CI Inputs

Trace each CI version input to the build command that consumes it. Update the intended current nginx test version wherever needed for consistent jobs, including `NGINX_VERSION`, workflow matrices such as `matrix.nginx`, literal nginx tarball URLs, reusable workflow inputs, or defaults in CI build helpers. Update associated job names and cache keys only when they encode that same version.

Preserve intentional historical-version coverage, compatibility thresholds, and unrelated dependency versions. Do not replace all version-shaped strings, collapse a multi-version matrix to duplicates, or alter an OpenResty version as though it were a standalone nginx version. For generated CI files, edit their source and regenerate with the repository's tooling.

Review the full diff per repository before committing. Verify that the changed value reaches every intended build, retained old versions have a reason, and referenced download or build inputs can supply the target version. Identify unavailable inputs as blockers instead of changing unrelated release infrastructure.

If CI already uses the target or needs no effective change, record the repository as unchanged. Do not create empty commits or PRs.

## 5. Verify, Commit, and Open the PR

1. Run `git diff --check` and the repository's relevant existing CI configuration or script checks. For changed build helpers, run the affected local build or focused tests when the environment permits. Report unavailable checks and their causes. A configuration-only bump does not require new tests that merely assert the version text.
2. Review status and stage only explicit task paths. Inspect the staged diff and run `git diff --cached --check`. Follow local commit conventions; absent a more specific convention, use `tests: update CI nginx to <target-version>.` Add a body describing the affected jobs and actual verification when useful. Do not include unrelated staged content or generated build artifacts.
3. Verify the entire outgoing commit list and base-to-head diff, including any resumed commits. Push only `ngx-<target-version>` to the verified writable remote. Never push this workflow's changes directly to the base branch or force-push.
4. Use the available GitHub tooling to query an existing PR again, then create one if none exists. Set the upstream repository, base, and head explicitly, including the fork owner when applicable. With `gh`, use `gh pr create --repo openresty/<repository> --base <base> --head <head> --title <title> --body-file <file>`. Describe the target version, affected jobs, retained historical coverage when relevant, and actual checks. Write multiline bodies to a temporary file.
5. Verify and record the resulting PR URL and head commit. Query CI checks using the actual PR URL or repository and PR number. Creating a PR and passing its CI are separate outcomes; report pending, failed, missing, or skipped checks accurately. Merging is outside this workflow.

For transient network failures, retry only a bounded number of times. After an uncertain push or PR creation result, query remote state before retrying to avoid duplicate publication. Authentication or permission failures require fixing the actual cause, not repeated retries. Keep successful repositories complete and report remaining failures individually.

## Existing Helper Limitations

Inspect the current helper implementations before reuse:

- `util/update-ci-nginx-version --dry-run VERSION` can supplement candidate discovery. It does not preview edits, refresh bases, or prove that a repository needs changing.
- Its current normal mode uses `update-ci-nginx-VERSION`, assumes base branches, performs broad replacements, and commits, pushes, and creates PRs before a separate review. It does not implement the required `ngx-VERSION` workflow. Follow the steps above directly rather than invoking normal mode unchanged or renaming branches after publication.
- `util/check-ci-nginx-version` currently searches for `update-ci-nginx-VERSION`, so it cannot establish CI status for these `ngx-VERSION` PRs. Query the recorded PRs directly. Its `--merge` option also performs administrative merges and is outside scope.

## Completion

Report the target version and per-repository outcomes: changed files and commits, PR links, completed and pending checks, unchanged or inapplicable repositories, and blockers. Verify final Git status against the initial inventory so user changes remain intact. Do not treat missing repositories, blocked updates, or a zero helper exit status as a complete batch.
