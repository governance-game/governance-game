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

OBJECT_CARD_NAMES=\
 back-end \
 backlog \
 codebase \
 front-end \
 policy1 \
 policy2

RULES_CARD_NAMES=\
 introduction \
 setup \
 rules \
 goal \
 calamities \
 credits

SCENARIO_CARD_NAMES=\
 festival-management \
 localization-plugin \
 public-transport \
 recycling-station \
 wifi


ALL_CARD_NAMES=\
 $(RULES_CARD_NAMES) \
 $(SCENARIO_CARD_NAMES) \
 $(CALAMITY_CARD_NAMES) \
 $(ACTOR_CARD_NAMES) \
 $(OBJECT_CARD_NAMES)

pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))

view-all: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))
	$(PDFVIEW) $^

# note: cards only reference one of the templates
%.pdf: ../cards/%.tex calamity-template.tex actor-template.tex \
		rules-template.tex scenario-template.tex
	$(PDFLATEX) $<

view-%: %.pdf
	$(PDFVIEW) $<

clean:
	rm -fv *.pdf *.aux *.log *.synctex.gz
