#!/bin/bash
# SPDX-FileCopyrightText: 2023 Diego Elio Pettenò
#
# SPDX-License-Identifier: 0BSD

set -ex

: ${AUTOTOOLS_MYTHBUSTER_CHECKOUT_PATH:=/srv/autotools.info}
: ${AUTOTOOLS_MYTHBUSTER_REPOSITORY:=https://github.com/flameeyes/autotools-mythbuster}
: ${AUTOTOOLS_MYTHBUSTER_BRANCH:=main}

mkdir -p "$(dirname "${AUTOTOOLS_MYTHBUSTER_CHECKOUT_PATH}")"
git -C "${AUTOTOOLS_MYTHBUSTER_CHECKOUT_PATH}" fetch || \
    git clone "${AUTOTOOLS_MYTHBUSTER_REPOSITORY}" "${AUTOTOOLS_MYTHBUSTER_CHECKOUT_PATH}"

git -C "${AUTOTOOLS_MYTHBUSTER_CHECKOUT_PATH}" checkout "origin/${AUTOTOOLS_MYTHBUSTER_BRANCH}"

make -C "${AUTOTOOLS_MYTHBUSTER_CHECKOUT_PATH}" all
