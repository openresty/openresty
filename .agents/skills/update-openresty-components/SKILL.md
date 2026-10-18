---
name: update-openresty-components
description: Update all components in OpenResty's util/mirror-tarballs. Reuse existing OpenResty tags when later changes do not affect functionality; release new tags for unreleased functional code, build, or installation changes. Update third-party components to their latest upstream tags. Use for bundle component refreshes, not nginx CI version bumps.
---

# Update OpenResty Bundle Components

Inventory every active component source in `util/mirror-tarballs`, resolve its latest upstream release tag, and update the bundle's source references. For components owned by `openresty`, decide whether post-tag changes affect functionality: reuse the tag for nonfunctional changes, and release a new version tag when functional changes need inclusion. Report every component and any incomplete work. Maintain skill files in English, following repository conventions.

## Scope and Delivery

- Locate the OpenResty checkout from the current directory or a supplied path. Discover component checkouts under its parent directory or supplied paths, verifying repository identities rather than relying on directory names.
- The default scope is all active components in `util/mirror-tarballs`, including third-party sources. Do not reuse a CI-only repository inventory that filters out other organizations. Honor a requested subset or discovery-only run.
- A full update run includes necessary release preparation, component release commits, and creation/publication of new OpenResty component version tags for functional changes, followed by bundle pin updates. Honor discovery-only and local-only requests. Authoring or editing this skill does not authorize executing an update or publishing tags now.
- Follow each component's release and branch workflow for release commits; do not bypass reviews or branch protection. Committing/pushing the OpenResty bundle changes, creating or merging PRs, hosted release pages, and uploading tarballs require their own requested scope. Do not infer direct pushes to `master` from a generic push request.
- Nonfunctional post-tag changes do not block a component update or require a new tag merely because they are outside test/CI paths. For functional changes, prepare and validate a new version tag as part of the workflow instead of stopping at a generic request to wait for an upstream release. Report a blocker only when a concrete release requirement, test failure, permission, review, or unresolved impact prevents progress. Never move or overwrite an existing published tag, or substitute an untagged branch/commit for a release tag.
- For third-party components, use their latest published upstream tags; do not create tags or releases in those repositories.
- Read applicable instructions, packaging documentation, CI/build configuration, Git status, current branch, and starting commit before editing. Preserve staged, unstaged, and untracked user files; use isolated worktrees when necessary. Fetching metadata does not require switching or pulling every sibling checkout.

## 1. Build the Source Inventory

Read the complete current script, including conditional source blocks and indirect variables such as `ver="$main_ver"`. Do not execute or source the packaging script to discover components: it deletes and rebuilds generated output and modifies a documentation checkout.

For each active component, record:

- Canonical upstream owner/repository or other source, current version expression and resolved value, tag spelling, and assignment location.
- Source URL, downloaded archive name, extracted top-level directory, final bundle directory, applied patches, and configure/install consumers.
- Local checkout or temporary metadata checkout, verified fetch remote, main development branch, and current pinned source commit where resolvable.

Distinguish components from packaging tools, commented-out downloads, and auxiliary documentation inputs. Account for these categories explicitly rather than treating every URL or every `ver=` assignment as a component. Do not add unrelated dependencies merely because they appear in CI.

The current script illustrates mappings that must be rediscovered from its actual contents:

- `openresty/ngx_http_redis` is downloaded into a `redis-nginx-module-<version>` archive/directory.
- `lua-nginx-module`, `stream-lua-nginx-module`, and `luajit2` have bundle names such as `ngx_lua`, `ngx_stream_lua`, and `LuaJIT`.
- Tag prefixes differ: some URLs add `v`, while `lua-cjson`, `ngx_postgres`, and third-party sources may use other spellings.
- nginx is downloaded from OpenResty's site using `main_ver` from `util/ver`, with version-specific patches. It is still an inventory item, not an ordinary independent `ver=` bump.
- `nginx.org` is an auxiliary documentation checkout, not a version-pinned component archive. Report its role without inventing a component tag pin.

Do not hard-code component names, counts, current versions, or the organization list into an update implementation.

## 2. Resolve the Latest Tags from Upstream

For every component, query its actual upstream tags and main development branch using fresh remote data. Local tags and `origin/HEAD` may be stale; missing local checkouts must not silently remove components from discovery. Use a temporary metadata checkout when needed, without overwriting user repositories. Exhaust pagination when using hosted APIs.

Choose the newest actual release tag according to that project's versioning and release conventions. Preserve exact tag spelling and resolve annotated tags to their source commits. Record the tag name, tag object where applicable, peeled commit, upstream URL, and observation time.

