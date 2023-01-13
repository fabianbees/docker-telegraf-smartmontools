# Telegraf image with smartmontools and nvme-cli installed

This is a simple docker image based on the following image:

https://hub.docker.com/_/telegraf

It only adds the packages smartmontools and nvme-cli.




## Error while using the [imputs.docker] plugin

This error means that when running Telegraf in a container, you will need to make sure that the ```telegraf``` user is added to the ```docker``` group.

The docker user directive can accomplish this by adding:

```
--user telegraf:$(stat -c '%g' /var/run/docker.sock)
```


(--> see https://github.com/influxdata/influxdata-docker/issues/543#issuecomment-960246264)