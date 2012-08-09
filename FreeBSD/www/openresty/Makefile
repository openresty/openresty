# New ports collection makefile for:	openresty
# Date created:		2012-08-07
# Whom:			Gvozdikov Veniamin <g.veniamin@googlemail.com>
#
# $FreeBSD$
#

PORTNAME=	openresty
PORTVERSION=	1.2.1.11
CATEGORIES=	www
MASTER_SITES=	http://agentzh.org/misc/nginx/
DISTNAME=	ngx_${PORTNAME}-${PORTVERSION}

MAINTAINER=	g.veniamin@googlemail.com
COMMENT=	OpenResty a powerful web app server by extending nginx

LICENSE=	BSD

LIB_DEPENDS=	pcre:${PORTSDIR}/devel/pcre

HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PERL5=	yes

CONFIGURE_ARGS=	--prefix=${PREFIX}\
		--with-cc-opt="-I ${LOCALBASE}/include" \
		--with-ld-opt="-L ${LOCALBASE}/lib" \
		--user=${WWWOWN} --group=${WWWGRP}

OPTIONS_DEFINE=	LUACJSON LUAREDISPARS LUARDS LUARESTYDNS LUARESTYMEM \
		LUARESTYREDIS LUARESTYMYSQL LUARESTYUPLOAD LUARESTYSTRING \
		ECHO XSS COOLKIT MISC ENCSESSION HEADERSMORE SRCACHE \
		ARRAYVAR MEMC REDIS REDIS2 AUTHREQ RDSJSON RDSCVS \
		ICONV NDK DRIZZLE POSTGRES
OPTIONS_SINGLE=		GLUA
OPTIONS_SINGLE_GLUA=	LUA LUAJIT DLUA

LUACJSON_DESC=		Lua cjson library
LUAREDISPARS_DESC=	Lua redis parser library
LUARDS_DESC=		Lua rds library
LUARESTYDNS_DESC=	Lua resty dns library
LUARESTYMEM_DESC=	Lua resty memcached library
LUARESTYREDIS_DESC=	Lua resty redis library
LUARESTYMYSQL_DESC=	Lua resty mysql library
LUARESTYUPLOAD_DESC=	Lua resty upload library
LUARESTYSTRING_DESC=	Lua resty string library

ECHO_DESC=		Brings echo/sleep/time and more shell-style
XSS_DESC=		Native cross-site scripting support in nginx
COOLKIT_DESC=		Collection of small and useful nginx add-ons
MISC_DESC=		Various set_xxx directives added
ENCSESSION_DESC=	Encrypt and decrypt nginx variable values
HEADERSMORE_DESC=	Set and clear input and output headers
SRCACHE_DESC=		Transparent subrequest-based caching layout
ARRAYVAR_DESC=		Add support for array variables to config
MEMC_DESC=		An extended memcached module
REDIS_DESC=		HTTP redis module
REDIS2_DESC=		Module for the Redis 2.0 protocol
AUTHREQ_DESC=		Auth request module
RDSJSON_DESC=		An output filter that formats Resty
RDSCVS_DESC=		Output filter module to convert CVS
NDK_DESC=		Nginx Development Kit
ICONV_DESC=		Iconv support
DRIZZLE_DESC=		Module for talking to MySQL and Drizzle
POSTGRES_DESC=		Module for talking to Postgeres

DLUA_DESC=		Disable Lua
LUA_DESC=		Use LUA 5.1
LUAJIT_DESC=		Use LuaJIT 2.0

OPTIONS_DEFAULT=	MISC XSS ECHO COOLKIT ENCSESSION HEADERMORE LUA \
			SRCACHE ARRAYVAR MEMC REDIS REDIS2 AUTHREQ RDSJSON \
			RDSCVS NDK ICONV PORTGRES

.include <bsd.port.options.mk>

.if empty(${PORT_OPTIONS:MAUTHREQ})
CONFIGURE_ARGS+=	--without-http_auth_request_module
.endif

.if empty(${PORT_OPTIONS:MRDSJSON})
CONFIGURE_ARGS+=	--without-http_rds_json_module
.endif

.if empty(${PORT_OPTIONS:MRDSCVS})
CONFIGURE_ARGS+=	--without-http_rds_csv_module
.endif

.if ${PORT_OPTIONS:MICONV}
CONFIGURE_ARGS+=	--with-http_iconv_module
.endif

.if ${PORT_OPTIONS:MNDK}
.else
CONFIGURE_ARGS+=	--without-ngx_devel_kit_module
.endif

.if ${PORT_OPTIONS:MDRIZZLE}
CONFIGURE_ARGS+=	--with-http_drizzle_module \
			--with-libdrizzle=${LOCALBASE}
LIB_DEPENDS+=		drizzle:${PORTSDIR}/databases/libdrizzle
.endif