- Do not use the first API result, lexical maximum, tag creation date alone, or GitHub's latest-release endpoint as a universal definition of the latest tag.
- Handle numeric versions, optional `v` prefixes, final releases versus `rc`/beta versions, and dated versions explicitly. Existing bundle pins include prereleases; do not silently impose a stable-only policy. A final release sorts after its prereleases of the same version.
- Exclude aliases and non-release markers such as LuaJIT's moving `v2.1.ROLLING` or a tag named `empty` when the project identifies them as such. Do not replace a dated release pin with a floating alias just because Git's version sort places it first.
- Verify that the selected tag belongs to the component's intended release lineage. If tag ordering or release-channel intent is ambiguous, record the candidates and resolve that component's ambiguity instead of guessing or silently choosing an older release.
- Do not downgrade a pin that is ahead of published tags or replace a missing tag with branch HEAD. Missing tags, moved tag identities, incomplete history, or inaccessible upstreams are explicit blockers.

Recheck selected tag identities and relevant branch heads before final verification; if upstream changes during the run, refresh the affected selection and functional-impact assessment instead of mixing observations.

## 3. Assess the Functional Impact of OpenResty Post-Tag Changes

Classify ownership using the canonical source referenced by the packaging script, verified against upstream identity. A similarly named local fork does not change whether a component belongs to the `openresty` organization.

For each OpenResty component, resolve the fresh main development branch from remote metadata and project documentation; do not assume `master` or `main`. Record both the candidate latest tag's peeled commit and the branch head SHA. Require the tag commit to be an ancestor of that head. Divergent branches, incomplete/shallow history, or an uncertain release branch require investigation; an empty or failed comparison is not proof of compliance.

Inspect the commits in `<latest-tag-commit>..<development-head>`, including merged commits and merge-resolution changes, and the final tag-to-head diff. Read the changed hunks and their consumers. Commit subjects, extensions, and paths alone do not determine functional impact. Account for complete reverts: a change with no remaining functional effect does not require a new tag solely because it appeared in the history.

| Post-tag impact | Decision |
| --- | --- |
| No commits. | Eligible: the tag covers the development head. |
| Tests, CI, ordinary documentation, comments, formatting, or repository metadata with no effect on runtime, API/ABI, functional package contents, or build/install behavior. | Eligible: reuse the latest tag; a new tag is unnecessary. |
| Functional source fixes/features, API/ABI changes, changed dependencies/defaults, or Makefile/configure/packaging changes that affect built or installed results. | Prepare, test, and publish a new component version tag, then update the bundle pin to that tag. |
| A mixture of functional and nonfunctional changes. | Release a new tag covering the functional changes; nonfunctional changes do not excuse or independently block the release. |
| Impact cannot be established because history, diffs, consumers, or release requirements are missing. | Investigate; report a specific blocker if unresolved. |

A commit titled `tests:` may change production code. A Makefile edit limited to a test target, or a source-file edit limited to comments, can be nonfunctional. Conversely, a script under a CI directory may produce shipped artifacts and change their behavior. Trace changes to compiler/linker flags, dependencies, install paths, generated files, public defaults, and packaging before classifying them. A README edit is not a blocker merely because it is documentation; check whether it is actually consumed as an input that affects the product.

Version metadata changes also need an impact assessment. Merely aligning a displayed version with an existing tag is not automatically a functional change or a reason to publish another tag. If that value controls compatibility branches, dependencies, archive selection, installation, or public behavior, include its real effect in the release decision. Record the reviewed commits and evidence for the classification; when resuming, reassess earlier blockers under these impact rules.

Assess post-tag impact even when the bundle already points to the latest tag: unreleased functional changes still require a new tag. Third-party components do not have this post-tag release requirement; pin their latest verified upstream release tag even when their development branch has newer untagged changes.

## 4. Release Functional OpenResty Component Changes

For each OpenResty component with unreleased functional changes:

1. Read its release documentation, version metadata, tag history, and relevant build/tests. Choose a new, unused version using that project's established sequence, preserving its numeric, rc, or date conventions. Do not automatically promote an rc to a final release. If the next version cannot be determined reliably, prepare the reviewable release changes and resolve that specific version choice before publishing.
2. Work from the verified development head in a clean checkout/worktree. Update version metadata and generated release files only where the project requires it, using its normal tooling. Review the release diff, run focused regression and build/install checks for the functional changes, and validate dependent component contracts at the planned release commits. Resolve failures rather than tagging an untested or known-broken result.
3. Follow the repository's release-commit and branch integration process. Ensure the tested release commit belongs to the intended development/release lineage so subsequent tag-to-branch comparisons remain meaningful. Do not include unrelated local work or bypass a required PR/review. Record any concrete integration blocker after completing permitted preparation and tests.
4. Recheck the upstream head and whether the proposed tag already exists. For a full authorized update, create the new tag at the exact tested release commit using the repository's tag convention, then push that explicit tag to the verified OpenResty remote. Use an explicit tag refspec, never `git push --tags`, and never replace a published tag. Inspect an existing matching tag before reuse; a name collision at another commit needs a different valid version or resolution.
5. Verify the remote tag's object and peeled commit, then verify its source archive is obtainable and matches the intended layout. Query remote state after an uncertain push before retrying. Refresh the component inventory and latest-tag selection, and verify no unreleased functional changes remain between the new tag and the current development head. Record the new tag and commit as release evidence; only then use that published tag for final bundle verification.

