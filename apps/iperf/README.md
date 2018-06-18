Init the package
```
capstan package init --name "iperf-example" --title "Iperf Example" \
  --author "Anonymous" --version "1.0" --require "osv.iperf"
```
Run this to compose:
```
capstan package compose iperf-example
```
Run this run the app:
```
capstan run iperf-example -p qemu --boot default
```
