Init the package
```
capstan package init --name "memcached-example" --title "Memcached Example" --author "Anonymous" --version "1.0" --require "osv.memcached"
```
Run this to compose:
```
capstan package compose memcached-example
```
Run this run the app:
```
capstan run memcached-example -p qemu --boot default
```
