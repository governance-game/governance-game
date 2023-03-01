# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022-2023 The Foundation for Public Code <info@publiccode.net>

# This 'Makefile' is written for use with the GNU `make` utility.
# https://www.gnu.org/software/make

# Three large strengths of `make` include automatic incremental builds,
# automatic parallelization, and an extensible syntax for declaring
# relationships and actions.

# A Makefile consists of declaring "targets" and what each target
# depends upon. In this case, the deck of cards is a collection of .pdf
# files, each of which is transformed from, and thus depend upon the
# corresponding .tex file. The release .tar.xz and .zip files each are
# declared to depend upon the collection of .pdf files.

# The `make` utility will only regenerate files that have dependencies
# which have been modified since the last build. For example, if you
# run "make" to build all cards, and then edit one card and re-run
# make, only one .pdf will be rebuilt. If you were to instead run "make
# release" make would also determine that the release files need to be
# rebuilt because a dependency of a dependency had changed, and it will
# not rebuild the other .pdf files (which do not need to be rebuilt) in
# the process.

# If the building machine has many cores, make can run any independent
# builds in parallel; if it uses a 52+ core machine, it would build each
# card at the same time, rather than one after the next.

# The Governance Game cards are mostly very similar. Rather than repeat
# the steps for each, we declare target patterns using the '%' wildcard
# (similar to '*' in bash) and use the "patsubst" command for describing
# pattern substitution.

# Many targets are wildcard targets and have a declaration like this:
#
# %-back.pdf: assets/%-back.svg
#
# This creates a separate target for each card-back based on each file
# dependency that has a matching form. In this case, each card-back.
# For example, because there is a dependency "assets/rules-back.svg",
# this creates the target which can be run in isolation from the
# command-line as "make rules-back.pdf"

# Most card pdfs are generated from two declared files, and one indirect
# dependency. The declared files are the card .tex and the card type
# template. The card type template depends upon the font template.

# Most pattern substitution is of the following form:
#
#	$(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
#
# This substitution expands into a list "foo.pdf bar.pdf baz.pdf" based
# on the combined lists of all cards front and back.

# To support iterative development, each pdf has a "make view-cardname",
# for example: "make view-rules-goal" will bring up the pdf which is
# generated from cards/rules-goal.tex

# Makefile variables used:
#
# $@ : target label
# $< : the first prerequisite after the colon
# $^ : all of the prerequisite files
# $* : wildcard matched part
#
# patsubst : $(patsubst pattern,replacement,text)
#	https://www.gnu.org/software/make/manual/html_node/Text-Functions.html

# if the PDFVIEW environment variable is not set, default to `evince`
PDFVIEW ?= evince

SHELL=/bin/bash
PDFLATEX=pdflatex -synctex=1 -interaction=nonstopmode --shell-escape

VERSION:=$(shell script/version.sh)

# The first target is the default target for "make"
# .PHONY: means that the result of the target will not be a file
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
 scenario-wifi \
 scenario-own-scenario

STARTING_CARD_NAMES=\
 starting-state-1 \
 starting-state-2 \
 starting-state-3 \
 starting-state-4 \
 starting-state-5 \
 starting-state-6 \
 starting-state-7

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

MD_TO_SPELLCHECK=\
 CHANGELOG.md \
 CONTRIBUTING.md \
 CREDITS.md \
 GOVERNANCE.md \
 PRINTING.md \
 README.md \
 RELEASING.md \
 SECURITY.md

.PHONY: pdfs
# depends on .pdf files for all card-fronts and card-backs
pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	@echo SUCCESS $@

#######################################################################
# Card PDFs depend on their own card and their type template

# all templates ending in "-template.tex" also depend on template-font.tex
templates/%-template.tex: templates/template-font.tex

calamity-%.pdf: cards/calamity-%.tex templates/calamity-template.tex
	$(PDFLATEX) $<

actor-%.pdf: cards/actor-%.tex templates/actor-template.tex
	$(PDFLATEX) $<

rules-%.pdf: cards/rules-%.tex templates/rules-template.tex
	$(PDFLATEX) $<

object-%.pdf: cards/object-%.tex templates/object-template.tex
	$(PDFLATEX) $<

