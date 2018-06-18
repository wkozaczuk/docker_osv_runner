This is an example of simple java 'Hello World' app running on OSv.

Here are the steps to build the image:

Init the package
```
capstan package init --name "java-example" --title "Java Example" \
  --author "Anonymous" --version "1.0" --require "osv.openjdk10-java-base" \
  --require "osv.run-java"
```
Compile java source code
```
javac -d . Hello.java
```
Add run init to specify how to execute the app (please look at meta/run.yaml)
Compose the package
```
capstan package compose java-example
```
Run the app
```
capstan run java-example -p qemu --boot default
```
