FROM golang:1.17.2
# nodejs
WORKDIR /tmp
ENV NODE_FILE=node-v16.13.1-linux-x64.tar.gz
RUN curl -fsSLO --compressed "https://nodejs.org/dist/latest-v16.x/$NODE_FILE" \
    && tar -xvf $NODE_FILE -C /usr/local --strip-components=1 --no-same-owner \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && node --version \
    && npm --version
# yarn
RUN npm install -g yarn \
    && yarn --version
# vim
RUN apt update
RUN apt install -y vim
# unzip
RUN apt install -y unzip
# grpc
# protoc
RUN mkdir protoc
RUN cd protoc && wget https://github.com/protocolbuffers/protobuf/releases/download/v3.19.1/protoc-3.19.1-linux-x86_64.zip
RUN cd protoc && unzip protoc-3.19.1-linux-x86_64.zip
RUN cp protoc/bin/* /usr/local/bin
# protoc-gen-go-grpc
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
# protoc-gen-go
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26

RUN mkdir /root/workspace
WORKDIR /root/workspace