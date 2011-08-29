%define         resty_prefix     /opt/
%define         resty_user       nobody
%define         resty_group      nobody

%define         dir_name      openresty

Name:		ngx_openresty

Version:	1.0.5.1
Release:	5
Summary:	nginx for openresty

Group:		Productivity/Networking/Web/Servers
License:	BSD
URL:		http://www.openresty.org/

Source0:	ngx_openresty-%{version}rc%{release}.tar.gz

BuildRoot:	%{build_root}

AutoReqProv:    no
BuildRequires:	gcc >= 3.0, openssl-devel, pcre-devel, readline-devel
Requires:	openssl, pcre, readline

%description
OpenResty (aka. ngx_openresty) is a full-fledged web application server by bundling the standard Nginx core, lots of 3rd-party Nginx modules, as well as most of their external dependencie

%prep
#%setup -q -n ngx_openresty-%{version}
%setup -q -n ngx_openresty-%{version}rc%{release}

%build
            #--with-pg_config=opt/pg90/bin/pg_config \
            #--with-luajit \
./configure --prefix=%{resty_prefix}/%{dir_name} \
            --with-http_postgres_module

make %{?_smp_mflags}

%install
make install DESTDIR=$RPM_BUILD_ROOT

cur_dir=`pwd`

cd $RPM_BUILD_ROOT%{resty_prefix}/%{dir_name}/nginx/ && \
    mkdir client_body_temp fastcgi_temp proxy_temp

cd $RPM_BUILD_ROOT && (find . -type f | sed -e 's|^./|/|g' > $cur_dir/%{name}.manifest)
cd $RPM_BUILD_ROOT && (find . -type l | sed -e 's|^./|/|g' >> $cur_dir/%{name}.manifest)

echo %{resty_prefix}/%{dir_name}/nginx/logs >> $cur_dir/%{name}.manifest
echo %{resty_prefix}/%{dir_name}/nginx/client_body_temp >> $cur_dir/%{name}.manifest
echo %{resty_prefix}/%{dir_name}/nginx/fastcgi_temp >> $cur_dir/%{name}.manifest
echo %{resty_prefix}/%{dir_name}/nginx/proxy_temp >> $cur_dir/%{name}.manifest

#echo %{resty_prefix}/%{dir_name}/nginx/proxy_temp >> $cur_dir/%{name}.manifest

%clean
rm -rf $RPM_BUILD_ROOT

%files -f %{name}.manifest
%defattr(-,%{resty_user},%{resty_group},-)
#%doc

%changelog
* Wed Aug 24 2011 liseen <liseen.wan@gmail.com>
- initial packaging

