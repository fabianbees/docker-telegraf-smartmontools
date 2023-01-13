# set version label
ARG VERSION

FROM telegraf:$VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
	smartmontools nvme-cli \
    && rm -rf /var/lib/apt/lists/*


USER telegraf