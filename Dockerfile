FROM telegraf:1.22.0

RUN apt-get update && apt-get install -y --no-install-recommends \
	smartmontools lm-sensors nvme-cli \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd docker && usermod -aG docker telegraf

USER telegraf