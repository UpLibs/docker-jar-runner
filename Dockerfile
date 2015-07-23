FROM java:7

ENV DEBIAN_FRONTEND noninteractive

VOLUME /tmp

COPY app/* /tmp/

RUN chmod 775 /tmp
RUN chmod a+x /tmp/app.sh
RUN apt-get update && apt-get install -y wget && apt-get install -y unzip

EXPOSE 8080

ENTRYPOINT ["sh","/tmp/app.sh"]