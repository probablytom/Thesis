LTX:=\\include{thesis.tex}
ifdef nofonts
LTX:=\\def\\nofonts{fontsdisabled}$(LTX)
endif
ifndef noreviewnotes 
LTX:=\\def\\reviewnotesintable{reviewnotesincluded}$(LTX)
endif
ifndef notodonotes
LTX:=\\def\\todosintable{todosincluded}$(LTX)
endif

thesis:
	lualatex $(LTX)
	biber thesis.bcf
	lualatex $(LTX)
	lualatex $(LTX)

normal:
	lualatex "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	biber thesis.bcf 
	lualatex "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	lualatex "\def\nofonts{fontsdisabled}\include{thesis.tex}"

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
