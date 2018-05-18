default: report.pdf

generated_figures = vehicle-type-correlation.pdf

all_figures = accidents-by-hour.pdf accidents-by-min.pdf er.pdf heatmap.pdf numvehicles.pdf vehicle-type-correlation.pdf $(generated_figures)

report.pdf: report.md report-bibliography.yaml harvard-bradford.csl $(all_figures)
	pandoc --filter pandoc-citeproc \
		--csl harvard-bradford.csl \
		--bibliography=$*-bibliography.yaml \
		--latex-engine=xelatex \
		-V geometry:a4paper \
		-V mainfont=Constantia \
		-V colorlinks \
		--number-sections \
		--toc --toc-depth=2 \
		-s -o $@ $<

%.pdf: %.svg
    inkscape $(CURDIR)/$< -A=$(CURDIR)/$@ --without-gui

.PHONY: count
count:
	pandoc --to=plain assignment.md | wc -w

clean:
	rm -f report.pdf $(generated_figures)
