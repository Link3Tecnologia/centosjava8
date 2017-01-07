# link3/centos:7
FROM centos:7.3.1611
ENV JDK_VERSION=8u111
ENV BUID=14
ENV FILE_NAME=jdk-$JDK_VERSION-linux-x64.tar.gz
ENV JAVA_PATH=jdk1.8.0_111
WORKDIR  /opt
RUN yum -y update
RUN yum -y install wget
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-b$BUID/$FILE_NAME"
RUN tar xzf $FILE_NAME
RUN touch /etc/profile.d/java_envs.sh
RUN chmod +x /etc/profile.d/java_envs.sh
ENV JAVA_HOME=/opt/$JAVA_PATH
ENV JRE_HOME=$JAVA_HOME/jre
RUN echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile.d/java_envs.sh
RUN echo "export JRE_HOME=$JRE_HOME" >> /etc/profile.d/java_envs.sh
RUN echo "export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin" >> /etc/profile.d/java_envs.sh
