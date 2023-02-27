# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022-2023 The Foundation for Public Code <info@publiccode.net>

# checks that the .pdf (or each in a list of .pdf files) has only 1 page

# help set
#       -e  Exit immediately if a command exits with a non-zero status.
#       -x  Print commands and their arguments as they are executed.
if [ "_${VERBOSE}_" != "__" ] && [ "${VERBOSE}" -gt 0 ]; then
	set -x
fi
set -e

ERRORS=0
for file in $@; do
	PAGES=$( qpdf --show-npages $1 )
	if [ "$PAGES" -ne "1" ]; then
		echo "$file has $PAGES pages"
		ERRORS=$(( $ERRORS + 1 ))
	fi
done

if [ $ERRORS -gt 0 ]; then
	exit 1
fi
