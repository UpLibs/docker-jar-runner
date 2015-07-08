This image download a .Jar from Nexus and run it.

#Environment

- $NEXUS_USER = (user)
- $NEXUS_PASSWORD = (password)
- $NEXUS_URL = (url)
- $NEXUS_REPOSITORY = (repository)
- $NEXUS_GROUP = (group)
- $NEXUS_ARTIFACT = (artifact)
- $NEXUS_VERSION = (version)
- $JAVA_OPTIONS = (options to run jar)
- $ARGS = (jar arguments)

#How to run

docker run -e NEXUS_USER=yourusername -e NEXUS_PASSWORD=yourpassword -e NEXUS_URL=http://nexus.domain.com -e NEXUS_REPOSITORY=releases -e NEXUS_GROUP=com.domain -e NEXUS_ARTIFACT=your-artifact -e NEXUS_VERSION=latest -e JAVA_OPTIONS=-verbose -e ARGS=args uppoints/docker-nexus-jar-runner