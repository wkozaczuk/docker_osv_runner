This is an example of Elasticsearch 6.3 running on OSv.

Here are the steps to build the image:

Init the package
```
capstan package init --name "elasticsearch" --title "Elasticsearch OSS 6.3" --author "Anonymous" \
  --version "6.3" --require "openjdk8-zulu-compact3-with-java-beans" --require "osv.run-java"
```
Fetch elasticsearch binaries.
```
./fetch.sh
```
Add run init to specify how to execute the app (please look at meta/run.yaml)
Compose the package
```
capstan package compose -p elasticsearch
```
Run the app
```
capstan run elasticsearch -p qemu --boot default
```
