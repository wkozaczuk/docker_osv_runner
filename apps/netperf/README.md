Init the package
```
capstan package init --name "netperf-example" --title "Netperf Example" --author "Anonymous" --version "1.0" --require "osv.netperf"
```
Run this to compose:
```
capstan package compose netperf-example
```
Run this run the app:
```
capstan run netperf-example -p qemu --boot default
```
