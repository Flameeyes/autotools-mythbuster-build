# SPDX-FileCopyrightText: 2023 Diego Elio Pettenò
#
# SPDX-License-Identifier: 0BSD

FROM ubuntu:20.04

WORKDIR /app

COPY . .
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y --no-install-recommends docbook-xsl-ns xsltproc sassc make git ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && git config --add advice.detachedHead false
ENTRYPOINT [ "./fetch-and-build.sh" ]
