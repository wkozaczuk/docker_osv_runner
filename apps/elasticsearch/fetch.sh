#!/bin/bash

VERSION="6.3.0"
NAME="elasticsearch"
DIR="${NAME}-${VERSION}"
TARBALL="${NAME}-oss-${VERSION}.tar.gz"
URL="https://artifacts.elastic.co/downloads/elasticsearch/${TARBALL}"

mkdir -p ./work
wget -c -O ./work/${TARBALL} ${URL}
tar -C ./work -xf work/${TARBALL}
mv ./work/${DIR} ./work/$NAME
rm -rf ./work/$NAME/bin
find ./assets/config -type f -exec cp {} ./work/${NAME}/config/. \;

wget -O ./work/Natives.java https://raw.githubusercontent.com/elastic/elasticsearch/6.3/server/src/main/java/org/elasticsearch/bootstrap/Natives.java
patch ./work/Natives.java ./assets/Natives.patch
wget -O ./work/BootstrapChecks.java https://raw.githubusercontent.com/elastic/elasticsearch/6.3/server/src/main/java/org/elasticsearch/bootstrap/BootstrapChecks.java
patch ./work/BootstrapChecks.java ./assets/BootstrapChecks.patch

CLASSPATH=""
for jar in ./work/elasticsearch/lib/*
do
  CLASSPATH="$CLASSPATH:$jar"
done

javac -d ./work -cp $CLASSPATH work/*.java
jar uf ./work/elasticsearch/lib/elasticsearch-${VERSION}.jar -C ./work org

mv ./work/elasticsearch .
