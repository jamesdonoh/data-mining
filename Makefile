documents = report.pdf
default: $(documents)

%.pdf: %.md %-bibliography.yaml
	pandoc --filter pandoc-citeproc \
		--csl harvard-greenwich.csl \
		--bibliography=$*-bibliography.yaml \
		--latex-engine=xelatex \
		-V geometry:a4paper \
		-V mainfont=Constantia \
		-V colorlinks \
		--number-sections \
		--toc --toc-depth=2 \
		-s -o $@ $<

clean:
	rm -f ${documents}
