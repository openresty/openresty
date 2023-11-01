# Use an official Alpine Linux as the parent image
FROM alpine:latest

# Set environment variables for OpenResty and NGINX versions
ENV OPENRESTY_VERSION 1.21.4.2
ENV NGINX_VERSION 1.25.3

# Install required packages and build dependencies
RUN apk update && apk upgrade && apk add --no-cache \
    build-base \
    pcre-dev \
    openssl-dev \
    zlib-dev \
    wget \
    perl-dev \
    libxslt-dev \
    gd-dev \
    geoip-dev

# Download and extract the source code for OpenResty and NGINX
RUN wget https://openresty.org/download/openresty-$OPENRESTY_VERSION.tar.gz -O openresty.tar.gz \
    && wget https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -O nginx.tar.gz \
    && tar -xzvf openresty.tar.gz \
    && tar -xzvf nginx.tar.gz

# Build OpenResty and NGINX with OpenResty modules
RUN cd openresty-$OPENRESTY_VERSION \
    && ./configure --with-pcre-jit --with-ipv6 --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-threads --with-stream --with-stream_ssl_module --with-mail --with-mail_ssl_module --with-cc-opt="-O2 -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2" --with-ld-opt="-Wl,-z,relro -Wl,--as-needed" --prefix=/usr/local/openresty \
    && make \
    && make install

# Cleanup
RUN rm -rf openresty-$OPENRESTY_VERSION nginx-$NGINX_VERSION \
    && rm openresty.tar.gz nginx.tar.gz

# Add OpenResty to the system PATH
ENV PATH="/usr/local/openresty/bin:${PATH}"

# Expose ports if needed
EXPOSE 80
EXPOSE 443

# Optional: Set a default CMD to start OpenResty when the container runs
CMD ["nginx", "-g", "daemon off;"]
