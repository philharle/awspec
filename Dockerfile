#
# awspec Dockerfile
#
# https://github.com/philharle/awspec
#
# AUTHOR:   Phil Harle
#
# Installs awspec: Allows you to execute RSpec tests against your AWS environments from within a Docker container
#
# awspec: https://github.com/k1LoW/awspec
#

FROM ruby:2.5-alpine
MAINTAINER Phil Harle

LABEL org.label-schema.schema-version="1.0" \
org.label-schema.build-date="unknown" \
org.label-schema.version="unknown" \
org.label-schema.name="docker-awspec" \
org.label-schema.description="ruby 2.5 alpine docker image with awspec binary loaded. Primary use is AWS resource testing in CI pipeline."

ENV TZ=Europe/London
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && echo "$TZ" > /etc/timezone

RUN "gem install bundle --no-format-exec"
RUN "gem install awspec --no-format-exec"
RUN "gem install rake --no-format-exec"

WORKDIR /tmp
