MAKEFLAGS += --silent

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
TEXFILES != find -E * -depth 1 | grep "\.tex"
test != echo hello

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
	-rm *.aux *.bbl *.blg *.log *.gz *.toc */*.aux *.idx *.out
	-rm -r auto

readable:
	echo "weasel words: "
	sh bin/weasel_words.sh *.tex */*.tex
	echo
	echo "passive voice: "
	sh bin/passive_voice.sh *.tex */*.tex
	echo
	echo "duplicates: "
	perl bin/duplicates.pl *.tex */*.tex

style:
	echo $(test)
	echo $(TEXFILES)
	echo "weasel words: "
	zsh bin/weasel_words.sh $(TEXFILES)
	echo
	echo "passive voice: "
	zsh bin/passive_voice.sh $(TEXFILES)
	echo
	echo "duplicates: "
	perl bin/duplicates.pl $(TEXFILES)

available:
	make clean
	git add *.tex refs.bib */chap.tex
	git add makefile
	git add .gitignore
	git add thesis.pdf
	git add good_template.cls
	git commit
	git push
