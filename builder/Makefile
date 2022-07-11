#

PDFVIEW=evince

all: wild-developer

foo.pdf: foo.tex scenario-template.tex
	pdflatex -synctex=1 -interaction=nonstopmode --shell-escape foo.tex

foo: foo.pdf
	$(PDFVIEW) foo.pdf

wild-developer.pdf: ../cards/wild-developer.tex scenario-template.tex
	pdflatex -synctex=1 -interaction=nonstopmode --shell-escape \
		../cards/wild-developer.tex

wild-developer: wild-developer.pdf
	$(PDFVIEW) wild-developer.pdf

# ../cards/wild-developer.tex

clean:
	rm -fv *.pdf *.aux *.log *.synctex.gz

# ../cards/association-of-public-organizations.tex
# ../cards/back-end.tex
# ../cards/backlog.tex
# ../cards/bug.tex
# ../cards/calamities.tex
# ../cards/citizen.tex
# ../cards/civil-servant.tex
# ../cards/codebase.tex
# ../cards/commissioning-public-organization.tex
# ../cards/concerns.tex
# ../cards/credits.tex
# ../cards/development-vendor.tex
# ../cards/festival-management.tex
# ../cards/front-end.tex
# ../cards/gdpr-compliance.tex
# ../cards/goal.tex
# ../cards/governance-body.tex
# ../cards/hosting-vendor.tex
# ../cards/independent-developer.tex
# ../cards/inhouse-developer.tex
# ../cards/introduction.tex
# ../cards/localization-plugin.tex
# ../cards/lost-funding.tex
# ../cards/major-enhancement.tex
# ../cards/new-replicator.tex
# ../cards/policy1.tex
# ../cards/policy2.tex
# ../cards/public-transport.tex
# ../cards/recycling-station.tex
# ../cards/replicating-public-organization.tex
# ../cards/rules.tex
# ../cards/setup.tex
# ../cards/starting-state-1.tex
# ../cards/starting-state-2.tex
# ../cards/starting-state-3.tex
# ../cards/starting-state-4.tex
# ../cards/starting-state-5.tex
# ../cards/starting-state-6.tex
# ../cards/starting-state-7.tex
# ../cards/starting-state-8.tex
# ../cards/support-vendor.tex
# ../cards/technical-steering-group.tex
# ../cards/wifi.tex
# ../cards/wild-developer.tex
