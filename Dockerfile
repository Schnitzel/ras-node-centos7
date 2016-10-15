
# test
FROM openshift/base-centos7

# TODO: Put the maintainer name in the image metadata
# MAINTAINER Your Name <your@email.com>

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

LABEL io.openshift.s2i.scripts-url="file://.s2i/bin"

# TODO: Install required packages here:
RUN \
    wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo && \
    curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - && \
    yum install -y \
                ocaml \
                elfutils-libelf-devel \
                nodejs \
                git \
                yarn \
                && \
    yum clean all -y

# This default user is created in the openshift/base-centos7 image
USER 1001
