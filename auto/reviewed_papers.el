(TeX-add-style-hook
 "reviewed_papers"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("natbib" "round")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "cleverref"
    "natbib")
   (LaTeX-add-labels
    "review:blair2015holons"
    "review:milner2009space")
   (LaTeX-add-bibliographies
    "references"))
 :latex)

