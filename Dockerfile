FROM anapsix/alpine-java:latest
MAINTAINER miy4 <miy4t7l@gmail.com>

ENV PLANTUML_VERSION 1.2018.14
ENV LANG en_US.UTF-8
RUN apk add --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl \ 
    && mkdir /app/skinparams

COPY resources/*.skinparam /app/skinparams

ENTRYPOINT ["java","-jar","/app/plantuml.jar","-I/app/skinparams/*.skinparam"]
CMD [ "-h" ]
# ENTRYPOINT ["cat"]
