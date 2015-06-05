# Name of the report
REPORT = report

N_TIMINGS = 2

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

# Pass the number of timings in as a command line arg here
timings.csv: allplots.py
	python $< $(N_TIMINGS) > $@

proposal.pdf: README.mdown
	pandoc $< -s -o $@ -V geometry:margin=1in -V fontsize=12pt

view: $(REPORT).pdf
	open $<

times.csv: histogram.py
	python histogram.py > times.csv
