# MAKEFLAGS += --silent

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
	make diagrams
	lualatex --shell-escape $(LTX)
	biber thesis.bcf
	lualatex --shell-escape $(LTX)
	echo "FINAL"
	lualatex --shell-escape $(LTX)

normal:
	make diagrams
	lualatex --shell-escape "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	biber thesis.bcf 
	lualatex --shell-escape "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	lualatex --shell-escape "\def\nofonts{fontsdisabled}\include{thesis.tex}"
	
quickly:
	lualatex $(LTX)

DIFFABLEFILES = 10_intro/chap 20_lit_review/chap 30_prior_work/chap 40_pydysofu_rewrite/chap 50_rpglite/chap 60_optimisation_with_aspects/chap 70_generality_of_aspects/chap 80_future_work/chap 90_closing_discussion/chap appendices/ace_pattern appendices/complete_exp3_table_s2_reannealed appendices/complete_result_table_for_exp2 appendices/exp1_data_complete appendices/exp3_prior_distribution_season2 appendices/model_parameters appendices/search_algorithm_for_globally_significant_results appendices/search_alg originality acknowledgements abstract thesis
diff:
	$(foreach file,$(DIFFABLEFILES),echo $(file); git cat-file -p original-submission:$(file).tex > $(file)-submitted.tex;)
	$(foreach file,$(DIFFABLEFILES),latexdiff $(file)-submitted.tex $(file).tex > $(file)-diff.tex;)

	mv "thesis-diff.tex" "diff.tex"

	sed -i '' '1679d' 40_pydysofu_rewrite/chap-diff.tex
	sed -i '' '1679d' 40_pydysofu_rewrite/chap-diff.tex

	sed -i '' 's/\\include{\(.*\)\/chap}/\\include{\1\/chap-diff}/g' diff.tex
	sed -i '' 's/\\include{appendices\/\(.*\)}/\\include{appendices\/\1\-diff}/g' diff.tex
	sed -i '' 's/\\include{originality}/\\include{originality-diff}/g' diff.tex
	sed -i '' 's/\\include{acknowledgements}/\\include{acknowledgements-diff}/g' diff.tex
	sed -i '' 's/\\include{abstract}/\\include{abstract-diff}/g' diff.tex

	-lualatex --shell-escape "\def\finalversion{tosubmit}\def\printonpaper{printablecopy}\include{diff.tex}"
	-biber diff.bcf
	-lualatex --shell-escape "\def\finalversion{tosubmit}\def\printonpaper{printablecopy}\include{diff.tex}"
	-lualatex --shell-escape "\def\finalversion{tosubmit}\def\printonpaper{printablecopy}\include{diff.tex}"

