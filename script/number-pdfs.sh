# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022-2023 The Foundation for Public Code <info@publiccode.net>

# Generate numbered PDFs and png files based on the PDFs provided

# help set
#       -e  Exit immediately if a command exits with a non-zero status.
#       -x  Print commands and their arguments as they are executed.
if [ "_${VERBOSE}_" != "__" ] && [ "${VERBOSE}" -gt 0 ]; then
	set -x
fi
set -e

mkdir -pv num-front
mkdir -pv num-back
export NUM=0; for card in $@; do
	if [[ "$card" != *back.pdf ]]; then
		export NUM=$(( $NUM + 1 ))
		cp -v $card num-front/${NUM}.pdf
		inkscape --export-type=png \
			 --export-width=816 \
			 --export-height=1110 \
			 --export-dpi=300 \
			 --export-filename=num-front/${NUM}.png \
					   num-front/${NUM}.pdf
		ls num-front/${NUM}.png

		export PREFIX=`echo $card | cut -f1 -d'-'`
		cp -v $PREFIX-back.pdf num-back/${NUM}.pdf
		inkscape --export-type=png \
			 --export-width=816 \
			 --export-height=1110 \
			 --export-dpi=300 \
			 --export-filename=num-back/${NUM}.png \
					   num-back/${NUM}.pdf
		ls num-back/${NUM}.png
	fi
done
ls -1 num-front/* num-back/*
