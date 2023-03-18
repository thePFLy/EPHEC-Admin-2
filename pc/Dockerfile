FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        nano \
        telnet \
        vim-tiny \
        iputils-ping \
        dnsutils \
        ssmtp \
        && rm -rf /var/lib/apt/lists/*
        
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

CMD ["tail", "-f", "/dev/null"]