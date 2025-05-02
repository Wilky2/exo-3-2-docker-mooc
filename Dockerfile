#docker file
FROM amazoncorretto:17

EXPOSE 8080

WORKDIR /usr/src/app

RUN yum install -y tar && yum install -y gzip

COPY . .

RUN chmod +x ./mvnw

RUN ./mvnw package

ENTRYPOINT ["java"]

CMD ["-jar", "./target/docker-example-0.0.1-SNAPSHOT.jar"]