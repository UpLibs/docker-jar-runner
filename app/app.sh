#!/usr/bin/env bash

cd /app

wget --user=$NEXUS_USER --password=$NEXUS_PASSWORD ${NEXUS_URL}/service/local/artifact/maven/content?r=${NEXUS_REPOSITORY}"&g"=${NEXUS_GROUP}"&a"=${NEXUS_ARTIFACT}"&v"=${NEXUS_VERSION} -O app.jar
java -jar ${JAVA_OPTIONS} app.jar ${ARGS}