#!/bin/bash
# Script to generate a deck of cards used for personal or professional printer
#
#pandoc "$1" \
#    -f gfm \
#    --include-in-header templates/chapter_break.tex \
#    -V linkcolor:blue \
#    -V geometry:a4paper \
#    -V geometry:margin=2cm \
#    -V mainfont="DejaVu Serif" \
#    -V monofont="DejaVu Sans Mono" \
#    --pdf-engine=xelatex \
#    -o "$2"

echo "Clean up old generated assets"

rm -rf outputdeck
mkdir outputdeck
mkdir outputdeck/assets


echo "Converting SVG image assets to LaTeX"

for filename in ../assets/*.svg; do
  echo Converting $filename to LaTeX
  inkscape -z -D --file=../assets/"$(basename "$filename")" --export-pdf=outputdeck/assets/"$(basename "$filename")".pdf --export-latex
#  inkscape -z -D --file=../assets/"$(basename "$filename")" --export-dpi=600 --export-png=outputdeck/assets/"$(basename "$filename")".png --export-png

done

echo "Building cards..."

for filename in ../cards/*.md; do
  echo $filename
  pandoc --from=markdown+yaml_metadata_block --template templates/card.tex -o outputdeck/"$(basename "$filename" .md)".pdf --pdf-engine=xelatex $filename
done
