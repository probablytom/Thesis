(TeX-add-style-hook
 "header"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("glasgowthesis" "oneside" "hidelinks")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("subfig" "font=scriptsize")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "\"abstract"
    "\"acknowledgements"
    "custom_preamble"
    "glasgowthesis"
    "glasgowthesis10"
    "graphics"
    "graphicx"
    "url"
    "algorithmic"
    "algorithm"
    "mcaption"
    "subfig"
    "amsmath"
    "amssymb"
    "bookmark"
    "color"
    "changebar"
    "soul"
    "fancyhdr")
   (TeX-add-symbols
    '("note" 1)
    '("TLSdel" 1)
    '("TLSins" 1))
   (LaTeX-add-environments
    "codelisting"))
 :latex)

