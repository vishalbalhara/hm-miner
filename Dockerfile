ARG HELIUM_GA_RELEASE=2022.04.18.1
ARG BUILD_ARCH=arm64
ARG BLOCKCHAIN_ROCKSDB_GC_BYTES=8589934592

FROM quay.io/team-helium/miner-testnet:miner-"$BUILD_ARCH"_"$HELIUM_GA_RELEASE"

WORKDIR /opt/miner

ARG HELIUM_GA_RELEASE
ENV HELIUM_GA_RELEASE $HELIUM_GA_RELEASE

ARG BLOCKCHAIN_ROCKSDB_GC_BYTES
ENV BLOCKCHAIN_ROCKSDB_GC_BYTES $BLOCKCHAIN_ROCKSDB_GC_BYTES

# COPY full-sys.config /opt/miner/config/sys.config
COPY docker.config /opt/miner/releases/"$HELIUM_GA_RELEASE"/sys.config
COPY docker.config.* /opt/miner/
COPY *.sh /opt/miner/

RUN echo "$HELIUM_GA_RELEASE" > /etc/lsb_release

ENTRYPOINT ["/opt/miner/start-miner.sh"]
