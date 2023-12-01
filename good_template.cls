\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis_gla}[]

% \LoadClass{tufte-book}

% Some options.
\usepackage{ifthen}

\newif\if@lettrine\@lettrinefalse
\DeclareOption{lettrine}{\@lettrinetrue}
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax

\newif\if@physicalcopy\@physicalcopyfalse
\DeclareOption{physicalcopy}{\@physicalcopytrue}
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax

\newif\if@beautifulcopy\@beautifulcopyfalse
\DeclareOption{beautifulcopy}{\@beautifulcopytrue}
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax


\if@lettrine
    \usepackage{lettrine}
\fi



%\date{}
% \school{Computing Science}
% \college{Science and Engineering}

% Base this off of the book class
\LoadClass{book}[pdftex]
% \setmainfont{Canela}

%-----------------------------------
%FONTS and LETTERING
% We set up nicer (postscript) fonts.
\usepackage{pslatex}
%set up microtype for Kerning and protrusion control... see here http://www.khirevich.com/latex/microtype/ 
\usepackage{microtype} 
% We set up AMS formatting, including seamless paragraph and theorem numbering.
\usepackage{amsthm}
\usepackage[fleqn]{amsmath} % flush equations left
\usepackage{amssymb}
\usepackage{setspace}
%-----------------------------------

%-----------------------
%COLORS and SECTIONING COLORS
\usepackage[dvipsnames]{xcolor}
\definecolor{linkColor}{RGB}{156,78,13}
\definecolor{sepia}{RGB}{70,42,14}
\definecolor{grayBT}{RGB}{211,211,211}
\definecolor{commentgrey}{gray}{0.3}
%-----------------------

