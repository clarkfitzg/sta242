# Name of the report
REPORT = report

# All the plot files
PLOTS = alpha alpha2 boxplot histogram sample

MPL_PLOTS = $(PLOTS:%=matplotlib/%.png)

# $< references the first prerequisite
$(REPORT).pdf : $(REPORT).mdown $(MPL_PLOTS)
	pandoc $< -s -o $@ \
		-V geometry:margin=1in -V fontsize=12pt \
		-f markdown+simple_tables+footnotes

$(REPORT).html : $(REPORT).mdown $(MPL_PLOTS)
	pandoc $< -s -o $@ \
		-f markdown+simple_tables+footnotes

$(MPL_PLOTS): allplots.py
	python $<

timings.csv: alltimes.py $(MPL_SCRIPTS)
	python $<

proposal.pdf: README.mdown
	pandoc $< -s -o $@ -V geometry:margin=1in -V fontsize=12pt

view: $(REPORT).pdf
	open $<

times.csv: histogram.py
	python histogram.py > times.csv
