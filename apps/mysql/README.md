Init the package
```
capstan package init --name "mysql-example" --title "MySQL Example" --author "Anonymous" --version "1.0" --require "osv.mysql"
```
Run this to compose:
```
capstan package compose mysql-example
```
Run this run the app:
```
capstan run mysql-example -p qemu --boot default
```
