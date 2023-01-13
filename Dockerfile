# set version label
ARG VERSION

FROM telegraf:$VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
	sudo nano smartmontools nvme-cli \
    && rm -rf /var/lib/apt/lists/* && \
    echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
    echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
    echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
    echo "Done."
