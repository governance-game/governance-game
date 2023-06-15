#!/bin/bash
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2019-2023 The Foundation for Public Code <info@publiccode.net>

# The serve.sh script can be used to preview how Jekyll will build the site.

# if PAGES_REPO_NWO is not set, then set it to the publiccodenet repository
# (jekyll defaults to "origin" if a remote of that name exists,
# which makes sense for a true fork, but not for most contributors)
if [ "_${PAGES_REPO_NWO}_" == "__" ]; then
export PAGES_REPO_NWO=publiccodenet/governance-game
fi

bundle exec jekyll serve --livereload
