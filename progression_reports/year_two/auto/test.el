(TeX-add-style-hook
 "test"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
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
    "float")
   (LaTeX-add-labels
    "sec:orgf43bf2d"
    "part:previous_viva_summary"
    "sec:orge9f9910"
    "sec:orgc5fe155"
    "sec:org89bf1a8"
    "part:following_work"
    "sec:org2c06f34"
    "sec:org8e17918"
    "sec:org89e1f23"
    "part:future_work"
    "sec:org13df2ed"
    "sec:org2e76e5f"
    "sec:org11b0a47"
    "sec:orgae8b95d"
    "sec:org7b238fb")
   (LaTeX-add-bibliographies
    "lib"))
 :latex)

