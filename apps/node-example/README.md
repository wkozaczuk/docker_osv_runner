This is an example of simple Node.js 'Hello World' app running on OSv.

Here are the steps to build the image:

Init the package
```
capstan package init --name "node-example" --title "Node.JS Example" --author "Anonymous" --version "1.0" --require "osv.node-js"
```
Add run init to specify how to execute the app (please look at meta/run.yaml)
Compose the package
```
capstan package compose node-example
```
Run the app
```
capstan run node-example -p qemu --boot default
```
