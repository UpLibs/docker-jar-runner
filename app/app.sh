#!/usr/bin/env bash

cd /app

#JAR example
IS_ZIP=false

if [ "$ARTIFACT_EXTENSION" = "zip" ]; then
    IS_ZIP=true
else
    IS_ZIP=false
fi

if $IS_ZIP ; then
  wget --user=$NEXUS_USER --password=$NEXUS_PASSWORD ${NEXUS_URL}/service/local/artifact/maven/content?r=${NEXUS_REPOSITORY}"&g"=${ARTIFACT_GROUP}"&a"=${ARTIFACT_NAME}"&v"=${ARTIFACT_VERSION}"&e"=${ARTIFACT_EXTENSION} -O app.zip
else
  wget --user=$NEXUS_USER --password=$NEXUS_PASSWORD ${NEXUS_URL}/service/local/artifact/maven/content?r=${NEXUS_REPOSITORY}"&g"=${ARTIFACT_GROUP}"&a"=${ARTIFACT_NAME}"&v"=${ARTIFACT_VERSION} -O app.jar
fi

if $IS_ZIP ; then
  unzip app.*
  cd upp*
  cd bin
  ./${ARTIFACT_NAME}
else
  java -jar ${JAVA_OPTIONS} app.jar ${ARGS}
fi
