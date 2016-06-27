This image was designed to allow easy deployment of standalone Java applications. 

Provided some environment properties, it is capable of downloading a distribution (zip or jar), from a [Nexus](http://www.sonatype.org/nexus/) repository manager or [Azure](https://azure.microsoft.com/en-us/documentation/services/storage/) storage service, and runnning it.

# Necessary Environment Properties

## General
- $STORAGE = Indicates if the artifact is stored on 'nexus' or 'azure'
- $ACCOUNT = This can be a Nexus' user name or a Azure storage account name
- $PASSWORD = This is the Nexus user's password or the  Azure storage account's key
- $REPOSITORY = This is the Nexus's repository's name or the Azure storage account's container's name

## Nexus-related
- $NEXUS_URL = Nexus' base URL

## Artifact-related
- $ARTIFACT_GROUP = The artifact's group. Not needed when artifact is stored on Azure
- $ARTIFACT_NAME = The artifact's name
- $ARTIFACT_VERSION = The artifact's version to be downloaded
- $ARTIFACT_EXTENSION = The artifact's filex extension. Only necessary when packaged as zip, as Nexus' default is jar

# Optional Environment Properties
- $JAVA_OPTIONS = Extra Java options to be declared when running the jar (not available when running from zip)
- $ARGS = Arguments to be passed to the jar (not available when running from zip)
- Any other environment property you might want to set in your environment

# How to run

- For artifacts stored on Nexus:
```
docker run -e STORAGE=nexus -e ACCOUNT=username -e PASSWORD=userpassword -e NEXUS_URL=http://nexus.domain.com -e REPOSITORY=releases -e ARTIFACT_GROUP=com.domain -e ARTIFACT_NAME=your-artifact-name -e ARTIFACT_VERSION=the-desired-version -e FILE_EXTENSION=zip -e YOUR_PROPERTY=props-value uppoints/docker-jar-runner
```

- For artifacts stored on Azure:
```
docker run -e STORAGE=azure -e ACCOUNT=accountname -e PASSWORD=accountkey -e REPOSITORY=container-name -e ARTIFACT_NAME=your-artifact-name -e ARTIFACT_VERSION=the-desired-version -e FILE_EXTENSION=zip -e YOUR_PROPERTY=props-value uppoints/docker-jar-runner
```