For local-only work, prepare release changes and any requested local tag without publishing, and report the tag/remote archive as pending. Do not describe a local-only tag as an available release input. Continue other components when a specific release is blocked.

## 5. Update Component References

Build a per-component plan before editing: old pin, existing or newly released target tag and source commit, functional-impact assessment and release action for OpenResty components, third-party classification, archive/bundle mappings, required integration changes, and blockers.

Edit only the appropriate component's source version assignment and necessary URL, extraction, rename, patch, configure, or test references. The script reuses `ver` independently across components: do not perform a global replacement of an old numeric string. Preserve leading zeros, prerelease suffixes, dated versions, and each upstream's tag prefix. Check generated archive top-level names rather than assuming they equal repository names.

Validate contracts among `lua-nginx-module`, `stream-lua-nginx-module`, `lua-resty-core`, and LuaJIT at the selected tag commits. Sibling working-tree fixes do not enter tagged archives automatically. For an OpenResty component fix needed for compatibility, complete the component release steps above. If a required release cannot be completed, report the specific blocker; do not quietly use an older tag, modify a published archive, or claim local overlays are the final release input.

Include nginx in the plan with its current and latest verified upstream tag. A changed core requires the dedicated [nginx core upgrade workflow](../upgrade-nginx/SKILL.md), migrated patches, and a matching OpenResty-hosted repacked archive; a version-only edit is insufficient. Prepare or perform that work only within the current request's scope. Do not inherit the other skill's stored commit, direct-master push, or upload authorizations. If core integration or archive publication is unavailable, report it as pending core work and the overall refresh as partial, while completing eligible component updates.

Do not modify generated bundle files as the source fix. Do not change `util/ver` merely to release a component-only refresh. For blocked components, leave their existing pins intact and record the reason.

## 6. Verify the Actual Bundle

1. Check shell syntax with `bash -n util/mirror-tarballs` and run `git diff --check`. Inspect the full diff and confirm every changed pin maps to its planned component and exact tag.
2. Verify new archives are obtainable and their layouts and contents correspond to the recorded upstream tags. Record checksums. `util/get-tarball` currently trusts any nonempty same-name file in `work/`, so an old cache hit is not source verification. Use a fresh isolated cache/checkout where practical; do not delete or overwrite an unrelated cache or published archive.
3. Inspect the current packaging script's side effects before running `./util/mirror-tarballs` in a disposable or verified-safe OpenResty checkout. It recreates `openresty-<version>`, writes a distribution archive, and updates/cleans `work/nginx.org`; preserve user files and save logs outside recreated directories. A Git worktree still needs its own safe output/cache/doc paths.
4. Run the complete packaging path for updated components, inspect the exit status, full patch logs, archive mappings, generated docs/install files, and unresolved rejects. Some patch commands do not stop on failure. Fix owning source references or patches as needed, regenerate, and rerun; do not validate only downloads or repair only generated output.
5. Build and run relevant bundle/component regression tests using current repository documentation and CI configuration. At minimum, exercise configure/install paths affected by component names, versions, APIs, and generated Makefiles. Existing OpenResty tests expect a generated distribution and include literal bundle versions in `t/000-sanity.t`; update expectations only from verified correct output. `util/fix-tests` produces candidates for review, not automatically correct replacements.
6. Test exactly the selected tagged sources. Record binaries, input commits, options, commands, and results. Report unavailable dependencies or build environments as unverified, retaining eligible local edits and logs. Do not claim successful packaging or integration from syntax checks alone.

Finish by checking status and diffs in every checkout used. Remove only confirmed disposable resources created by this run when no longer needed, keeping diagnostic logs. Stage or publish only under the current delivery request, using repository conventions and explicit task paths; never include generated distributions, downloads, or unrelated user changes by accident.

## Completion Report

Every execution must report all inventoried components, including unchanged, blocked, and externally owned components. Include source/tag links, old and new pins, selected source commit, functional-impact classification with evidence, whether an existing tag was reused or a new one was required, release commit and local/published tag state where applicable, update outcome, and verification. List auxiliary inputs separately.

Summarize updated, already-current, newly tagged, blocked, and unverified components. Distinguish a completed local pin edit from a published component tag, successful packaging, and tested integration. Name any outstanding core upgrade, release step, or unavailable tag explicitly. Report commits, PRs, tags, or uploads only if actually performed under authorization. Do not call the update complete while required functional changes remain unreleased or required verification is blocked.
