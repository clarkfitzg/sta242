proposal.pdf: README.mdown
	pandoc $< -s -o $@ -V geometry:margin=1in -V fontsize=12pt
