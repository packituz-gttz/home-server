ARG CADDY_VERSION=2.10.2
ARG SABLIER_PLUGIN_VERSION=v1.0.1
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/sablierapp/sablier/plugins/caddy@${SABLIER_PLUGIN_VERSION}

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy