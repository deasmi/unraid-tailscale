# unraid-tailscale
Docker build files for tailscale on unraid

This is intentended to provide access to the unraid server itself over tailscale and does not act as a VPN gateway.
It is possible to get this working using UP_FLAGS however as this was never the intention for this container I cannot provide
support for this usage.

## Optional Env Vars

- `UP_FLAGS` &ndash; Pass flags to the `tailscale up` command run on start-up
Please note that support cannot be provided for the use of UP_FLAGS


## Versions > 1.8.3

Please note that there was a config change after 1.8.4 that will prevent the container staying up if you upgrade from a previous version.

In order to fix this run the fix_config.py script against your tailscaled.state file.

