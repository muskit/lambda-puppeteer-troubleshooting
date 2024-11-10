# Running locally

This assumes you have `aws-lambda-rie` on path . Then:

```bash
$ scripts/build.sh
$ scripts/run_rie.sh # refers to aws-lambda-rie on path as volume for local function emulation
```

# My results (SOLVED!)

### Solution: install Google Chrome based on [puppeteer's instructions](https://pptr.dev/troubleshooting#running-puppeteer-in-docker)

Startup

```
time="2024-11-10T21:04:34.816" level=info msg="exec '/usr/local/bin/npx' (cwd=/app/src, handler=lambda.handler)"
```

Invoke

```
time="2024-11-10T21:04:37.232" level=info msg="extensionsDisabledByLayer(/opt/disable-extensions-jwigqn8j) -> stat /opt/disable-extensions-jwigqn8j: no such file or directory"
time="2024-11-10T21:04:37.232" level=warning msg="Cannot list external agents" error="open /opt/extensions: no such file or directory"
START RequestId: 18411b64-6c54-4865-a4a5-c552c7db136c Version: $LATEST
Executing 'lambda.handler' in function directory '/app/src'
2024-11-10T21:04:37.788Z        18411b64-6c54-4865-a4a5-c552c7db136c    INFO    start of handler...
2024-11-10T21:04:37.789Z        18411b64-6c54-4865-a4a5-c552c7db136c    INFO    initializing browser...
[40:61:1110/210437.842861:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[40:64:1110/210437.844094:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[40:64:1110/210437.844123:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[40:61:1110/210437.846693:ERROR:bus.cc(407)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[40:61:1110/210437.846722:ERROR:bus.cc(407)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[40:61:1110/210437.846769:ERROR:bus.cc(407)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[40:61:1110/210437.846811:ERROR:bus.cc(407)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[40:61:1110/210437.846828:ERROR:bus.cc(407)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[40:61:1110/210437.892253:ERROR:bus.cc(407)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[40:61:1110/210437.892282:ERROR:bus.cc(407)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")

DevTools listening on ws://127.0.0.1:34409/devtools/browser/bcc97029-763d-4886-bf6e-1f532064e2dc
[40:124:1110/210437.942318:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[40:124:1110/210437.942362:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[40:124:1110/210437.942634:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[40:124:1110/210437.942671:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[40:124:1110/210437.942686:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
2024-11-10T21:04:37.956Z        18411b64-6c54-4865-a4a5-c552c7db136c    INFO    browser initialized!
END RequestId: 18411b64-6c54-4865-a4a5-c552c7db136c
REPORT RequestId: 18411b64-6c54-4865-a4a5-c552c7db136c  Init Duration: 0.14 ms  Duration: 970.25 ms     Billed Duration: 1000 ms        Memory Size: 3008 MB    Max Memory Used: 3008 MB
```

Returned data

```
initializing browser...
[167.35189700126648] browsing to example.com...
[286.8385670185089] finished loading example.com!
[412.2842479944229] closed browser!

```
