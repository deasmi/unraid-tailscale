# unraid-tailscale
Docker build files for tailscale on unraid

![GitHub](https://img.shields.io/github/license/deasmi/unraid-tailscale)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/deasmi/unraid-tailscale)


[Unraid on tailscale support page](https://forums.unraid.net/topic/90719-support-tailscale-support-thread/)


This is intentended to provide access to the unraid server itself over tailscale and does not act as a VPN gateway.
It is possible to get this working using UP_FLAGS however as this was never the intention for this container I cannot provide
support for this usage.

## Optional Env Vars

- `UP_FLAGS` &ndash; Pass flags to the `tailscale up` command run on start-up
Please note that support cannot be provided for the use of UP_FLAGS


