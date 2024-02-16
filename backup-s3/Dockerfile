FROM ghcr.io/hassio-addons/base:15.0.7

ENV LANG C.UTF-8

# add aws-cli and deps
RUN apk --no-cache add python3 py3-pip && pip3 install -U pip awscli

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
