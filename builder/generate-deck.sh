#!/bin/bash
# Script to generate a deck of cards used for personal or professional printer
#
#
echo "Clean up old generated assets"

rm -rf assets
mkdir assets
rm -rf outputdeck
mkdir outputdeck


echo "Converting SVG image assets to LaTeX"

for filename in ../assets/*.svg; do
  echo Converting image $filename to PNG
#inkscape -z -D --file=assets/"$(basename "$filename")".svg --export-pdf=assets/"$(basename -s .svg "$filename")".pdf --export-latex
 inkscape -z -D --file=../assets/"$(basename "$filename")" --export-dpi=1200 --export-png=assets/"$(basename -s .svg "$filename")".png --export-png 2>/dev/null
  echo "[DONE]"
done

echo "Building cards..."

for filename in ../cards/*.md; do
  echo  Building card: outputdeck/"$(basename "$filename" .md)".pdf
  pandoc --from=markdown+yaml_metadata_block --template card-front.tex -o outputdeck/"$(basename "$filename" .md)".pdf -V monofont="DejaVu Sans Mono" --pdf-engine=xelatex $filename
done
#  pandoc --from=markdown+yaml_metadata_block --template card.tex -o outputdeck/bug.pdf --pdf-engine=xelatex ../cards/bug.md
#  -V mainfont="DejaVu Serif" \
#  -V monofont="DejaVu Sans Mono" \
