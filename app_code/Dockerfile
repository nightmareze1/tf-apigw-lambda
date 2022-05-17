FROM python:3.9.12

RUN apt-get update && \
    apt-get install unzip zip -y

WORKDIR /src

COPY . ./

RUN make

RUN rm -rf 

RUN ls -la 
