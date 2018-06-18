This is an example of simple Python 2.7 'Hello World' app running on OSv.

Here are the steps to build the image:

Init the package
```
capstan package init --name "python-example" --title "Python 2.7 Example" \
  --author "Anonymous" --version "1.0" --require "python-2.7"
```
Add run init to specify how to execute the app (please look at meta/run.yaml)
Compose the package
```
capstan package compose -p python-example
```
Run the app
```
capstan run python-example -p qemu --boot default
```
