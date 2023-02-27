# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022-2023 The Foundation for Public Code <info@publiccode.net>

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

VERSION:=$(shell script/version.sh)

.PHONY: all
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
 actor-commissioning-public-organization-2 \
 actor-development-vendor \
 actor-development-vendor-2 \
 actor-foundation-for-public-code \
 actor-governance-body \
 actor-hosting-vendor \
 actor-independent-developer \
 actor-inhouse-developer \
 actor-inhouse-developer-2 \
 actor-product-steering-group \
 actor-replicating-public-organization \
 actor-replicating-public-organization-2 \
 actor-stewardship-organization \
 actor-support-vendor \
 actor-technical-steering-group

OBJECT_CARD_NAMES=\
 object-back-end \
 object-backlog \
 object-codebase \
 object-front-end \
 object-policy1 \
 object-policy2 \
 object-documentation \
 object-standard-for-public-code

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

.PHONY: pdfs
pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	@echo SUCCESS $@

.PHONY: view-rules
view-rules: $(patsubst %, %.pdf, $(RULES_CARD_NAMES))
	$(PDFVIEW) $^

.PHONY: view-scenarios
view-scenarios: $(patsubst %, %.pdf, $(SCENARIO_CARD_NAMES))
	$(PDFVIEW) $^

.PHONY: view-startings
view-startings: $(patsubst %, %.pdf, $(STARTING_CARD_NAMES))
	$(PDFVIEW) $^

.PHONY: view-calamaties
view-calamaties: $(patsubst %, %.pdf, $(CALAMITY_CARD_NAMES))
	$(PDFVIEW) $^

.PHONY: view-actors
view-actors: $(patsubst %, %.pdf, $(ACTOR_CARD_NAMES))
	$(PDFVIEW) $^

.PHONY: view-objects
view-objects: $(patsubst %, %.pdf, $(OBJECT_CARD_NAMES))
	$(PDFVIEW) $^

.PHONY: view-all-fronts
view-all-fronts: $(patsubst %, %.pdf, $(ALL_CARD_NAMES))
	$(PDFVIEW) $^

%-back.pdf: assets/%-back.svg
	inkscape --export-type=pdf $< --export-filename=$@

.PHONY: view-all-backs
view-all-backs: $(patsubst %, %.pdf, $(CARD_BACKS))
	$(PDFVIEW) $^

.PHONY: view-all
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

.PHONY: num-front
num-front: $(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
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

.PHONY: num-back
num-back: num-front

.PHONY: number-pdfs
number-pdfs: num-front num-back

governance-game-$(VERSION).tar.xz: \
		$(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	tar --transform='s@\(.*\)@governance-game-$(VERSION)/\1@g' \
		-cvJf $@ $^

governance-game-$(VERSION).zip: governance-game-$(VERSION).tar.xz
	tar xfv $<
	zip -r $@ governance-game-$(VERSION)
	rm -rf governance-game-$(VERSION)

governance-game-numbered-$(VERSION).tar.xz: num-front num-back
	tar --transform='s@\(.*\)@governance-game-numbered-$(VERSION)/\1@g' \
		-cvJf $@ $^

governance-game-numbered-$(VERSION).zip: \
		governance-game-numbered-$(VERSION).tar.xz
	tar xfv $<
	zip -r $@ governance-game-numbered-$(VERSION)
	rm -rf governance-game-numbered-$(VERSION)

governance-game-box-$(VERSION).pdf: box/printers-studio-box.svg
	inkscape --export-filename=$@ $<

.PHONY: release
release: governance-game-$(VERSION).tar.xz \
	governance-game-$(VERSION).zip \
	governance-game-box-$(VERSION).pdf \
	governance-game-numbered-$(VERSION).tar.xz \
	governance-game-numbered-$(VERSION).zip
	ls -l $^

.PHONY: ensure-font
ensure-font: scripts/ensure-font.sh
	scripts/ensure-font.sh

.PHONY: check-%.pdf
check-%.pdf: %.pdf
	PAGES=$$( qpdf --show-npages $< ); \
		if [ "$$PAGES" -ne "1" ]; then \
			echo "$< has $$PAGES pages"; \
			false; \
		fi
	@echo SUCCESS $@

.PHONY: check-pdfs
check-pdfs: $(patsubst %, check-%.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	NUM_EXPECTED=$$( ls cards/*.tex assets/*back.svg | wc --words ); \
	NUM_CARDS=$$( ls *.pdf | wc --words); \
	if [ "$$NUM_EXPECTED" -ne "$$NUM_CARDS" ]; then \
		echo "expected $$NUM_EXPECTED but was $$NUM_CARDS"; \
		false; \
	else \
		echo "expected $$NUM_EXPECTED and was $$NUM_CARDS"; \
	fi
	@echo SUCCESS $@

.PHONY: check-spell-%
check-spell-%: cards/%.tex
	script/spell-check.sh $<

check-spell-cards: $(patsubst %, check-spell-%, $(ALL_CARD_NAMES))
	@echo SUCCESS $@

MD_TO_SPELLCHECK=CHANGELOG.md \
CONTRIBUTING.md \
CREDITS.md \
GOVERNANCE.md \
PRINTING.md \
README.md \
RELEASING.md \
SECURITY.md

check-spell-%: %
	script/spell-check.sh $<

.PHONY: check-spell-docs
check-spell-docs: $(patsubst %, check-spell-%, $(MD_TO_SPELLCHECK))
	@echo SUCCESS $@

.PHONY: check-spell
check-spell: check-spell-docs check-spell-cards
	@echo SUCCESS $@

.PHONY: check
check: check-pdfs check-spell script/find-missing-spdx.sh
	script/find-missing-spdx.sh
	@echo SUCCESS $@

.PHONY: clean
clean:
	rm -rfv *.pdf *.aux *.log *.synctex.gz *.xz *.zip \
		svg-inkscape num-front num-back
