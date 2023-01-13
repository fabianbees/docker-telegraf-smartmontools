# Telegraf image with smartmontools and nvme-cli installed

This is a simple docker image based on the following image:

https://hub.docker.com/_/telegraf

It only adds the packages smartmontools and nvme-cli.


## Get the image

```
docker pull fabianbees/docker-telegraf-smartmontools:latest
```


## Still seeing no smart data?

Smartmontools and nvme-cli have to use sudo, therefore the following has to be set in ```telegraf.conf```:

```
# # Read metrics from storage devices supporting S.M.A.R.T.
[[inputs.smart]]
#   ## On most platforms used cli utilities requires root access.
#   ## Setting 'use_sudo' to true will make use of sudo to run smartctl or nvme-cli.
#   ## Sudo must be configured to allow the telegraf user to run smartctl or nvme-cli
#   ## without a password.
#   # use_sudo = false
    use_sudo = true
```




## Error while using the [imputs.docker] plugin

This error means that when running Telegraf in a container, you will need to make sure that the ```telegraf``` user is added to the ```docker``` group.

The docker user directive can accomplish this by adding:

```
--user telegraf:$(stat -c '%g' /var/run/docker.sock)
```


(--> see https://github.com/influxdata/influxdata-docker/issues/543#issuecomment-960246264 and https://www.influxdata.com/blog/docker-run-telegraf-as-non-root/)