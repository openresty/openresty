# nginx 1.31.9 security fixes for nginx 1.27.1

These patches backport the following fixes from nginx 1.31.9 to nginx
1.27.1 (`e06bdbd4a20912c5223d7c6c6e2b3f0d6086c928`). The patch headers
contain the upstream commit IDs and descriptions.

| CVE | Upstream commits | Change |
| --- | --- | --- |
| 2026-123634 | `8492a8b8a`, `e39708edc` | Report CNAME restart errors and defer freeing resolver contexts detached during callbacks. |
| 2026-123007 | `e27f5fa84` | Include queued DATA in the connection flow-control window. |
| 2026-121810 | `b5252dae1` | Insert the QUIC stream before allocating its connection. |
| 2026-123633 | `2df48a501` | Mark the HTTP/2 connection non-reusable when a stream is created. |
| 2026-118899 | `2b129b936`, `c51ffa2d1` | Stop HTTP and HTTP/3 body reads on `NGX_AGAIN`. |
| 2026-113425 | `e505109a3`, `754fe68c2`, `a22ab7105`, `013ce1879`, `1d1d861a5` | Protect mail sessions during authentication, upstream connection and SMTP resolution. |
| 2026-125283 | `d1ffe6fa8` | Recalculate the try_files script result length before alias handling. |
| 2026-120967 | `6f9fceed8` | Re-read the stream server configuration after the TLS handshake. |
| 2026-123640 | `30b8bf67e`, `d9fd14eb3` | Reject malformed extension lengths and duplicate SNI or ALPN. |

The CVE-2026-125283 patch applies after the existing CVE-2026-42533-4
patch, which changes direct script evaluation in try_files. The other
patches apply to the original 1.27.1 source. The backports for HTTP/2 and
mail adjust patch context to the older source layout.

CVE-2026-120993 affects nginx 1.31.4 through 1.31.8, not original 1.27.1.
The existing OpenResty `stream_proxy_protocol_v2` backport has a separate
implementation that checks `SSL_get_certificate()` for NULL before using
its result. No CVE-2026-120993 patch is needed for that implementation.

`util/mirror-tarballs` applies these patches for nginx 1.27.1, after the
existing script-engine prerequisites. For manual application, apply
CVE-2026-125283 only after its prerequisite. See the
[nginx advisories](https://nginx.org/en/security_advisories.html) and
[release notes](https://nginx.org/en/CHANGES) for affected configurations.

## Validation

- All nine patches applied with `--fuzz=0` to an isolated 1.27.1 source
  tree; the try_files section of CVE-2026-42533-4 was applied first for
  CVE-2026-125283. The resolver patch also applied between the existing
  `resolver_conf_parsing` and `safe_resolver_ipv6_option` patches, and
  the HTTP/2 subrequest and stream preread patches passed dry runs.
- An eight-patch debug build (excluding CVE-2026-125283 and its script
  prerequisites) compiled with HTTP/2, HTTP/3, HTTP and stream TLS,
  stream preread and mail. With nginx-tests at
  `c45d610219157a37d4cf23eae0399e94190b3bf1`, HTTP/2, body,
  stream preread, client certificate and mail regression tests passed
  295 assertions.
- A separate build containing CVE-2026-125283 and its script changes
  passed `http_try_files.t` (12 assertions). This build used a partial
  existing patch sequence and disabled gRPC because a gRPC hunk of
  CVE-2026-42533-4 requires other bundle patches.
- The nginx patch stage from `util/mirror-tarballs` completed on a fresh
  1.27.1 source tree, with all nine new patches applied without fuzz. The
  resulting tree built with HTTP/2, HTTP/3, stream TLS, preread and mail;
  six HTTP/2, stream, mail and try_files tests passed 135 assertions.

These checks do not exercise every vulnerability trigger or build the
complete OpenResty bundle. In particular, no end-to-end QUIC exploit
regression was run.
