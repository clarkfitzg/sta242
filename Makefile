# Name of the report
REPORT = report

# $< references the first prerequisite
$(REPORT).pdf : $(REPORT).mdown
	pandoc $< -s -o $@ \
		-V geometry:margin=1in -V fontsize=12pt \
		-f markdown+simple_tables+footnotes

proposal.pdf: README.mdown
	pandoc $< -s -o $@ -V geometry:margin=1in -V fontsize=12pt

view: $(REPORT).pdf
	open $<

times.csv: histogram.py
	python histogram.py > times.csv
