(TeX-add-style-hook
 "thesis"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("glasgowthesis" "draft")))
   (TeX-run-style-hooks
    "latex2e"
    "preamble"
    "glasgowthesis"
    "glasgowthesis10"))
 :latex)

