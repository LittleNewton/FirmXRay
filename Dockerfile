FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    zsh \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /FirmXRay

COPY . .

ENV JAVA_HOME=/FirmXRay/jdk-11.0.1
ENV PATH=$JAVA_HOME/bin:$PATH

RUN make
