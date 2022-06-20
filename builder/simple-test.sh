#!/bin/bash
# Script to generate a deck of cards used for personal or professional printer

pandoc "$1" \
    -f gfm \
    --include-in-header templates/chapter_break.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
    --pdf-engine=xelatex \
    -o "$2"
