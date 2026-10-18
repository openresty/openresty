---
name: check-ci-nginx-version
description: Check all component PRs created by the OpenResty update-ci-nginx-version workflow, diagnose and repair CI failures on their existing branches, and report every PR link and pass status after each execution. Use for following up CI nginx version bumps, not creating upgrade PRs, merging them, or releasing components.
---

# Check and Repair OpenResty CI nginx PRs

Find the component PRs produced by `update-ci-nginx-version`, check their current CI, and repair actionable failures. Every execution must end with a complete status summary, including when repairs, queries, or publication fail. Write and maintain skill files in English, following repository conventions.

## Scope

- Locate the OpenResty checkout and its `util/mirror-tarballs`. The companion skill is [update-ci-nginx-version](../update-ci-nginx-version/SKILL.md); its PR branches are `ngx-<nginx-version>`.
- Accept an optional nginx version in `X.Y.Z` form, PR inventory, or repository subset. Without a narrower request, discover all matching versions and component PRs rather than silently selecting the newest version or only the current checkout's PR.
- A request to check and repair includes necessary component changes, tests, commits, pushes to the existing PR branches, and targeted CI reruns. Honor check-only or local-only requests. Creating or editing this skill does not authorize running it.
- Repair the actual upgrade failure, including component source compatibility, tests, build helpers, CI configuration, or PR metadata when required by a failing check. Preserve the requested nginx version and intentional older-version support. Do not obtain green CI by reverting the bump, weakening assertions, suppressing errors, or disabling failing jobs.
- Do not merge, close, or replace PRs, push directly to base branches, force-push, release dependencies, change repository settings or secrets, or bypass approval requirements. Report externally blocked work. Post the summary in the conversation; PR comments and review requests require a separate request.

## 1. Build the Complete Inventory First

1. Extract and deduplicate `openresty` organization repositories from GitHub URLs in `util/mirror-tarballs`, ignoring commented-out lines. Read the file; do not execute the packaging script. Use URL repository names rather than archive names. Include supplied PR inventories even if a component has since left the packaging list.
2. Query GitHub for each component independently of local checkout availability or whether its current checkout has CI. Read-only PR inspection must still work when a sibling checkout is missing or dirty. Verify authentication and required tooling without displaying credentials.
3. Enumerate PRs across all states with complete pagination. Do not use `--limit 1`, rely on the default `gh pr list` limit, or stop after the first version. Match the full `ngx-X.Y.Z` branch name, then verify the head owner/repository, base repository/branch, target version in the diff, and creation-workflow evidence from the prior inventory or PR contents. A matching branch prefix or title alone does not prove provenance. Record uncertain matches without modifying them.
4. If the user identifies older PRs created by the existing shell helper, include its `update-ci-nginx-X.Y.Z` branches after the same verification. Do not rename them. The main inventory remains the companion skill's `ngx-X.Y.Z` PRs.
5. Keep one record per matching PR, including repository, nginx version, URL/number, PR state, head owner/repository/branch/SHA, base branch, check results and URLs, failed logs, repair commits, local verification, and blockers. Record repositories with no matching PR and any failed or incomplete discovery queries. A missing PR is not a passing component.

Finish initial inventory and status collection for all components before spending a long time repairing one. Continue independent components if another fails. Preserve the inventory and repair evidence for resumption; save a local progress file outside component commits when the batch needs durable state.

## 2. Evaluate CI at the Current PR Head

Fetch each PR's current head SHA and check data together where possible. Inspect both check runs and legacy commit statuses, plus expected workflows and required checks when accessible. Record workflow event, tested commit, run ID, attempt, and check URL. Distinguish head tests, PR merge-ref tests, and base-context checks such as `pull_request_target`; a green base-context job does not prove the upgraded component was built.

Use structured GitHub data where available. With `gh`, inspect supported JSON fields in the installed version; `gh pr view` can expose `headRefOid` and `statusCheckRollup`. Obtain failed GitHub Actions logs with `gh run view <run-id> --repo <owner/repository> --log-failed`. Follow external CI check URLs when the provider is not GitHub Actions. Keep tokens and secrets out of saved logs and reports.

Evaluate the latest relevant attempt for each job/context; retain old failures as history without counting superseded attempts as current failures. Do not mix checks from different head commits or treat a successful individual matrix job as a successful workflow. Re-read the PR head after collection; if it changed, refresh checks before making a pass claim.

| CI status | Meaning | Passed? |
| --- | --- | --- |
| PASS | All applicable required and relevant CI checks completed successfully for the current PR revision, with the expected component build/tests actually exercised. | Yes |
| FAIL | A relevant check failed, errored, timed out, was cancelled, or requires action; retain any other pending checks and the failure reason. | No |
| PENDING | Relevant checks are queued, running, waiting, or expected, with no known terminal failure. | Not yet |
| NO_CI | No checks ran, or the expected build/tests were entirely skipped or neutral. | Unconfirmed |
| UNKNOWN | Queries, pagination, logs, or revision/coverage information are insufficient to determine the result. | Unconfirmed |

