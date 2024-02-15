FROM linkstackorg/linkstack:latest

# renovate: datasource=github-releases depName=LinkStackOrg/LinkStack
ENV LINKSTACK_VERSION=v4.7.6

ADD https://github.com/LinkStackOrg/LinkStack/releases/download/${LINKSTACK_VERSION}/linkstack.zip /tmp/linkstack.zip
RUN rm -r /htdocs && \
    # extract only linkstack dir to /htdocs
    unzip /tmp/linkstack.zip 'linkstack/*' -d /tmp && \
    mv /tmp/linkstack /htdocs && \
    chown -R apache:apache /htdocs && \
    rm /tmp/linkstack.zip
