FROM java:8-jdk

RUN apt-get update

#install maven
RUN apt-get install -y maven

#get the code
RUN git clone https://github.com/WrRaThY/DockerCloudTest.git /home/DockerCloudTest

#resolve dependancies and compile the code
WORKDIR /home/DockerCloudTest
ADD pom.xml /home/DockerCloudTest/pom.xml
RUN cd /home/DockerCloudTest && mvn dependency:go-offline

ADD . /home/DockerCloudTest
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