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
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp3_learning_model.mmd -o 70_generality_of_aspects/diagrams/exp3_learning_model.png --width 1400 --height 1400
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.mmd -o 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.png --width 1400 --height 1400
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/aspect_applied_model.mmd -o 60_optimisation_with_aspects/diagrams/aspect_applied_model.png
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/aspect_applied_model.mmd -o 60_optimisation_with_aspects/diagrams/aspect_applied_model.svg
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/naive_model.mmd -o 60_optimisation_with_aspects/diagrams/naive_model.png
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/naive_model.mmd -o 60_optimisation_with_aspects/diagrams/naive_model.svg
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.mmd -o 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.png
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.mmd -o 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.svg
	sudo mmdc -i 30_prior_work/diagrams/replacement_getattr.mmd -o 30_prior_work/diagrams/replacement_getattr.svg
	sudo mmdc -i 30_prior_work/diagrams/replacement_getattr.mmd -o 30_prior_work/diagrams/replacement_getattr.png
	sudo mmdc -i 30_prior_work/diagrams/asp_woven_attr.mmd -o 30_prior_work/diagrams/asp_woven_attr.svg
	sudo mmdc -i 30_prior_work/diagrams/asp_woven_attr.mmd -o 30_prior_work/diagrams/asp_woven_attr.png
	lualatex $(LTX)
	biber thesis.bcf
	lualatex $(LTX)
	lualatex $(LTX)

normal:
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp3_learning_model.mmd -o 70_generality_of_aspects/diagrams/exp3_learning_model.png --width 1400 --height 1400
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.mmd -o 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.png --width 1400 --height 1400
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/aspect_applied_model.mmd -o 60_optimisation_with_aspects/diagrams/aspect_applied_model.png
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/aspect_applied_model.mmd -o 60_optimisation_with_aspects/diagrams/aspect_applied_model.svg
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/naive_model.mmd -o 60_optimisation_with_aspects/diagrams/naive_model.svg
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/naive_model.mmd -o 60_optimisation_with_aspects/diagrams/naive_model.svg
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.mmd -o 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.png
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.mmd -o 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.svg
	sudo mmdc -i 30_prior_work/diagrams/replacement_getattr.mmd -o 30_prior_work/diagrams/replacement_getattr.svg
	sudo mmdc -i 30_prior_work/diagrams/replacement_getattr.mmd -o 30_prior_work/diagrams/replacement_getattr.png
	sudo mmdc -i 30_prior_work/diagrams/asp_woven_attr.mmd -o 30_prior_work/diagrams/asp_woven_attr.svg
	sudo mmdc -i 30_prior_work/diagrams/asp_woven_attr.mmd -o 30_prior_work/diagrams/asp_woven_attr.png
	lualatex "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	biber thesis.bcf 
	lualatex "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	lualatex "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	
quickly:
	lualatex $(LTX)

clean:
	-rm *.aux *.bbl *.blg *.log *.gz *.toc */*.aux *.idx *.out *.xml
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
