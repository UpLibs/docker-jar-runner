This docker image downloads a maven distribution from a Nexus repository manager and runs it.

# Necessary environment properties
- $NEXUS_URL = The url of the Nexus repository manager
- $NEXUS_REPOSITORY = The name of the repository on Nexus
- $NEXUS_USER = The nexus' user that will be used to download the distribution
- $NEXUS_PASSWORD = The user's password

- $ARTIFACT_GROUP = The distribution's group name
- $ARTIFACT_NAME = The distribution's artifact name
- $ARTIFACT_VERSION = The distribution's version

# Optional environment properties
- $FILE_EXTENSION = Used to declare if the distribution is packaged as ZIP or JAR
- $JAVA_OPTIONS = If the distribution is packaged as a JAR file, you can use this to declare the JVM options to be used when the JAR runs
- $ARGS = As above, you can declare arguments for the JAR using this property

# Other environment properties
- Feel free to set any environment property when running this docker image, in case your distribution relies on any properties

# Usage example
docker run -e NEXUS_USER=yourusername -e NEXUS_PASSWORD=yourpassword -e NEXUS_URL=http://nexus.domain.com -e NEXUS_REPOSITORY=releases -e ARTIFACT_GROUP=com.domain -e$ARTIFACT_NAME=your-artifact -e ARTIFACT_VERSION=desired-version -e JAVA_OPTIONS=-verbose -e ARGS=exampleargs -e FILE_EXTENSION=zip -e UPPOINTS_ENV=PROD uppoints/docker-nexus-jar-runner
