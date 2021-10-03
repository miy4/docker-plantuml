FROM docker.io/alpine:3

ENV PLANTUML_VERSION 1.2021.9
ENV LANG en_US.UTF-8
RUN apk add --no-cache openjdk8-jre graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl

ENTRYPOINT [ "java", "-jar", "/app/plantuml.jar" ]
CMD [ "-h" ]
