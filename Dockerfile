FROM buildpack-deps:stretch-scm

RUN apt-get update && apt-get install -y rsync

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
