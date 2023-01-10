#!/bin/bash
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022 The Foundation for Public Code <info@publiccode.net>

# Print the first git tag, or the hash of the commit if no tag

GIT_HASH=$( git log -n1 --pretty='%h' )
TAG=$( git describe --exact-match --tags ${GIT_HASH} 2>/dev/null | head -n1 )

if [ "_${TAG}_" != "__" ]; then
	echo "$TAG"
else
	echo "$GIT_HASH"
fi
