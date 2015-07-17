#!/usr/bin/env bash

cd /app

#JAR example
IS_ZIP=false

if [ "$FILE_EXTENSION" = "zip" ]; then
    IS_ZIP=true
else
    IS_ZIP=false
fi

if $IS_ZIP ; then
  wget --user=$NEXUS_USER --password=$NEXUS_PASSWORD ${NEXUS_URL}/service/local/artifact/maven/content?r=${NEXUS_REPOSITORY}"&g"=${NEXUS_GROUP}"&a"=${NEXUS_ARTIFACT}"&v"=${NEXUS_VERSION}"&e"=${FILE_EXTENSION} -O app.zip
else
  wget --user=$NEXUS_USER --password=$NEXUS_PASSWORD ${NEXUS_URL}/service/local/artifact/maven/content?r=${NEXUS_REPOSITORY}"&g"=${NEXUS_GROUP}"&a"=${NEXUS_ARTIFACT}"&v"=${NEXUS_VERSION} -O app.jar
fi

if $IS_ZIP ; then
  unzip app.zip
  cd upp*
  cd bin
  ./${NEXUS_ARTIFACT}
else
  java -jar ${JAVA_OPTIONS} app.jar ${ARGS}
fi