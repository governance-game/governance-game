# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022-2024 The Foundation for Public Code <info@publiccode.net>

# Generate numbered PDFs and png files based on the PDFs provided

# help set
#       -e  Exit immediately if a command exits with a non-zero status.
#       -x  Print commands and their arguments as they are executed.
if [ "_${VERBOSE}_" != "__" ] && [ "${VERBOSE}" -gt 0 ]; then
	set -x
fi
set -e

# shift-off the first param, the card name
CARD=$1
shift
# echo "CARD:$CARD"
# the remaining params are the full list of cards

DIRECTORY=$(echo $CARD | cut -d'/' -f1)
CARD_PDF=$(echo $CARD | cut -d'/' -f2)


function card_front() {
	card=$1
	NUM=$2
	mkdir -pv num-front
	cp -v $card num-front/${NUM}.pdf

	mkdir -pv num-front-png
	inkscape --export-type=png \
		 --export-width=816 \
		 --export-height=1110 \
		 --export-dpi=300 \
		 --export-filename=num-front-png/${NUM}.png \
				   num-front/${NUM}.pdf
	ls num-front-png/${NUM}.png

	mkdir -pv num-front-vector
	inkscape --export-text-to-path \
		--export-filename=num-front-vector/${NUM}.vector.pdf \
		num-front/${NUM}.pdf
	ls num-front-vector/${NUM}.vector.pdf
}

function card_back() {
	card=$1
	NUM=$2
	export PREFIX=`echo $card | cut -f1 -d'-'`
	mkdir -pv num-back
	cp -v $PREFIX-back.pdf num-back/${NUM}.pdf

	mkdir -pv num-back-png
	inkscape --export-type=png \
		 --export-width=816 \
		 --export-height=1110 \
		 --export-dpi=300 \
		 --export-filename=num-back-png/${NUM}.png \
			   num-back/${NUM}.pdf
	ls num-back-png/${NUM}.png
}

export NUM=0;
for card in $@; do
	if [[ "$card" != *back.pdf ]]; then
		export NUM=$(( $NUM + 1 ))
		if [ "$NUM.pdf" == "$CARD_PDF" ]; then
			if [ "$DIRECTORY" == "num-front" ]; then
				card_front $card $NUM
			else
				card_back $card $NUM
			fi
		fi
	fi
done
