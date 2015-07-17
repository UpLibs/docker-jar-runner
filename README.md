This image download a .Jar from Nexus and run it.

# Environment

- $NEXUS_USER = (user)
- $NEXUS_PASSWORD = (password)
- $NEXUS_URL = (url)
- $NEXUS_REPOSITORY = (repository)
- $NEXUS_GROUP = (group)
- $NEXUS_ARTIFACT = (artifact)
- $NEXUS_VERSION = (version)
- $JAVA_OPTIONS = (options to run jar) (OPTIONAL)
- $ARGS = (jar arguments) (OPTIONAL)
- $FILE_EXTENSION = (zip or jar) (OPTIONAL)
- $UPPOINTS_ENV = (environment) (OPTIONAL)

# How to run

docker run -e NEXUS_USER=yourusername -e NEXUS_PASSWORD=yourpassword -e NEXUS_URL=http://nexus.domain.com -e NEXUS_REPOSITORY=releases -e NEXUS_GROUP=com.domain -e NEXUS_ARTIFACT=your-artifact -e NEXUS_VERSION=latest -e JAVA_OPTIONS=-verbose -e ARGS=args -e FILE_EXTENSION=zip -e UPPOINTS_ENV=PROD uppoints/docker-nexus-jar-runner