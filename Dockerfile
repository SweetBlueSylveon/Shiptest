# base = ubuntu + full apt update
FROM ubuntu:xenial AS base

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates

# byond = base + byond installed globally
FROM base AS byond
WORKDIR /byond

RUN apt-get install -y --no-install-recommends \
        curl \
        unzip \
        make \
        libstdc++6:i386

COPY dependencies.sh .

RUN . ./dependencies.sh \
    && curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip \
    && unzip byond.zip \
    && cd byond \
    && sed -i 's|install:|&\n\tmkdir -p $(MAN_DIR)/man6|' Makefile \
    && make install \
    && chmod 644 /usr/local/byond/man/man6/* \
    && apt-get purge -y --auto-remove curl unzip make \
    && cd .. \
    && rm -rf byond byond.zip

# build = byond + shiptest compiled and deployed to /deploy
FROM byond AS build
WORKDIR /shiptest

RUN apt-get install -y --no-install-recommends \
        curl

COPY . .

RUN env TG_BOOTSTRAP_NODE_LINUX=1 tools/build/build \
    && tools/deploy.sh /deploy

# rust = base + rustc and i686 target
FROM base AS rust
RUN apt-get install -y --no-install-recommends \
        curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal \
    && ~/.cargo/bin/rustup target add i686-unknown-linux-gnu

RUN apt-get install -y --no-install-recommends \
        pkg-config:i386 \
        libssl-dev:i386 \
        gcc-multilib \
        git \
    && git init \
    && git remote add origin https://github.com/tgstation/rust-g

# rust_g = base + rust_g compiled to /rust_g
FROM rust AS rust_g
WORKDIR /rust_g

COPY dependencies.sh .

RUN . ./dependencies.sh \
    && git init
    && git remote add origin https://github.com/tgstation/rust-g
    && git fetch --depth 1 origin "${RUST_G_VERSION}" \
    && git checkout FETCH_HEAD \
    && env PKG_CONFIG_ALLOW_CROSS=1 ~/.cargo/bin/cargo build --release --target i686-unknown-linux-gnu

# auxmos = base + auxmos compiled to /auxmos
FROM rust AS auxmos
WORKDIR /auxmos

COPY dependencies.sh .

RUN . ./dependencies.sh \
    && git init
    && git remote add origin https://github.com/Putnam3145/auxmos
    && git fetch --depth 1 origin "${AUXMOS_VERSION}" \
    && git checkout FETCH_HEAD \
    && env PKG_CONFIG_ALLOW_CROSS=1 RUSTFLAGS="-C target-cpu=native" env PKG_CONFIG_ALLOW_CROSS=1 ~/.cargo/bin/cargo build --release --target i686-unknown-linux-gnu --features "all_reaction_hooks"

# final = byond + runtime deps + rust_g + build
FROM byond
WORKDIR /shiptest

RUN apt-get install -y --no-install-recommends \
        libssl1.0.0:i386 \
        zlib1g:i386

COPY --from=build /deploy ./
COPY --from=rust_g /rust_g/target/i686-unknown-linux-gnu/release/librust_g.so ./librust_g.so
COPY --from=auxmos /auxmos/target/i686-unknown-linux-gnu/release/libauxmos.so ./libauxmos.so

VOLUME [ "/shiptest/config", "/shiptest/data" ]
ENTRYPOINT [ "DreamDaemon", "shiptest.dmb", "-port", "1337", "-trusted", "-close", "-verbose" ]
EXPOSE 1337
