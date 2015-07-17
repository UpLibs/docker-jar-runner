FROM java:7

ENV DEBIAN_FRONTEND noninteractive

VOLUME /tmp
VOLUME /app

COPY app/* /app/

RUN chmod 775 /app
RUN chmod +x /app/*
RUN apt-get update && apt-get install -y wget && apt-get install -y unzip

EXPOSE 8080

ENTRYPOINT ["sh","/app/app.sh"]