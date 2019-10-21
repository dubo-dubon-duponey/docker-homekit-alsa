# What

Docker image to control the volume of your raspberries.

This is based on [HomeKit Alsa](https://github.com/dubo-dubon-duponey/homekit-alsa).

## Image features

 * multi-architecture:
    * [✓] linux/amd64
    * [✓] linux/arm64
    * [✓] linux/arm/v7
    * [✓] linux/arm/v6
 * hardened:
    * [✓] image runs read-only
    * [✓] image runs with no capabilities
    * [✓] process runs as a non-root user, disabled login, no shell
 * lightweight
    * [✓] based on `debian:buster-slim`
    * [✓] simple entrypoint script
    * [✓] multi-stage build with ~~no installed~~ dependencies for the runtime image:
        * alsa-utils
 * observable
    * [✓] healthcheck
    * [  ] ~~prometheus endpoint~~
    * [✓] log to stdout

## Run

```bash
docker run -d \
    --env HOMEKIT_NAME="My Fancy Speaker" \
    --env HOMEKIT_PIN="87654312" \
    --name speaker \
    --read-only \
    --cap-drop ALL \
    --group-add audio \
    --net host \
    --device /dev/snd \
    --volume /data \
    --rm \
    dubodubonduponey/homekit-alsa:v1
```

## Notes

### Custom configuration file

All configuration is done through environment variables, specifically:


```dockerfile
ENV           ALSA_CARD=""
ENV           ALSA_DEVICE=""

ENV           HOMEKIT_NAME="Speak-easy"
ENV           HOMEKIT_PIN="87654312"
ENV           HOMEKIT_MANUFACTURER="DuboDubonDuponey"
ENV           HOMEKIT_SERIAL=""
ENV           HOMEKIT_MODEL="Acme"
ENV           HOMEKIT_VERSION="0"
```

### Networking

You need to run this in host or macvlan networking (eg: mDNS).

#### Build time

You can rebuild the image using the following build arguments:

 * BUILD_UID
 
So to control which user-id to assign to the in-container user.