`SKIPPED` and `NEUTRAL` are not evidence that a test passed. A documented optional or inapplicable job may be excluded with its reason, but a skipped required build/test prevents PASS. Investigate missing workflow triggers, path filters, permissions, and required contexts. Do not infer success from an empty result, a helper's exit status, local tests alone, or the fact that a PR was merged.

Report PR state independently from CI status. Inspect and report merged or closed PRs, but only repair open PRs. No matching PR is a repository discovery outcome, not a CI result; do not create one in this workflow.

## 3. Diagnose and Repair Failures

1. Read the failed job's full relevant logs, command, environment, and workflow at the tested revision. Identify the first causal error rather than only the final exit code. Distinguish nginx compatibility regressions, obsolete test expectations, CI script or metadata errors, missing dependencies, infrastructure failures, and failures already present on the base.
2. For an actionable failure, locate the sibling checkout and verify upstream and PR head identities, fetch and push destinations, repository instructions, status, and the exact PR commit. Use a clean isolated worktree at the submitted head if the user's checkout is dirty, on another task, or ahead with unrelated commits. Do not reset, clean, automatically stash, or overwrite existing work. Fetch a missing PR branch from its verified head repository, including fork heads.
3. Reproduce the failing command or the smallest equivalent test using CI's relevant nginx version, flags, dependency versions, and environment. Record actual binaries and source commits. If local execution is unavailable, use the remote logs and report the local verification limit; do not claim an unrun reproduction succeeded.
4. Make the smallest root-cause fix in the owning source, test, or CI files. Add a regression test for a behavior change where the project provides a suitable framework. Follow existing test and formatting conventions; number Test::Nginx blocks consecutively. Regenerate generated output from its source. For shared failures across components, validate the diagnosis and fix in each actual repository rather than blindly copying a patch.
5. Run the affected check and relevant regression tests, then review the complete diff and `git diff --check`. Stage only repair files and follow repository commit conventions. Use a focused subject such as `bugfix: fix <cause> with nginx <version>.` when appropriate; describe actual verification in the body.
6. Recheck the remote PR head immediately before publication. If it moved, fetch and inspect the new commits, integrate without discarding work, and rerun affected verification. Push only repair commits to the existing PR head branch, using an explicit destination. Do not create a duplicate PR or overwrite someone else's newer changes. Record the resulting SHA.
7. Query the PR again after the push and check the CI for that new revision. A successful push or local test means the repair was submitted, not that CI passed. Follow new actionable failures until checks pass or an observable blocker or pending run prevents further progress this execution.

For transient runner or network failures, a targeted rerun is appropriate after checking the current SHA and run attempt. Prefer failed jobs over rerunning unrelated successful jobs. Allow at most one rerun of the same unchanged failure per PR revision in one execution unless new evidence justifies another attempt. Do not add empty commits to trigger CI. For missing checks, fix an incorrect trigger or report a permission/approval blocker rather than skipping the check.

Continue making evidence-backed repairs; do not stop merely because one repair exposed another failure. Stop a repeated failure when no new diagnosis or permitted action can advance it, retaining logs and the precise blocker. Poll pending runs with bounded waits and continue other components; do not hold the entire execution indefinitely on queued jobs. Honor a user-supplied monitoring deadline. Before returning, refresh every discovered PR, including earlier successes; leave still-running checks PENDING for the next execution.

## Existing Shell Helper

Inspect `util/check-ci-nginx-version` before considering it. Its current implementation searches `update-ci-nginx-VERSION`, selects only one PR per component, depends on sibling checkout/CI discovery, and treats `NEUTRAL` and `SKIPPED` as success. It cannot establish the full inventory or pass criteria here. Its `--merge` option performs administrative merging and local branch synchronization; do not use it for this workflow. Query the verified PRs directly.

## Required Report After Every Execution

Always end with a complete snapshot in the user's language, including after partial repairs, authentication failures, or unavailable CI. Give the observation time and version/repository scope. Include every discovered PR, including unchanged successes and unmodified closed/merged PRs, with clickable links. Show at least:

| Component / nginx | PR link | PR state | Latest head | CI status | Passed? | Repair, verification, or next action |
| --- | --- | --- | --- | --- | --- | --- |

Use the status meanings above, translated for the user. Keep CI outcome separate from repair outcome: for example, a pushed repair with a running build is PENDING, not PASS. For failures or blockers, include the failing check/log link, root cause when known, repair commit if any, tests actually run, and remaining action. If fresh status cannot be queried, show UNKNOWN and label any last-known observation with its SHA and time.

Also list repositories with no matching PR, ambiguous matches, and discovery/query failures; explicitly state any inventory coverage gap. Summarize PR counts by PASS, FAIL, PENDING, NO_CI, and UNKNOWN, along with repaired PRs, merged/closed PRs, repositories without PRs, and blockers. Do not call the batch complete or all passing when any relevant result is missing, pending, failed, or unconfirmed. Verify final Git status and preserve unrelated user changes in every checkout used.
