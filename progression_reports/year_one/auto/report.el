(TeX-add-style-hook
 "report"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "draft" "12pt")))
   (TeX-run-style-hooks
    "latex2e"
    "preamble"
    "article"
    "art12"
    "natbib")
   (LaTeX-add-labels
    "sec:introduction")
   (LaTeX-add-bibliographies
    "lib"))
 :latex)

