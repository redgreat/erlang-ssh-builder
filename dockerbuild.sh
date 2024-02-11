#!/usr/bin/env bash
# docker build script

docker pull erlang:26.2.1-alpine

docker build -t erlang-ssh-buider:26.2.1-alpine .

docker build -t erlang-ssh-buider:26.2.1-alpine . --build-arg SSH_KEY="$(cat ~/.ssh/id_rsa)" --build-arg PUB_KEY="$(cat ~/.ssh/id_rsa.pub)"

docker run -itd --name erlang-ssh-buider erlang-ssh-buider:26.2.1-alpine

docker tag erlang-ssh-buider:26.2.1-alpine redgreat/erlang-ssh-buider:26.2.1-alpine

docker push redgreat/erlang-ssh-buider:26.2.1-alpine