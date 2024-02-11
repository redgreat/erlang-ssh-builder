FROM erlang:26.2.1-alpine

ARG SSH_KEY
ARG PUB_KEY

RUN mkdir /root/.ssh
WORKDIR /root/.ssh

RUN apk add --no-cache git openssh-client

RUN echo $SSH_KEY \
    && echo $SSH_KEY > /root/.ssh/id_rsa \
    && sed -i -e 's/-----BEGIN OPENSSH PRIVATE KEY----- //g' -e 's/ -----END OPENSSH PRIVATE KEY-----//g' -e 's/ /\n/g' -e '1i\-----BEGIN OPENSSH PRIVATE KEY-----' -e '$a\-----END OPENSSH PRIVATE KEY-----' id_rsa \
    && echo $PUB_KEY > /root/.ssh/id_rsa.pub \
    && chmod 600 /root/.ssh/id_rsa \
    && chmod 644 /root/.ssh/id_rsa.pub

RUN ssh-keyscan github.com > /root/.ssh/known_hosts