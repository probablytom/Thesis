thesis:
	lualatex thesis
	bibtex thesis
	lualatex thesis
	lualatex thesis

clean:
	-rm *.aux *.bbl *.blg *.log *.gz *.toc */*.aux
	-rm -r auto
