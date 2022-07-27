# Governance Game card deck generator

This folder contains a script which automatically generates a complete card deck for the Governance Game in PDF.
You can use the PDF to print the cards yourself and cut them.
Alternatively, the PDFs are compatible with external printer companies which can print this deck.

## Dependencies

```
sudo apt install docbook-utils pandoc inkscape texlive texlive-fonts-extra \
	texlive-extra-utils
# sudo apt install texlive-full
```

## Usage

Type `make` to generate the pdf files.

Type `make view-all` to view all of the pdf files generated.

## TODO

- generate card back pdfs
