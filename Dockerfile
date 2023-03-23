# start with the Jenkins base Image
FROM jenkins/jenkins:lts-jdk11

USER root

# install python3
RUN apt update && \
    apt install -y python3

# build of jenkins with the preconfigured job
COPY python-job.xml /usr/share/jenkins/ref/jobs/python-job/config.xml

# install the plugins we need
RUN jenkins-plugin-cli --plugins git matrix-auth workflow-aggregator credentials-binding authorize-project

# set up environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# set the admin user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /var/jenkins_home
