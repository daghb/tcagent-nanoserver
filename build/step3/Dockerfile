FROM tctest/updatednanoserver

ENV JAVA_PKG=jdk8-8u144.tar.gz JAVA_HOME=C:\\jdk8-8u144
ADD $JAVA_PKG /
RUN setx /M PATH %PATH%;%JAVA_HOME%\bin
