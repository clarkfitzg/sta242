# Name of the report
REPORT = report

N_TIMINGS = 5

# All the plot files
PLOTS = alpha alpha2 boxplot histogram sample

MPL_PLOTS = $(PLOTS:%=matplotlib/%.png)

# The main report as pdf
# $< references the first prerequisite
#$(REPORT).pdf : $(REPORT).mdown $(MPL_PLOTS) timingplots.png
$(REPORT).pdf : $(REPORT).mdown timingplots.png
	pandoc $< -s -o $@ \
		-V geometry:margin=1in -V fontsize=12pt \
		-f markdown+simple_tables+footnotes

# The main report as html
$(REPORT).html : $(REPORT).mdown $(MPL_PLOTS)
	pandoc $< -s -o $@ \
		-f markdown+simple_tables+footnotes

$(MPL_PLOTS): allplots.py
	python $<

# This command performs all the timings and saves the results
# by writing over timings.csv
timings.csv: allplots.py allplots.R allplots_ggplot2.R
	echo "time,plot,program" > $@
	python $< $(N_TIMINGS) >> $@
	Rscript allplots.R $(N_TIMINGS) >> $@
	Rscript allplots_ggplot2.R $(N_TIMINGS) >> $@

# Analyze the timings.csv output
timingplots.png: analyzetimings.R timings.csv
	Rscript $<

proposal.pdf: README.mdown
	pandoc $< -s -o $@ -V geometry:margin=1in -V fontsize=12pt

view: $(REPORT).pdf
	open $<

times.csv: histogram.py
	python histogram.py > times.csv
