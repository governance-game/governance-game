# $@ : target label
# $< : the first prerequisite after the colon
# $^ : all of the prerequisite files
# $* : wildcard matched part
# Target-specific Variable syntax:
# https://www.gnu.org/software/make/manual/html_node/Target_002dspecific.html
#
# patsubst : $(patsubst pattern,replacement,text)
#	https://www.gnu.org/software/make/manual/html_node/Text-Functions.html


PDFVIEW=evince
PDFLATEX=pdflatex -synctex=1 -interaction=nonstopmode --shell-escape

all: calamity-pdfs

CALAMITY_CARD_NAMES= \
 bug \
 concerns \
 gdpr-compliance \
 lost-funding \
 major-enhancement \
 new-replicator \
 wild-developer

calamity-pdfs: $(patsubst %, %.pdf, $(CALAMITY_CARD_NAMES))

view-all: $(patsubst %, %.pdf, $(CALAMITY_CARD_NAMES))
	$(PDFVIEW) $^

%.pdf: ../cards/%.tex calamity-template.tex
	$(PDFLATEX) $<

view-%: %.pdf
	$(PDFVIEW) $<

clean:
	rm -fv *.pdf *.aux *.log *.synctex.gz
