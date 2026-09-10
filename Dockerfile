# syntax=docker/dockerfile:1

FROM node:20-alpine AS frontend-build
WORKDIR /web
COPY sospets.web/package*.json ./
RUN npm ci
COPY sospets.web/ ./
ARG REACT_APP_API_URL=""
ENV REACT_APP_API_URL=$REACT_APP_API_URL
RUN npm run build

FROM eclipse-temurin:21-jdk-jammy AS backend-build
WORKDIR /app
COPY sospets.api/.mvn/ .mvn
COPY sospets.api/mvnw sospets.api/pom.xml ./
RUN chmod +x mvnw && ./mvnw dependency:go-offline
COPY sospets.api/src ./src
COPY --from=frontend-build /web/build ./src/main/resources/static
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY --from=backend-build /app/target/sos-pets-0.0.1-SNAPSHOT.jar ./app.jar

EXPOSE 8080

ENV SPRING_PROFILES_ACTIVE=docker

CMD ["java", "-jar", "app.jar"]
