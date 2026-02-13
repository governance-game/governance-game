# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2023-2024 The Foundation for Public Code <info@publiccode.net>

# help set
#       -e  Exit immediately if a command exits with a non-zero status.
#       -x  Print commands and their arguments as they are executed.
if [ "_${VERBOSE}_" != "__" ] && [ "${VERBOSE}" -gt 0 ]; then
	set -x
fi
set -e

ERRORS=0
for file in "$@"; do
	name=$(basename -- "$file")
	extension="${name##*.}"

	if [ "$extension" == "tex" ]; then
		MODE=--mode=tex
	elif [ "$extension" == "md" ]; then
		MODE=--mode=markdown
	fi
	WORDS=$( aspell $MODE --master=en \
		--home-dir=.  --personal=jargon.txt \
		list < $file )
	if [ $(echo "$WORDS" | wc -w) -gt 0 ]; then
		echo "FAIL: $file spell check: $WORDS"
		ERRORS=$(( $ERRORS + 1 ))
	fi
done
if [ $ERRORS -gt 0 ]; then
	exit 1
fi
