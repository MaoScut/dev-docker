FROM golang:1.17.2
WORKDIR /tmp
ENV NODE_FILE=node-v16.13.1-linux-x64.tar.gz
RUN curl -fsSLO --compressed "https://nodejs.org/dist/latest-v16.x/$NODE_FILE" \
    && tar -xvf $NODE_FILE -C /usr/local --strip-components=1 --no-same-owner \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && node --version \
    && npm --version
RUN npm install -g yarn \
    && yarn --version
RUN mkdir /root/workspace
WORKDIR /root/workspace