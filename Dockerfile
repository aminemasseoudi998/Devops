FROM openjdk:11
COPY target/*.jar /
ENTRYPOINT ["java", "-jar","/Devops-Integration-1.0.jar"]
EXPOSE 8080
