# Build environment
FROM ibmcom/swift-ubuntu:4.1 AS build

# Copy the package manifest.
# Don't copy actual sources yet to avoid invalidating the build cache.
RUN mkdir -p /root/timing-sync
WORKDIR /root/timing-sync
COPY Package.swift .

RUN swift package resolve \
  && rm -rf .build/.repositories

# Now, copy the actual sources and build them.
COPY Sources Sources
COPY Tests Tests

ARG config=debug
RUN swift build -c $config --product openssl-crash-test \
  && mv .build/$config/openssl-crash-test . \
  && rm -rf .build/$config/*

RUN ./openssl-crash-test

# Runtime
FROM ibmcom/swift-ubuntu-runtime:4.1 AS runtime

RUN groupadd -r timing && useradd --no-log-init -r -g timing timing

RUN apt-get update \
  && apt-get install -y libatomic1 libcurl3 libicu52 libxml2 \
#  && apt-get autoremove -y \
  && apt-get dist-upgrade -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=build /root/timing-sync/openssl-crash-test /

USER timing:timing
EXPOSE 5050

ENTRYPOINT ["/openssl-crash-test"]
