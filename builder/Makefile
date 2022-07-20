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

START_CARD_NAMES=\
 starting-state-1 \
 starting-state-2 \
 starting-state-3 \
 starting-state-4 \
 starting-state-5 \
 starting-state-6 \
 starting-state-7 \
 starting-state-8

ALL_CARD_NAMES=\
 $(RULES_CARD_NAMES) \
 $(SCENARIO_CARD_NAMES) \
 $(START_CARD_NAMES) \
 $(CALAMITY_CARD_NAMES) \
 $(ACTOR_CARD_NAMES) \
 $(OBJECT_CARD_NAMES)

pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))

view-rules: $(patsubst %, %.pdf, $(RULES_CARD_NAMES))
	$(PDFVIEW) $^

view-scenarios: $(patsubst %, %.pdf, $(SCENARIO_CARD_NAMES))
	$(PDFVIEW) $^

view-starts: $(patsubst %, %.pdf, $(START_CARD_NAMES))
	$(PDFVIEW) $^

view-calamaties: $(patsubst %, %.pdf, $(CALAMITY_CARD_NAMES))
	$(PDFVIEW) $^

view-actors: $(patsubst %, %.pdf, $(ACTOR_CARD_NAMES))
	$(PDFVIEW) $^

view-objects: $(patsubst %, %.pdf, $(OBJECT_CARD_NAMES))
	$(PDFVIEW) $^

view-all: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))
	$(PDFVIEW) $^

# note: cards only reference one of the templates
%.pdf: ../cards/%.tex calamity-template.tex actor-template.tex \
		rules-template.tex scenario-template.tex start-template.tex
	$(PDFLATEX) $<

view-%: %.pdf
	$(PDFVIEW) $<

clean:
	rm -fv *.pdf *.aux *.log *.synctex.gz
