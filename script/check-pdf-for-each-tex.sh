# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022-2024 The Foundation for Public Code <info@publiccode.net>

# Verify that for each card front in the "cards" directory and each card
# back in the "assets" directory has a corresponding PDF

# help set
#       -e  Exit immediately if a command exits with a non-zero status.
#       -x  Print commands and their arguments as they are executed.
if [ "_${VERBOSE}_" != "__" ] && [ "${VERBOSE}" -gt 0 ]; then
	set -x
fi
set -e

NUM_EXPECTED=$( ls cards/*.tex assets/*back.svg | wc --words )
NUM_CARDS=$( ls *.pdf | grep -v governance-game-box | wc --words)
if [ "$NUM_EXPECTED" -ne "$NUM_CARDS" ]; then
	echo "expected $NUM_EXPECTED but was $NUM_CARDS"
	exit 1
else
	echo "expected $NUM_EXPECTED and was $NUM_CARDS"
fi
