FROM maven AS build

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN mvn clean install

FROM openjdk

WORKDIR /app

COPY --from=build /usr/src/app/target/SAMIR-1.0.0-SNAPSHOT.jar /app

CMD ["java", "-jar", "SAMIR-1.0.0-SNAPSHOT.jar"]
