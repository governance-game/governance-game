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

all: pdfs

CALAMITY_CARD_NAMES= \
 bug \
 concerns \
 gdpr-compliance \
 lost-funding \
 major-enhancement \
 new-replicator \
 wild-developer

ACTOR_CARD_NAMES= \
 association-of-public-organizations \
 citizen \
 civil-servant \
 commissioning-public-organization \
 development-vendor \
 governance-body \
 hosting-vendor \
 independent-developer \
 inhouse-developer \
 replicating-public-organization \
 support-vendor \
 technical-steering-group

ALL_CARD_NAMES=$(CALAMITY_CARD_NAMES) $(ACTOR_CARD_NAMES)

pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))

view-all: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))
	$(PDFVIEW) $^

# note: cards only reference one of the templates
%.pdf: ../cards/%.tex calamity-template.tex actor-template.tex
	$(PDFLATEX) $<

view-%: %.pdf
	$(PDFVIEW) $<

clean:
	rm -fv *.pdf *.aux *.log *.synctex.gz
