FROM maven:latest

RUN mkdir --parents /home/DockerCloudTest

VOLUME "/usr/share/maven/ref/repository/"

#resolve dependancies
WORKDIR /home/DockerCloudTest
COPY pom.xml ./

#RUN cd /home/DockerCloudTest && mvn dependency:go-offline
#RUN mvn -B -f /home/DockerCloudTest/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
#RUN cd /home/DockerCloudTest && mvn dependency:go-offline --fail-never
RUN cd /home/DockerCloudTest && mvn dependency:go-offline

#compile the code (build fatjar)
ADD . ./
RUN ["mvn", "package"]

#copy fatjar to a separate folder
RUN cp /home/DockerCloudTest/target/DockerCloudTest-0.0.1-SNAPSHOT.jar /home/

#delete the code
WORKDIR /home
RUN ["rm", "-rf", "DockerCloudTest"]

#expose default spring boot port
EXPOSE 8080

#run this damn thing
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
CMD ["java", "-jar", "/home/DockerCloudTest-0.0.1-SNAPSHOT.jar"]

#https://keyholesoftware.com/2015/01/05/caching-for-maven-docker-builds/
