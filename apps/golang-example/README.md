This is an example of simple Golang 'Hello World' app running on OSv.

Here are the steps to build the image:

Init the package
```
capstan package init --name "go-example" --title "Golang Example" --author "Anonymous" --version "1.0" --require "osv.run-go"
```
Compile golang source code
```
go build -buildmode=c-shared -o hello.so hello.go
```
Add run init to specify how to execute the app (please look at meta/run.yaml)
Compose the package
```
capstan package compose go-example
```
Run the app
```
capstan run go-example -p qemu --boot default
```
