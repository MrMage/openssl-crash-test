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
