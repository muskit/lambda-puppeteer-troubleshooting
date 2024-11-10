# Running locally

This assumes you have `aws-lambda-rie` on path . Then:

```bash
$ scripts/build.sh
$ scripts/run_rie.sh # refers to aws-lambda-rie on path as volume for local function emulation
```

# My results

Startup

```
time="2024-11-10T10:00:58.732" level=info msg="exec '/usr/local/bin/npx' (cwd=/app/src, handler=lambda.handler)"
```

Invoke

```
time="2024-11-10T10:01:24.142" level=info msg="extensionsDisabledByLayer(/opt/disable-extensions-jwigqn8j) -> stat /opt/disable-extensions-jwigqn8j: no such file or directory"
time="2024-11-10T10:01:24.142" level=warning msg="Cannot list external agents" error="open /opt/extensions: no such file or directory"
START RequestId: 814855e6-412c-4b6e-b18f-d40cc8795e25 Version: $LATEST
Executing 'lambda.handler' in function directory '/app/src'
2024-11-10T10:01:24.751Z        814855e6-412c-4b6e-b18f-d40cc8795e25    INFO    start of handler...
2024-11-10T10:01:24.751Z        814855e6-412c-4b6e-b18f-d40cc8795e25    INFO    initializing browser...
[1110/100124.853058:ERROR:bus.cc(393)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
[1110/100124.855489:WARNING:audio_manager_linux.cc(69)] Falling back to ALSA for audio output. PulseAudio is not available or could not be initialized.

DevTools listening on ws://127.0.0.1:40519/devtools/browser/97a2c777-d762-4a47-a402-3cb712881950
[1110/100124.910745:ERROR:gpu_init.cc(426)] Passthrough is not supported, GL is disabled
```

Hang until function timeout with no errors
