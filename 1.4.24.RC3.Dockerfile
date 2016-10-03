FROM anapsix/alpine-java
MAINTAINER Justin Commu

RUN mkdir /allure
RUN mkdir /allure-results
RUN mkdir /allure-report

RUN apk update && \
	apk add ca-certificates && \
	update-ca-certificates && \
	apk add openssl && \
	apk add unzip

RUN wget https://github.com/allure-framework/allure-core/releases/download/allure-core-1.4.24.RC3/allure-commandline.zip
RUN unzip allure-commandline.zip -d /allure
RUN rm allure-commandline.zip
ENV PATH="/allure/bin:${PATH}"



