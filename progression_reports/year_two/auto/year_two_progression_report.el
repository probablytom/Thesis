(TeX-add-style-hook
 "year_two_progression_report"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem") ("todonotes" "obeyDraft")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref"
    "todonotes"
    "indentfirst"
    "cleveref"
    "float"
    "listings")
   (TeX-add-symbols
    "ampersand")
   (LaTeX-add-labels
    "sec:orgf4051b4"
    "part:previous_viva_summary"
    "sec:org72f95f6"
    "fig:jeremy_diagram"
    "sec:orga2f09b3"
    "subsec:improved_thesis_statement"
    "sec:org11ef3e4"
    "part:following_work"
    "sec:orgd228a83"
    "sec:orgcb388c5"
    "subsec:workflow_graphs"
    "fig:wfgraphs_example_code"
    "sec:org6f83b58"
    "sec:mattia_model"
    "part:future_work"
    "sec:orgd5cde00"
    "sec:org5bc56db"
    "sec:old_questions"
    "sec:org729ae06"
    "sec:org44d0ad0"
    "subsec:agile_modelling_suggestion"
    "sec:org42fcbf2"
    "sec:orga6a3d4c"
    "sec:new_questions"
    "fig:workflow_state"
    "sec:orga814c06"
    "sec:future_notation"
    "sec:org2d51950"
    "part:discussion"
    "sec:org188061e"
    "sec:org3dd65d9"
    "part:appendices"
    "sec:org0addd5a"
    "app:definitions"
    "sec:org8a2c738"
    "sec:orgb77484e"
    "sec:org7a18e2f")
   (LaTeX-add-bibliographies
    "lib"))
 :latex)