diagrams:
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp3_learning_model.mmd -o 70_generality_of_aspects/diagrams/exp3_learning_model.png --width 1400 --height 1400 -C mermaid_theme.css
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp3_learning_model.mmd -o 70_generality_of_aspects/diagrams/exp3_learning_model.pdf --width 1400 --height 1400 -C mermaid_theme.css --pdfFit
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp3_learning_model.mmd -o 70_generality_of_aspects/diagrams/exp3_learning_model.pdf --width 1400 --height 1400 -C mermaid_theme.css --pdfFit
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.mmd -o 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.png --width 1400 --height 1400 -C mermaid_theme.css
	sudo mmdc -i 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.mmd -o 70_generality_of_aspects/diagrams/exp2_prior_distribution_model.pdf --width 1400 --height 1400 -C mermaid_theme.css --pdfFit
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/aspect_applied_model.mmd -o 60_optimisation_with_aspects/diagrams/aspect_applied_model.png -C mermaid_theme.css
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/aspect_applied_model.mmd -o 60_optimisation_with_aspects/diagrams/aspect_applied_model.pdf -C mermaid_theme.css --pdfFit
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/aspect_applied_model.mmd -o 60_optimisation_with_aspects/diagrams/aspect_applied_model.svg -C mermaid_theme.css
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/naive_model.mmd -o 60_optimisation_with_aspects/diagrams/naive_model.png -C mermaid_theme.css
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/naive_model.mmd -o 60_optimisation_with_aspects/diagrams/naive_model.pdf -C mermaid_theme.css --pdfFit
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/naive_model.mmd -o 60_optimisation_with_aspects/diagrams/naive_model.svg -C mermaid_theme.css
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.mmd -o 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.png -C mermaid_theme.css
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.mmd -o 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.pdf -C mermaid_theme.css --pdfFit
	sudo mmdc -i 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.mmd -o 60_optimisation_with_aspects/diagrams/experiment_setup_for_datagen.svg -C mermaid_theme.css
	sudo mmdc -i 40_pydysofu_rewrite/diagrams/aspect-hook-weaving-high-level.mmd -o 40_pydysofu_rewrite/diagrams/aspect-hook-weaving-high-level.png -C mermaid_theme.css
	sudo mmdc -i 40_pydysofu_rewrite/diagrams/aspect-hook-weaving-high-level.mmd -o 40_pydysofu_rewrite/diagrams/aspect-hook-weaving-high-level.pdf -C mermaid_theme.css --pdfFit
	sudo mmdc -i 40_pydysofu_rewrite/diagrams/aspect-hook-weaving-high-level.mmd -o 40_pydysofu_rewrite/diagrams/aspect-hook-weaving-high-level.svg -C mermaid_theme.css
	sudo mmdc -i 40_pydysofu_rewrite/diagrams/nesting_of_around_advice.mmd -o 40_pydysofu_rewrite/diagrams/nesting_of_around_advice.png -C mermaid_theme.css
	sudo mmdc -i 40_pydysofu_rewrite/diagrams/nesting_of_around_advice.mmd -o 40_pydysofu_rewrite/diagrams/nesting_of_around_advice.pdf -C mermaid_theme.css --pdfFit
	sudo mmdc -i 40_pydysofu_rewrite/diagrams/nesting_of_around_advice.mmd -o 40_pydysofu_rewrite/diagrams/nesting_of_around_advice.svg -C mermaid_theme.css
	sudo mmdc -i 30_prior_work/diagrams/replacement_getattr.mmd -o 30_prior_work/diagrams/replacement_getattr.svg -C mermaid_theme.css
	sudo mmdc -i 30_prior_work/diagrams/replacement_getattr.mmd -o 30_prior_work/diagrams/replacement_getattr.png -C mermaid_theme.css
	sudo mmdc -i 30_prior_work/diagrams/replacement_getattr.mmd -o 30_prior_work/diagrams/replacement_getattr.pdf -C mermaid_theme.css --pdfFit
	sudo mmdc -i 30_prior_work/diagrams/asp_woven_attr.mmd -o 30_prior_work/diagrams/asp_woven_attr.svg -C mermaid_theme.css
	sudo mmdc -i 30_prior_work/diagrams/asp_woven_attr.mmd -o 30_prior_work/diagrams/asp_woven_attr.png -C mermaid_theme.css
	sudo mmdc -i 30_prior_work/diagrams/asp_woven_attr.mmd -o 30_prior_work/diagrams/asp_woven_attr.pdf -C mermaid_theme.css --pdfFit

for_submission:
	make clean
	$(eval LTX:=\\def\\finalversion{tosubmit}\\include{thesis.tex})
	make diagrams
	lualatex --shell-escape $(LTX)
	biber thesis.bcf
	lualatex --shell-escape $(LTX)
	lualatex --shell-escape $(LTX)
	cp thesis.pdf thesis.screen.pdf
	make clean
	make diagrams
	$(eval LTX:=\\def\\finalversion{tosubmit}\\def\\printonpaper{printablecopy}\\include{thesis.tex})
	lualatex --shell-escape $(LTX)
	biber thesis.bcf
	lualatex --shell-escape $(LTX)
	lualatex --shell-escape $(LTX)
	cp thesis.pdf thesis.printable.pdf

final:
	make for_submission
	

clean:
	-rm *.aux *.bbl *.blg *.log *.gz *.toc */*.aux *.idx *.out *.xml
	-rm -r auto */auto
	mv diff.pdf changes.pdf
	-rm diff* *-diff* *-submitted* */*-diff* */*-submitted*
	mv changes.pdf diff.pdf
	-sudo rm */diagrams/*.pdf */diagrams/*.png */diagrams/*.svg

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
