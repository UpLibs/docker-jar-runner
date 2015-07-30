This image was designed to allow easy deployment of standalone applications. 

Provided some environment properties, it is capable of downloading a distribution (zip or jar), from a [Nexus](http://www.sonatype.org/nexus/) repository manager, and runnning it.

# Necessary Environment Properties

## Nexus-related
- $NEXUS_URL = Nexus' base URL
- $NEXUS_USER = Nexus' username with necessary permissions to download the distribution
- $NEXUS_PASSWORD = User's password
- $NEXUS_REPOSITORY = Nexus' repository's name, where the distribution is located

## Artifact-related
- $ARTIFACT_GROUP = The artifact's group
- $ARTIFACT_NAME = The artifact's name
- $ARTIFACT_VERSION = The artifact's version to be downloaded
- $ARTIFACT_EXTENSION = The artifact's filex extension. Only necessary when packaged as zip, as Nexus' default is jar

# Optional Environment Properties
- $JAVA_OPTIONS = Extra Java options to be declared when running the jar (not available when running from zip)
- $ARGS = Arguments to be passed to the jar (not available when running from zip)
- Any other environment property you might want to set in your environment

# How to run
```
docker run -e NEXUS_USER=yourusername -e NEXUS_PASSWORD=yourpassword -e NEXUS_URL=http://nexus.domain.com -e NEXUS_REPOSITORY=releases -e ARTIFACT_GROUP=com.domain -e ARTIFACT_NAME=your-artifact -e ARTIFACT_VERSION=desired-version -e FILE_EXTENSION=zip -e YOUR_PROPERTY=props-value uppoints/docker-nexus-jar-runner
```
