FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        nano \
        telnet\
        mutt\
        vim-tiny \
        iputils-ping \
        dnsutils \
        ssmtp \
        swaks\
        mailutils\
        && rm -rf /var/lib/apt/lists/*

# ajout utilisateurs
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
RUN useradd -ms /bin/bash simon
RUN useradd -ms /bin/bash sebastien
RUN useradd -ms /bin/bash julien

# configuration muttrc pour les pc
COPY /muttrc/.muttrc_simon /home/simon/.muttrc
COPY /muttrc/.muttrc_julien /home/julien/.muttrc
COPY /muttrc/.muttrc_sebastien /home/sebastien/.muttrc


CMD ["tail", "-f", "/dev/null"]