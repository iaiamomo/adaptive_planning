FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

WORKDIR /home/default

RUN apt-get update &&\
    apt-get install -y \
        python3 \
        python3-pip \
        git \
        cmake \
        lsof \
        sudo \
        less \
        nano \
        vim \
        wget &&\
    apt-get clean &&\
    rm -rf /var/cache

RUN git clone https://github.com/iaiamomo/adaptive_planning.git

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /home/default/adaptive_planning

RUN cd /home/default/adaptive_planning/downward &&\
    ./build.py &&\
    cd /home/default/adaptive_planning/industrial_services/actors_api_plan/openapi_client_script &&\
    chmod +x generate-openapi-client.sh &&\
    ./generate-openapi-client.sh &&\
    cd /home/default &&\
    mkdir -p /home/default/results

EXPOSE 8080 8765