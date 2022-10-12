#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
RUN mkdir /app && chmod -R 777 /app
WORKDIR /app
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /app/target/shopping-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]

