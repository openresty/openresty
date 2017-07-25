This place is for bug reports and development discussions only. For general questions and
discussions, please join the openresty-en mailing list instead: https://groups.google.com/group/openresty-en.
If you want to use Chinese, please join the openresty (Chinese) mailing list instead: https://groups.google.com/group/openresty.
Do not use Chinese in this place.

Before you open a new issue, please search the internet and make sure it is not duplicate.

Ensure you have provided the following details while reporting a problem:

- [ ] The exact version of the related software, including but not limited to the OpenResty version
(if any), the NGINX core version, the `ngx_lua` module version(via `openresty -V` or `nginx -V`),
and your operating system version(via `uname -a`).
- [ ] **A minimal and standalone test case** that others can easily run on their side and
reproduce the issue you are seeing.
- [ ] Do not simply say "something is broken" or "something does not work". Always provide
as much details as possible. Always describe **the symptoms and your expected results**.

You can (temporarily) enable the nginx debugging logs to see the internal workings
of NGINX in your nginx''s `error.log` file. See http://nginx.org/en/docs/debugging_log.html
The same instructions apply equally well to OpenResty.

If you are seeing crashes, please provide the full backtrace for the crash. See
https://www.nginx.com/resources/wiki/start/topics/tutorials/debugging/#core-dump
for more details.

Thanks for your cooperation.
