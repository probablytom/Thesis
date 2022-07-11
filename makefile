thesis:
	lualatex thesis
	arch=x86_64 biber thesis.bcf
	lualatex thesis
	lualatex thesis

clean:
	-rm *.aux *.bbl *.blg *.log *.gz *.toc */*.aux
	-rm -r auto

available:
	make clean
	git add *.tex refs.bib */chap.tex
	git add makefile
	git add .gitignore
	git add thesis.pdf
	git add good_template.cls
	git commit
	git push
