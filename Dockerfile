# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine

RUN apk update && apk add bash
RUN mkdir /nativeConfig
COPY ${project.basedir}/src/main/resources/nativeConfig/application.properties /nativeConfig
# COPY src/main/resources/nativeConfig/application.properties /nativeConfig
# COPY src/main/resources/nativeConfig/photoAppLogstash.conf /nativeConfig
# COPY src/main/resources/nativeConfig/users-ws.properties /nativeConfig

ARG JAR_FILE=target/config-server-0.0.1-SNAPSHOT.jar

COPY ${JAR_FILE} config-server.jar

# run application with this command line
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "config-server.jar"]

EXPOSE 8012
