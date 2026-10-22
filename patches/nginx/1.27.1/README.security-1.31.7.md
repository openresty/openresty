# nginx 1.31.7 security fixes for nginx 1.27.1

These patches backport the five security fixes from nginx 1.31.7, retaining
the upstream authorship and commit descriptions. The upstream release commit
is `28c4fc458a90c1defcfb9753ae9295740a651c40`; the original nginx 1.27.1
source commit is `e06bdbd4a20912c5223d7c6c6e2b3f0d6086c928`.

| Patch | Upstream commit | Fix |
| --- | --- | --- |
| `nginx-1.27.1-CVE-2026-15176.patch` | [f8a23425b](https://github.com/nginx/nginx/commit/f8a23425bd6840c4c36b4264edf576ba3646156f) | Reject alias URI mapping while a rewrite is awaiting location selection. |
| `nginx-1.27.1-CVE-2026-93479.patch` | [6aa4b3fdd](https://github.com/nginx/nginx/commit/6aa4b3fdd4fdc156153f2981eb4070690624447c) | Exclude reserved trailing space from the HTTP and stream script copy limits. |
| `nginx-1.27.1-CVE-2026-95101.patch` | [1c173a2d8](https://github.com/nginx/nginx/commit/1c173a2d8767730e678c27446138d7ae5dd6fd64) | Track skipped HTTP/3 frame bytes separately from DATA payload bytes. |
| `nginx-1.27.1-CVE-2026-97629.patch` | [1916f26e6](https://github.com/nginx/nginx/commit/1916f26e6ca49296568633d309777e36527e5bb2) | Synchronize all three shared TLS session ticket keys into worker memory. |
| `nginx-1.27.1-CVE-2026-97205.patch` | [6adfc05ec](https://github.com/nginx/nginx/commit/6adfc05ece48f92446383ec1f145446848694698) | Limit pending operations to prevent the main request's blocked counter from overflowing. |

References: [nginx security advisories](https://nginx.org/en/security_advisories.html)
and [nginx release notes](https://nginx.org/en/CHANGES).

## Application

`util/mirror-tarballs` and the sibling `openresty-devel-utils/ngx-build`
apply these patches automatically for nginx 1.27.1. Both apply the script
engine prerequisites before the five new patches. Other nginx versions
skip this backport sequence. The five new patches do not depend on one
another.

`ngx-build` also applies the missing CVE-2026-42945, CVE-2026-9256, and
CVE-2026-42533-1 through -5 prerequisites in that order. Use `ngx-build -f`
to re-extract and patch an existing cached build.

**CVE-2026-93479 requires the existing CVE-2026-42533-1 through -5 patches.**
Original nginx 1.27.1 is outside the published affected versions for
CVE-2026-93479. However, the earlier CVE-2026-42533 backports introduce the
buffer checks and result-length recalculation involved in this vulnerability,
so this follow-up fix is needed when those backports are used.

The other four patches also apply independently to original nginx 1.27.1.
The AIO patch uses reduced context around `NGX_HTTP_MAX_BLOCKED` so that it
also applies after the existing OpenResty HTTP/2 subrequest wakeup patch.

For an nginx 1.27.1 source tree with the existing patches already applied:

```sh
# Set this to the absolute path of this directory.
patch_dir=/path/to/openresty/patches/nginx/1.27.1

for cve in 15176 93479 95101 97629 97205; do
    patch --batch --fuzz=0 -p1 \
        < "$patch_dir/nginx-1.27.1-CVE-2026-$cve.patch" || exit 1
done
```

The commands above are for manual application to a source tree that has
not received the five new patches yet.

## Validation

Validation used isolated source trees, GCC 11.5.0, and OpenSSL 3.5.1:

- All five patches applied with zero fuzz after the existing nginx 1.27.1
  bundle patch sequence. The four independent fixes also applied with zero
  fuzz to original nginx 1.27.1. Reverse application was checked separately.
- The actual patch stages from `util/mirror-tarballs` and `ngx-build` were
  executed against fresh nginx 1.27.1 trees. `ngx-build` was checked with
  both ordinary pools and the no-pool patch; both resulting trees built
  successfully. Version-selection checks confirmed that 1.27.0, 1.29.8,
  1.30.5, 1.30.6, 1.31.6, and 1.31.7 skip the new backport sequence.
- A full debug build passed with HTTP/2, HTTP/3, HTTP and stream TLS,
  native file AIO, and thread pools enabled. The affected source files also
  compiled with neither AIO option, native AIO only, and threads only.
- The local nginx-tests checkout at
  `c45d610219157a37d4cf23eae0399e94190b3bf1` passed 201
  assertions across rewrite, variables, location mapping, stream map, TLS
  ticket rotation/session reuse, SSI, and proxy cache locking tests.
- The included `t/alias-rewrite.t` passed 12 assertions covering rejection
  during the inconsistent rewrite window, normal alias mapping, mapping
  after location selection, and ordinary root mapping during a rewrite.
- Focused C probes failed before the fixes and passed afterward: HTTP and
  stream script copies growing into 1-byte and 16-byte reserved areas;
  HTTP/3 unknown frames split at every byte boundary, including zero-length
  frames and a two-byte frame length; all three TLS ticket key slots during
  initialization and rotation; and AIO paths at main-request blocked counts
  of 249, 250, and 255. The AIO probes covered copy-filter handler restoration
  on success/error, cache lock waiting, native and threaded cache reads, and
  upstream thread submission. The TLS and AIO probes used the actual
  functions extracted from each source tree, with synchronous test doubles
  for surrounding infrastructure.

The HTTP/3 network tests `h3_request_body.t` and
`h3_request_body_extra.t` were skipped because Perl CryptX was unavailable.
The direct parser probes exercised frame fragmentation without that
dependency; an end-to-end QUIC test was not run.

Run the included test from the OpenResty repository root, with
Test::Nginx::Socket installed:

```sh
TEST_NGINX_BINARY=/absolute/path/to/patched/nginx \
TEST_NGINX_SERVROOT=/tmp/nginx-1.27.1-alias-test \
    prove patches/nginx/1.27.1/t/alias-rewrite.t
```
