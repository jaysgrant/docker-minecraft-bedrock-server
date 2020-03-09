FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.0.0 && \
    rm -rf /var/lib/apt/lists/*

ARG MCPORT
ARG MCUSER
ARG MCGROUP
ARG MCVERSION
ARG CURLURL
ARG SERVERFOLDER

ENV MCUSER=${MCUSER:-1240}
ENV MCGROUP=${MCGROUP:-1240}
ENV MCPORT=${MCPORT:-19132}
ENV MCVERSION=${MCVERSION:-"1.14.32.1"}
ENV CURLURL=${CURLURL:-"https://minecraft.azureedge.net/bin-linux/bedrock-server-"}
ENV SERVERFOLDER="/srv/mc_bedrock"

RUN curl $CURLURL$MCVERSION --output $SERVERFOLDER/bedrock.zip  && \
    unzip -o $SERVERFOLDER/bedrock.zip -d $SERVERFOLDER && \
    rm $SERVERFOLDER/bedrock.zip
