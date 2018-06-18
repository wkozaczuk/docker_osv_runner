Init the package
```
capstan package init --name "lighttpd-example" --title "Lighttpd Example" \
  --author "Anonymous" --version "1.0" --require "osv.lighttpd"
```
Run this to compose:
```
capstan package compose lighttpd-example
```
Run this run the app:
```
capstan run lighttpd-example -p qemu --boot default
```
