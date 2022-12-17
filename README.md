## Squid Proxy Docker Compose Personal Usage

#### Add ACL Basic Authentication
Generate username & password first, run `sudo htpasswd -c /etc/squid/passwords <USERNAME>`
```
# squid.conf

auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm HTTP Proxy Server

# Optional
# auth_param basic credentialsttl <DURATION> hours
# auth_param basic casesensitive off

acl authenticated proxy_auth REQUIRED

# Optional
# acl authenticated_ips src <IP_RANGES>
# default 0.0.0.0/0
```

#### Add ACL Blacklist Domains
```
# squid.conf

acl BLACKLIST_DOMAINS dstdomain "/etc/squid/deny/BLACKLIST_DOMAINS.txt"
http_access deny BLACKLIST_DOMAINS
```

#### Add Custom Error
```
# squid.conf

error_directory /usr/share/squid/errors/templates
```
For more information about template name, run `cd /usr/share/squid/errors/templates && ls -l`

#### Generate OpenSSL
`openssl req -new -newkey rsa:2048 -sha256 -days <DURATION> -nodes -x509 -extensions v3_ca -keyout squid-ca-key.pem -out squid-ca-cert.pem`

#### Source
Visit [Squid Docker Image](https://hub.docker.com/r/ubuntu/squid)