%-----------------------
% INDEX command
\usepackage{imakeidx}
\newcommand{\defineterm}[1]{\emph{#1}\index{#1}}
\newcommand{\definetermNoItalics}[1]{#1\index{#1}}
%-----------------------
\usepackage{lineno}
\usepackage{hyperref}


\usepackage{geometry}

% the beautifulcopy command is NOT conforming with the Glasgow University's guidelines; everything else is though.
\if@beautifulcopy
    %----------------------------------------
    %SPACING: LINE, PARAGRAPH, PAGE
    \setlength{\parskip}{1.0em}
    \renewcommand{\baselinestretch}{1.25}
    % \setlength{\parindent}{30pt}

    % Set paragraph layout.
    \textwidth 12.5cm
    
    \hypersetup{
    colorlinks = true,
    allcolors = linkColor %set uniform color (def. above) for all links
    }

    \geometry{
        	paper=a4paper, % Paper size, change to letterpaper for US letter size
        	top=2.4cm, % Top margin
        	bottom=5.75cm, % Bottom margin
        	left=4.5cm, % Left margin
        	right=4.5cm, % Right margin
        	headheight=2pt, % Header height
        	footskip=1.4cm, % Space from the bottom margin to the baseline of the footer
        	headsep=1.5\baselineskip, % Space from the top margin to the baseline of the header
    }
\else % below is the code for non-Ben-And-Tom-Typography-Nerdery
    %----------------------------------------
    %SPACING: LINE, PARAGRAPH, PAGE
    % Set line spacing to one-and-a-half.
    \onehalfspacing 
    \setlength{\parskip}{1em}
    \renewcommand{\baselinestretch}{2.0}

    % Set paragraph layout.
    % \setlength{\parindent}{30pt}
    % \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
    % The actual width of the body text must be 15.5cm.
    \textwidth 15.5cm
    
    % Default page layout is for pdf viewing, set physicalcopy option to get layout for printing
    \if@physicalcopy
        \hypersetup{
            colorlinks = false,
        }
        \geometry{
        	paper=a4paper, % Paper size, change to letterpaper for US letter size
        	top=1.8cm, % Top margin
        	bottom=1.8cm, % Bottom margin
        	left=1.5cm, % Left margin
        	right=1.5cm, % Right margin
        	bindingoffset=2.5cm, % gutter, the margin for the book binding to go into
        	headheight=2pt, % Header height
        	footskip=1.4cm, % Space from the bottom margin to the baseline of the footer
        	headsep=1.5\baselineskip, % Space from the top margin to the baseline of the header
            }
    \else  % default options 
        \hypersetup{
            colorlinks = true,
            allcolors = linkColor %set uniform color (def. above) for all links
        }
        \geometry{
        	paper=a4paper, % Paper size, change to letterpaper for US letter size
        	top=1.8cm, % Top margin
        	bottom=2.75cm, % Bottom margin
        	left=2.75cm, % Left margin
        	right=2.75cm, % Right margin
        	headheight=2pt, % Header height
        	footskip=1.4cm, % Space from the bottom margin to the baseline of the footer
        	headsep=1.5\baselineskip, % Space from the top margin to the baseline of the header
        }
    \fi
\fi



%-----------------------------------
%THEOREMS and DEFINITIONS

%%%%%%%%% begin shaded theorems
%
\theoremstyle{plain}%-----------------------

\newtheorem{theorem}{Theorem}[section]
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{problem}[theorem]{Open Problem}
\newtheorem{example}[theorem]{Example}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{remark}[theorem]{Remark}

%-----------------------------------
\theoremstyle{definition}%------------------
\newtheorem{definition}[theorem]{Definition}
\newtheorem{note}[theorem]{Note}
\newtheorem{claim}[theorem]{Claim} 
\newtheorem{exercise}[theorem]{Exercise}
%-----------------------------------
\renewcommand\qedsymbol{$\blacksquare$}
%-----------------------------------


%-----------------------------------
% PAGE NUMBERING
% Specify page titles for well-known sections.
\renewcommand{\contentsname}{Table of Contents}


%------------------------------
% remove numbering on blank pages between chapters
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage 
%------------------------------


% Specify fancy header settings.
\usepackage{fancyhdr}
\fancyhf{}          % clear default settings

\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername\ \thechapter.\ #1}}{}}
\fancyhead[RE,LO]{\slshape \leftmark}  % put chapter heading on left (odd
                                       % pages)/right (even pages)
\fancyhead[RO,LE]{\thepage}            % put page number right (odd
                                       % pages)/right (even pages)
\renewcommand{\headrulewidth}{0pt}     % no headrule

% redefine "plain" to fix page numbering on first page of chapters
\fancypagestyle{plain} {
  \fancyhf{}                          % clear default settings
  \fancyhead[R]{\thepage}             % put page number right
  \renewcommand{\headrulewidth}{0pt}  % no headrule
}
% END PAGE NUMBERING
%-----------------------

% The guidelines state Arial for the headings. We prefer latin modern
% (the best we could find without importing fonts via lualatex / xetex)
% \usepackage{sectsty}
% \allsectionsfont{\fontfamily{lmss}\selectfont}
% \sectionfont{\sffamily}
% \subsectionfont{\sffamily}
% \subsubsectionfont{\sffamily}

%CHAPTERS
\usepackage{titlesec}
\titleformat{\chapter}[hang]{\huge\bfseries}
    {
    \sf\bfseries\thechapter\hspace{20pt}\textcolor{grayBT}{|}\hspace{20pt}}{0pt}{\Huge\sf\bfseries
    }
%END CHAPTERS











\usepackage{makeidx}
\makeindex

% === Some useful packages
\usepackage[obeyFinal,textsize=tiny]{todonotes}
\usepackage{indentfirst}
\usepackage{cleveref}

% ==== For synatax highlighting.
\usepackage[final]{listings}
\lstdefinestyle{custompython}{
  backgroundcolor=\color{backcolour},
  basicstyle=\ttfamily\color{gray},
  breaklines=true,
  captionpos=b,
  commentstyle=\color{commentgrey},
  escapeinside={\%*}{*)},
  keywordstyle=\color{blue},
  stringstyle=\color{RawSienna},
  language=python,
  showtabs=true
}
\lstset{style=custompython}


%-----------------------
% TITLE PAGE


% ---- Tom's stupid degree stuff -----
\newcommand{\@degree}{}% full degree
\newcommand{\degree}[1]{%
  \gdef\@degree{#1}%
}
% ----- end tom's madness ----

% For positioning the bottom block, we use (and set up) textpos http://cs.brown.edu/about/system/managed/latex/doc/textpos.pdf
%\def\basiceval#1{\the\numexpr#1\relax}
%\usepackage[absolute]{textpos}  
%\setlength{\TPHorizModule}{\basiceval{\textheight / 10}pt}
%\setlength{\TPVertModule}{\TPHorizModule}
%\textblockorigin{
%\iffalse
\renewcommand{\maketitle}
        {  
            {
            \makeatletter
            %\topmargin 0cm
            \pagestyle{empty}
            \bgroup\setlength{\parindent}{0pt}
                \fontfamily{lmss}\selectfont
                % \sf
                \begin{flushright}
                    {\Huge\textbf{\@title}} \\[20pt]
                    \large\textbf{\@author} \\[16cm]
                \end{flushright}    
                \begin{flushleft}    
                    % \@qualifications \\
                    Submitted in fulfilment of the requirements for the Degree of \@degree \\
                    School of Computing Science \\
                    College of Science and Engineering \\
                    University of Glasgow \\
                    {\fontfamily{lmss}\selectfont \small
                        \copyright~\@author
                    }
                \end{flushleft}
            \egroup
            \makeatother
            }
        }
%\fi
%}
% END TITLE PAGE
%-----------------------


