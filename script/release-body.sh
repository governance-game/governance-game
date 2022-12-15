#!/bin/bash
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022 The Foundation for Public Code <info@publiccode.net>

# Create a 'release.body' file for the text describing a release

VERSION=$(script/version.sh)
echo "# Governance Game version $VERSION" > release.body
if ! grep -q "$VERSION" CHANGELOG.md; then
	echo "" >> release.body
	git log -1 | head -n1 >> release.body
	exit
fi

START=$(grep "$VERSION" CHANGELOG.md | head -n1)
NEXT=$(grep '##' CHANGELOG.md | head -n2 | tail -n1)
sed -n "/$START/,/$NEXT/p" CHANGELOG.md | grep -v '^##' >> release.body
