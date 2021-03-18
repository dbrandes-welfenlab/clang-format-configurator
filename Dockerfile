FROM ubuntu:20.04

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_10.x  | bash - && \ 
    apt-get --no-install-recommends -y install nodejs bsdmainutils wget git cmake make gawk g++ && \
    apt-get clean && \
    apt-get autoremove

RUN mkdir -p /clang-format-configurator

COPY client               /clang-format-configurator/client
COPY server               /clang-format-configurator/server
COPY config.json          /clang-format-configurator/config.json
COPY entrypoint.sh        /clang-format-configurator/entrypoint.sh
COPY get_clang_version.js /clang-format-configurator/get_clang_version.js
COPY package.json         /clang-format-configurator/package.json
COPY parser.awk           /clang-format-configurator/parser.awk
COPY setup.sh             /clang-format-configurator/setup.sh

WORKDIR /clang-format-configurator

RUN npm install got xpath xmldom cheerio

RUN chmod +x setup.sh && npm install

RUN ./setup.sh

ENTRYPOINT [ "./entrypoint.sh" ]
