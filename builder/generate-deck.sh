#!/bin/bash
# Script to generate a deck of cards used for personal or professional printer
#
#

if [ "_${VERBOSE}_" != "__" ] && [ $VERBOSE -gt 0 ]; then
# help set
#  -x  Print commands and their arguments as they are executed
set -x
fi

echo "Clean up old generated assets"

rm -rf assets
mkdir assets
rm -rf outputdeck
mkdir outputdeck

INKSCAPE_VERSION=`inkscape --version | sed 's/Inkscape \([0-9\.]*\) .*/\1/'`
INKSCAPE_MAJOR_VERSION=`echo "$INKSCAPE_VERSION" | cut -f1 -d'.'`
INKSCAPE_MINOR_VERSION=`echo "$INKSCAPE_VERSION" | cut -f2 -d'.'`
INKSCAPE_PATCH_VERSION=`echo "$INKSCAPE_VERSION" | cut -f3 -d'.'`
if [ "_${VERBOSE}_" != "__" ] && [ $VERBOSE -gt 0 ]; then
	cat <<END_OF_DOC
INKSCAPE_VERSION: $INKSCAPE_VERSION
INKSCAPE_MAJOR_VERSION: $INKSCAPE_MAJOR_VERSION
INKSCAPE_MINOR_VERSION: $INKSCAPE_MINOR_VERSION
INKSCAPE_PATCH_VERSION: $INKSCAPE_PATCH_VERSION
END_OF_DOC
fi

function inkscape_convert_svg_to_png() {
	svg_path=$1
	png_path=assets/"$(basename -s .svg "$svg_path")".png
	echo Converting image $svg_path to $png_path
	if [ $INKSCAPE_MAJOR_VERSION -gt 0 ]; then
		inkscape \
			--export-area-drawing \
			$svg_path \
			--export-dpi=1200 \
			--export-filename=$png_path
	else
		inkscape \
			   --without-gui \
			   --export-area-drawing \
			   --export-dpi=1200 \
			   --file=$svg_path \
			   --export-png=$png_path \
			   --export-png
	fi
	if [ "_${VERBOSE}_" != "__" ] && [ $VERBOSE -gt 0 ]; then
		ls -l $png_path
	fi
	echo "[DONE]"
}

echo "Converting SVG image assets to LaTeX"

for filename in ../assets/*.svg; do
	inkscape_convert_svg_to_png $filename
done

echo "Building cards..."

for filename in ../cards/*.md; do
	echo  Building card: outputdeck/"$(basename "$filename" .md)".pdf
	pandoc \
		--from=markdown+yaml_metadata_block \
		--template card-front.tex \
		-o outputdeck/"$(basename "$filename" .md)".pdf \
		-V monofont="DejaVu Sans Mono" \
		--pdf-engine=xelatex $filename
done
#  pandoc --from=markdown+yaml_metadata_block --template card.tex -o outputdeck/bug.pdf --pdf-engine=xelatex ../cards/bug.md
#  -V mainfont="DejaVu Serif" \
#  -V monofont="DejaVu Sans Mono" \
