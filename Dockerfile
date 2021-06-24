FROM ubuntu

MAINTAINER ALEKSEY VASILEV <enthusiastic.programmer@yandex.ru>

RUN apt-get update && apt-get install -y \
	openjdk-16-jdk-headless &&\
	apt-get clean &&\
	cd home &&\
	mkdir apps

ADD testapp /home/apps/firstproject

RUN cd /home/apps/firstproject &&\
	./gradlew jar

ENTRYPOINT ["java","-jar","/home/apps/firstproject/build/libs/app.jar"]