.if ${PORT_OPTIONS:MPOSTGRES}
CONFIGURE_ARGS+=	--with-http_postgres_module
.endif

.if empty(${PORT_OPTIONS:MREDIS})
CONFIGURE_ARGS+=	--without-http_redis_module
.endif

.if empty(${PORT_OPTIONS:MREDIS2})
CONFIGURE_ARGS+=	--without-http_redis2_module
.endif

.if empty(${PORT_OPTIONS:MMEMC})
CONFIGURE_ARGS+=	--without-http_memc_module
.endif

.if empty(${PORT_OPTIONS:MARRAYVAR})
CONFIGURE_ARGS+=	--without-http_array_var_module
.endif

.if empty(${PORT_OPTIONS:MSRCACHE})
CONFIGURE_ARGS+=	--without-http_srcache_module
.endif

.if empty(${PORT_OPTIONS:MENCSESSION})
CONFIGURE_ARGS+=	--without-http_encrypted_session_module
.endif

.if empty(${PORT_OPTIONS:MHEADERSMORE})
CONFIGURE_ARGS+=	--without-http_headers_more_module
.endif

.if empty(${PORT_OPTIONS:MMISC})
CONFIGURE_ARGS+=	--without-http_set_misc_module
.endif

.if empty(${PORT_OPTIONS:MXSS})
CONFIGURE_ARGS+=	--without-http_xss_module
.endif

.if empty(${PORT_OPTIONS:MCOOLKIT})
CONFIGURE_ARGS+=	--without-http_coolkit_module
.endif

.if empty(${PORT_OPTIONS:MECHO})
CONFIGURE_ARGS+=	--without-http_echo_module
.endif

.if ${PORT_OPTIONS:MLUAJIT}
CONFIGURE_ARGS+=	--with-luajit
PLIST_SUB+=		LUAJIT=""
.else
PLIST_SUB+=		LUAJIT="@comment "
.endif

.if ${PORT_OPTIONS:MLUA}
PLIST_SUB+=		LUA=""
.else
CONFIGURE_ARGS+=	--without-lua51
PLIST_SUB+=		LUA="@comment "
.endif

.if ${PORT_OPTIONS:MDLUA}
CONFIGURE_ARGS+=	--without-http_lua_module
.endif

.if ${PORT_OPTIONS:MLUACJSON}
PLIST_SUB+=		LUACJSON=""
.else
CONFIGURE_ARGS+=	--without-lua_cjson
PLIST_SUB+=		LUACJSON="@comment "
.endif

.if ${PORT_OPTIONS:MLUAREDISPARS}
PLIST_SUB+=		LUAREDISPARS=""
.else
CONFIGURE_ARGS+=	--without-lua_redis_parser
PLIST_SUB+=		LUAREDISPARS="@comment "
.endif

.if ${PORT_OPTIONS:MLUARDS}
PLIST_SUB+=		LUARDS=""
.else
CONFIGURE_ARGS+=	--without-lua_rds_parser
PLIST_SUB+=		LUARDS="@comment "
.endif

.if ${PORT_OPTIONS:MLUARESTYDNS}
PLIST_SUB+=		LUARESTYDNS=""
.else
PLIST_SUB+=		LUARESTYDNS="@comment "
CONFIGURE_ARGS+=	--without-lua_resty_dns
.endif

.if ${PORT_OPTIONS:MLUARESTYMEM}
PLIST_SUB+=		LUARESTYMEM=""
.else
PLIST_SUB+=		LUARESTYMEM="@comment "
CONFIGURE_ARGS+=	--without-lua_resty_memcached
.endif

.if ${PORT_OPTIONS:MLUARESTYREDIS}
PLIST_SUB+=		LUARESTYREDIS=""
.else
CONFIGURE_ARGS+=	--without-lua_resty_redis
PLIST_SUB+=		LUARESTYREDIS="@comment "
.endif

.if ${PORT_OPTIONS:MLUARESTYMYSQL}
PLIST_SUB+=		LUARESTYMYSQL=""
.else
CONFIGURE_ARGS+=	--without-lua_resty_mysql
PLIST_SUB+=		LUARESTYMYSQL="@comment "
.endif

.if ${PORT_OPTIONS:MLUARESTYUPLOAD}
PLIST_SUB+=		LUARESTYUPLOAD=""
.else
CONFIGURE_ARGS+=	--without-lua_resty_upload
PLIST_SUB+=		LUARESTYUPLOAD="@comment "
.endif

.if ${PORT_OPTIONS:MLUARESTYSTRING}
PLIST_SUB+=		LUARESTYSTRING=""
.else
CONFIGURE_ARGS+=	--without-lua_resty_string
PLIST_SUB+=		LUARESTYSTRING="@comment "
.endif

.include <bsd.port.mk>
