# $@ : target label
# $< : the first prerequisite after the colon
# $^ : all of the prerequisite files
# $* : wildcard matched part
# Target-specific Variable syntax:
# https://www.gnu.org/software/make/manual/html_node/Target_002dspecific.html
#
# patsubst : $(patsubst pattern,replacement,text)
#	https://www.gnu.org/software/make/manual/html_node/Text-Functions.html

SHELL=/bin/bash
PDFVIEW=evince
PDFLATEX=pdflatex -synctex=1 -interaction=nonstopmode --shell-escape

all: pdfs

CALAMITY_CARD_NAMES= \
 calamity-bug \
 calamity-concerns \
 calamity-gdpr-compliance \
 calamity-lost-funding \
 calamity-major-enhancement \
 calamity-new-replicator \
 calamity-wild-developer

ACTOR_CARD_NAMES= \
 actor-association-of-public-organizations \
 actor-citizen \
 actor-civil-servant \
 actor-commissioning-public-organization \
 actor-development-vendor \
 actor-governance-body \
 actor-hosting-vendor \
 actor-independent-developer \
 actor-inhouse-developer \
 actor-replicating-public-organization \
 actor-support-vendor \
 actor-technical-steering-group

OBJECT_CARD_NAMES=\
 object-back-end \
 object-backlog \
 object-codebase \
 object-front-end \
 object-policy1 \
 object-policy2

RULES_CARD_NAMES=\
 rules-introduction \
 rules-setup \
 rules-rules \
 rules-goal \
 rules-calamities \
 rules-credits \
 rules-about

SCENARIO_CARD_NAMES=\
 scenario-festival-management \
 scenario-localization-plugin \
 scenario-public-transport \
 scenario-recycling-station \
 scenario-wifi

STARTING_CARD_NAMES=\
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
 $(STARTING_CARD_NAMES) \
 $(CALAMITY_CARD_NAMES) \
 $(ACTOR_CARD_NAMES) \
 $(OBJECT_CARD_NAMES)

CARD_BACKS=\
 rules-back \
 actor-back \
 object-back \
 scenario-back \
 starting-back \
 calamity-back

pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	@echo SUCCESS

view-rules: $(patsubst %, %.pdf, $(RULES_CARD_NAMES))
	$(PDFVIEW) $^

view-scenarios: $(patsubst %, %.pdf, $(SCENARIO_CARD_NAMES))
	$(PDFVIEW) $^

view-startings: $(patsubst %, %.pdf, $(STARTING_CARD_NAMES))
	$(PDFVIEW) $^

view-calamaties: $(patsubst %, %.pdf, $(CALAMITY_CARD_NAMES))
	$(PDFVIEW) $^

view-actors: $(patsubst %, %.pdf, $(ACTOR_CARD_NAMES))
	$(PDFVIEW) $^

view-objects: $(patsubst %, %.pdf, $(OBJECT_CARD_NAMES))
	$(PDFVIEW) $^

view-all-fronts: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))
	$(PDFVIEW) $^

%-back.pdf: assets/%-back.svg
	inkscape --export-type=pdf $< --export-filename=$@

view-all-backs: $(patsubst %, %.pdf, $(CARD_BACKS))
	$(PDFVIEW) $^

view-all: view-all-fronts view-all-backs

calamity-%.pdf: cards/calamity-%.tex templates/template-font.tex \
		templates/calamity-template.tex
	$(PDFLATEX) $<

actor-%.pdf: cards/actor-%.tex templates/template-font.tex \
		templates/actor-template.tex
	$(PDFLATEX) $<

rules-%.pdf: cards/rules-%.tex templates/template-font.tex \
		templates/rules-template.tex
	$(PDFLATEX) $<

object-%.pdf: cards/object-%.tex templates/template-font.tex \
		templates/object-template.tex
	$(PDFLATEX) $<

scenario-%.pdf: cards/scenario-%.tex templates/template-font.tex \
		templates/scenario-template.tex
	$(PDFLATEX) $<

starting-%.pdf: cards/starting-%.tex templates/template-font.tex \
		templates/starting-template.tex
	$(PDFLATEX) $<

view-%: %.pdf
	$(PDFVIEW) $<

number-pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	mkdir -pv num-front
	mkdir -pv num-back
	export NUM=0; for card in $^; do \
		if [[ "$$card" != *back.pdf ]]; then \
			export NUM=$$(( $$NUM + 1 )); \
			cp -v $$card num-front/$${NUM}.pdf; \
			inkscape --export-type=png num-front/$${NUM}.pdf \
				 --export-filename=num-front/$${NUM}.png \
				 --export-width=816 \
				 --export-height=1110 \
				 --export-dpi=300; \
			export PREFIX=`echo $$card | cut -f1 -d'-'`; \
			cp -v $$PREFIX-back.pdf num-back/$${NUM}.pdf; \
			inkscape --export-type=png num-back/$${NUM}.pdf \
				 --export-filename=num-back/$${NUM}.png \
				 --export-width=816 \
				 --export-height=1110 \
				 --export-dpi=300; \
		fi \
	done

clean:
	rm -rfv *.pdf *.aux *.log *.synctex.gz svg-inkscape num-front num-back