scenario-%.pdf: cards/scenario-%.tex templates/scenario-template.tex
	$(PDFLATEX) $<

starting-%.pdf: cards/starting-%.tex templates/starting-template.tex
	$(PDFLATEX) $<

#######################################################################
# Card backs are straight-forward .svg to .pdf conversions:
%-back.pdf: assets/%-back.svg
	inkscape --export-type=pdf $< --export-filename=$@

#######################################################################
# For printing, we export matching PDFs by number in the num-front/ and
# the num-back/ directories
.PHONY: number-pdfs
number-pdfs: $(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	script/number-pdfs.sh $^

#######################################################################
# release files (.tar, .zip, and box.pdf)
#
governance-game-$(VERSION).tar.xz: \
		$(patsubst %, %.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	tar --transform='s@\(.*\)@governance-game-$(VERSION)/\1@g' \
		-cvJf $@ $^

governance-game-$(VERSION).zip: governance-game-$(VERSION).tar.xz
	tar xfv $<
	zip -r $@ governance-game-$(VERSION)
	rm -rf governance-game-$(VERSION)

governance-game-numbered-$(VERSION).tar.xz: number-pdfs
	tar --transform='s@\(.*\)@governance-game-numbered-$(VERSION)/\1@g' \
		-cvJf $@ num-front num-back

governance-game-numbered-$(VERSION).zip: \
		governance-game-numbered-$(VERSION).tar.xz
	tar xfv $<
	zip -r $@ governance-game-numbered-$(VERSION)
	rm -rf governance-game-numbered-$(VERSION)

governance-game-box-$(VERSION).pdf: box/printers-studio-box-0.0.0.svg
	cp -v box/printers-studio-box-0.0.0.svg printers-studio-box.svg
	sed -i -e's/version 0\.0\.0/version $(VERSION)/g' \
		printers-studio-box.svg
	inkscape --export-filename=$@ printers-studio-box.svg

.PHONY: release
release: governance-game-$(VERSION).tar.xz \
	governance-game-$(VERSION).zip \
	governance-game-box-$(VERSION).pdf \
	governance-game-numbered-$(VERSION).tar.xz \
	governance-game-numbered-$(VERSION).zip
	ls -l $^

#######################################################################
# Without the correct fonts installed, the text may look poor or flow
# differently
.PHONY: ensure-font
ensure-font: scripts/ensure-font.sh
	scripts/ensure-font.sh

#######################################################################
# tests

.PHONY: check-%.pdf
check-%.pdf: %.pdf
	script/check-one-page.sh $<
	@echo SUCCESS $@

.PHONY: check-pdfs
check-pdfs: $(patsubst %, check-%.pdf, $(ALL_CARD_NAMES) $(CARD_BACKS))
	script/check-pdf-for-each-tex.sh
	@echo SUCCESS $@

.PHONY: check-spell-%
check-spell-%: cards/%.tex
	script/spell-check.sh $<

.PHONY: check-spell-cards
check-spell-cards: $(patsubst %, check-spell-%, $(ALL_CARD_NAMES))
	@echo SUCCESS $@

.PHONY: check-spell-%
check-spell-%: %
	script/spell-check.sh $<

.PHONY: check-spell-docs
check-spell-docs: $(patsubst %, check-spell-%, $(MD_TO_SPELLCHECK))
	@echo SUCCESS $@

.PHONY: check-spell
check-spell: check-spell-docs check-spell-cards
	@echo SUCCESS $@

.PHONY: check-release
check-release: release
	@echo SUCCESS $@

.PHONY: check
check: check-pdfs check-spell script/find-missing-spdx.sh check-release
	script/find-missing-spdx.sh
	@echo SUCCESS $@

#######################################################################
# handy "view" targets for easy viewing of the rendered .pdf

.PHONY: view-%
view-%: %.pdf
	$(PDFVIEW) $<

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

.PHONY: view-all-backs
view-all-backs: $(patsubst %, %.pdf, $(CARD_BACKS))
	$(PDFVIEW) $^

.PHONY: view-all
view-all: view-all-fronts view-all-backs

#######################################################################
.PHONY: clean
clean:
	rm -rfv *.pdf *.aux *.log *.synctex.gz *.xz *.zip \
		svg-inkscape num-front num-back
