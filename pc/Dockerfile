FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        nano \
        telnet\
        vim-tiny \
        iputils-ping \
        dnsutils \
        ssmtp \
        mailutils\
        && rm -rf /var/lib/apt/lists/*
        
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
RUN useradd -ms /bin/bash simon
RUN useradd -ms /bin/bash sebastien

CMD ["tail", "-f", "/dev/null"]