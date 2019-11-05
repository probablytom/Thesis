# Basic Thesis Structure Document

This repo holds one example of a structure for a Glasgow University Computing
Science PhD thesis, in latex. I've organised it in this way so that the document
stays maintainable even as it grows pretty large, and so that it's easy to
navigate semantically in a file browser. 

## Basic philosophy of the structure / is this really for you?

The idea behind this, ultimately, is to break a large document up into shards
rather than one very large .tex file, and to keep your latex looking sensible so
that you can actually maintain it should you want to make changes.

We have to put effort into making this look sensible, because the other part of
the philosophy behind this is that if we're going to have lots of .tex files
everywhere, we want to know what we're looking at. We separate every chapter
by giving it its own folder in the `chapters` folder, and every bit of a chapter
into its own file in the relevant chapter's folder. So, we get a structure like
this:

'''
thesis.tex
preamble.tex
chapters/
    - Introduction/
        - chap.tex
        - section1.tex
        - section2.tex
    - Conclusion/
        - chap.tex
        - section1.tex
        - section2.tex
'''

Making this elegant and usable in latex is what this template is for.

## Using this template, if you like the idea

Using the template is pretty straightforward, so long as you compile your latex
by hand on a unix machine: just run `pdflatex thesis.tex` (or your equivalent latex compiler of
choice).

If you're compiling by hand on a unix machine, just clone this repo and begin
writing! Better yet, fork it so you can manage your writing in your own repo.

Things get hairier on Windows (I believe) or if you don't compile your latex by
hand (many people). If you're on Windows, I'm sorry, but the package
dependancies for this template need unix so we do, too.

If you're compiling through Overleaf or one of the other similar systems, you
want to copy the content of the preamble and the structure of the original document over and
then recreate the folder structure by hand. You'll also need to grab a copy of [Stephen Strowes' Glasgow DCS thesis
template](https://github.com/sdstrowes/Glasgow-Thesis-Template), and call it
`glasgowthesis.cls` in the root of your project. I've tried this on Overleaf and it works!
But you'll need to put the leg work in yourself, and I have no idea if it'll
break on whatever you use.

## How it works

The document uses [Stephen Strowes' Glasgow DCS thesis
template](https://github.com/sdstrowes/Glasgow-Thesis-Template), as recommended
to me by my own supervisor (Tim Storer). The actual document to compile is
`thesis.tex`, which includes:

* The documentclass (with the `draft` option by default)
* An include of `preamble.tex`
* Maketitle
* Table of contents
* Includes of your chapters, using the `\includechapter` macro described below

Mostly the file just pulls in content, via the `\includechapter` calls, and
configures everything with the preamble.

Speaking of, `preamble.tex` is more complicated. It contains:
  
 * All of your `\usepackage` calls and macro definitions
 * Document metadata like your title, author and date
 * The `\includechapter` and `\snip` macros
 
## The real magic: includechapter and snip
  
`\includechapter` works like this: keep each chapter in a directory (which
should have no spaces in its name), and a document for the chapter in `chap.tex`
inside that folder. For example, if you have an introduction, you need a file
`chapters/Introduction/chap.tex` which holds your Introduction chapter. You can
see examples of this in this template repo for four chapters.

`\snip` works like this: inside your chapter directories, keep snippets of your
chapter in .tex files. Put them into your `chap.tex` file in the order you want
like so: `\snip{filename}` for each little snippet. I like to use this to keep
all of my sections separate.

*Note*: I'm certain these can also be inside subfolders, so long as you supply
`foldername/filename` to snip instead.
