#

PDFVIEW=evince

all: foo

foo.pdf: foo.tex card-template.tex
	pdflatex -synctex=1 foo.tex

foo: foo.pdf
	$(PDFVIEW) foo.pdf

clean:
	rm -fv *.pdf *.aux *.log *.synctex.gz
