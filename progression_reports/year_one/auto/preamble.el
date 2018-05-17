(TeX-add-style-hook
 "preamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("todonotes" "obeyDraft" "textsize=tiny")))
   (TeX-run-style-hooks
    "todonotes"
    "indentfirst"))
 :latex)

