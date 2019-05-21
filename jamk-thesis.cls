\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jamk-thesis}[2019/01/01 JAMK Thesis]
\LoadClass[a4paper,12pt]{article}
\usepackage{multirow}
\usepackage[british]{babel}
\usepackage[margin=2cm,left=4.3cm]{geometry}
\usepackage[nottoc]{tocbibind}
\usepackage[parfill]{parskip}
\usepackage{caption}
\usepackage{csquotes}
\usepackage{fancyhdr}
\usepackage{float}
\usepackage{placeins}
\usepackage{fontspec}
\usepackage{graphicx}
\usepackage{listings}
\usepackage{polyglossia}
\usepackage{sectsty}
\usepackage{setspace}
\usepackage{lastpage}

\usepackage{titlesec}
\usepackage{letltxmacro}



\RequirePackage{tikz}
\RequirePackage{color}
\RequirePackage{titletoc}

% Set path to graphics folder
\graphicspath{ {images/} }

\setdefaultlanguage[variant=british]{english}

\definecolor{jamkblue}{RGB}{0, 90, 125}



% Current date formatted
%\def\mydate{\leavevmode\hbox{\mkbibmonth{\month} \the\year}}


%%%%%%%%%%%%%%%%%%%%%%%%%
% Text formatting
%%%%%%%%%%%%%%%%%%%%%%%%%

% Font
\setmainfont{Carlito}

\setlength{\headheight}{14.5pt}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}

\sectionfont{\fontsize{18pt}{18pt}\selectfont}

% set paragraph line spacing to 1.5
\renewcommand{\baselinestretch}{1.5}

% Titles
\titlespacing*{\section}
	{0pt}
	{0pt}
	{2em}

%% Sub section formatting
\titleformat{\subsection}
	{\fontsize{14pt}{14pt}\normalfont}
	{\thesubsection}
	{2em}
	{}

%% sub sub section formatting
\titleformat{\subsubsection}
	{\fontsize{13pt}{13pt}\normalfont}
	{\thesubsubsection}
	{2em}
	{}

% Indent and parskip size
\setlength{\parindent}{0mm}
\setlength{\parskip}{2.5mm}

\setcounter{tocdepth}{3}

% TOC entry formats.
\usepackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}
\urlstyle{same}

\titlecontents{section}
  [0mm]{\vskip5mm\bfseries\large}{\contentslabel{1em}}{}{\titlerule*[1mm]{.}\contentspage}
  
\titlecontents{subsection}
  [10mm]{\large}{\contentslabel{2em}}{}{\titlerule*[1mm]{.}\contentspage}
  
\titlecontents{subsubsection}
  [20mm]{\large}{\contentslabel{2em}}{}{\titlerule*[1mm]{.}\contentspage}

\titlecontents{figure}
  [16mm]{}
  {\contentslabel{16mm}}{}
  {\titlerule*[1mm]{.}\contentspage}
  
\titlecontents{table}
  [15mm]{}
  {\contentslabel{15mm}}{}
  {\titlerule*[1mm]{.}\contentspage}
  






%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover page
%%%%%%%%%%%%%%%%%%%%%%%%%

% Add access to parameters and default values
\renewcommand*{\@title}{Opinnäytetyö nimi}

\newcommand*{\undertitle}[1]{\gdef\@undertitle{#1}}
\newcommand*{\@undertitle}{Mahdollinen alanimi}

\renewcommand*{\@author}{Etunimi Sukunimi}

\newcommand*{\tyyppi}[1]{\gdef\@tyyppi{#1}}
\newcommand*{\@tyyppi}{Opinnäytetyö}

\renewcommand*{\@date}{Kuukausi/Vuosi}

\newcommand*{\ala}[1]{\gdef\@ala{#1}}
\newcommand*{\@ala}{Tekniikan ja liikenteen ala}

\newcommand*{\tutkinto}[1]{\gdef\@tutkinto{#1}}
\newcommand*{\@tutkinto}{Tieto- ja viestintätekniikan tutkinto-ohjelma}


% Cover page
\renewcommand{\maketitle}[1]{

  \begin{titlepage}
 
    \begin{tikzpicture}[remember picture,overlay,shift={(29mm,-4mm)}]
      \node (0,0)
        {\includegraphics[width=58.7mm]{images/jamk.png}};
    \end{tikzpicture}
    \begin{tikzpicture}[remember picture,overlay,shift={(-24mm,-255mm)}]
      \fill [jamkblue] (9.51mm,257.19mm) rectangle (0,0);
    \end{tikzpicture}
    \begin{tikzpicture}[remember picture,overlay,shift={(38mm,-247mm)}]
      \node (0,0)
        {\includegraphics[width=87.21mm]{images/jamk_long.png}};
    \end{tikzpicture}

\fussy

    % Cover page texts
    \leavevmode\\[10\baselineskip]
    \textbf{\fontsize{26pt}{26pt}\selectfont \@title}\par
    \textbf{\fontsize{18pt}{18pt}\selectfont \@undertitle} \\[1\baselineskip]
    \linespread{1.2}\fontsize{14pt}{14pt}\selectfont{
      \@author \\[6\baselineskip]
      \@tyyppi \\
      \@date \\
      \@ala \\
      \@tutkinto
    }
  \end{titlepage}
}





%%%%%%%%%%%%%%%%%%%%%%%%%
% Description page
%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makedescription}{TODO}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Attachment stuff
% code blocks, images, tables etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareCaptionListFormat{jamk-table}{#1Table~#2.}
\DeclareCaptionListFormat{jamk-figure}{#1Figure~#2.}

\captionsetup[table]{
    font={stretch=2.0},
    justification=justified,
    singlelinecheck=false,
    listformat=jamk-table,
    labelsep=period,
}
\captionsetup[figure]{
    font={stretch=2.0},
    justification=justified,
    singlelinecheck=false,
    listformat=jamk-figure,
    labelsep=period,
}

\AtBeginDocument{
    \renewcommand{\listfigurename}{Figures}
    \renewcommand{\listtablename}{Tables}
}

% Figure command
% Example:
% \image[2in]{test.png}{fig:dice}{Test caption}
\newcommand{\image}[5][6in]{
    \vspace{1em}
	\begin{figure}[ht]
		\includegraphics[width=#1]{#2}
		\caption{#4}
		\label{#3}
	\end{figure}
    \vspace{1em}
}


% Table command
% Example:
%\jtable
%    {Different types of dice}   % Caption
%    {tbl:dicetypes}             % Label that is used to refence the table
%    {l r l}                     % Table layout
%    {
%        % Table data
%        \textbf{Type} & \textbf{Number of sides} & \textbf{Usage} \\
%        D4 & 4 & Tabletop RPGs \\
%        D6 & 6 & Gambling, games... \\
%        D10 & 10 & Tabletop RPGs \\
%        D20 & 20 & Tabletop RPGs \\
%        D100 & 100 & Tabletop RPGs \\
%    }
\newcommand{\jtable}[4]{
    \vspace{1em}
    \begin{table}[ht]
        \caption{#1}
        \begin{tabular}{ #3 }
            #4
        \end{tabular}
        \label{#2}
    \end{table}
    \vspace{1em}
}




% Code style
\lstdefinestyle{JAMKCodeStyle}{
    %backgroundcolor=\color{lightgray},
    commentstyle=\color{blue},
    keywordstyle=\color{magenta},
    numberstyle=\tiny,
    stringstyle=\color{purple},
    basicstyle=\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}
\lstset{style=JAMKCodeStyle}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References and citations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[
    backend=biber,
    style=authoryear,
    sorting=nty,
 %   isbn=false,
 %   doi=false,
    dateabbrev=false,
    citestyle=authoryear,
    maxbibnames=10,
    citetracker=true,
    maxcitenames=1,
    giveninits=true
]{biblatex}

\renewcommand*\finalnamedelim{\addspace\&\space}

% Make sure full names are shown in citations only once
\AtEveryCitekey{\ifciteseen{}{\defcounter{maxnames}{99}}}

% Change url and urldate order
\renewbibmacro*{url+urldate}{%
  \usebibmacro{urldate}%
  \newunit
  \usebibmacro{url}%
}

\DeclareLanguageMapping{english}{english-apa}

\setlength{\bibhang}{0em}
 
% References and citations
\LetLtxMacro{\oldcite}{\cite}
\renewcommand{\cite}[2][{}]{(\oldcite[#1]{#2})}

% Include biblatex file
\addbibresource{references.bib}

% Fixes bibliography's overfull error
\emergencystretch=1em

% Remove () around year
\usepackage{xpatch}
\xpatchbibmacro{date+extrayear}{%
  \printtext[parens]%
}{%
  \setunit{\addperiod\space}%
  \printtext%
}{}{}

% Remove "in:"
\renewbibmacro{in:}{}

% Add text: Retrieved from
\DeclareFieldFormat{url}{Retrieved from \url{#1}}

% First lastname then firstname
\DeclareNameAlias{author}{last-first}

% Italize title
\DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished]{title}{\textit{#1\isdot}} 

% Make online references non-italic
\DeclareFieldFormat[online]{title}{#1\isdot} 

% Page number format
\DeclareFieldFormat{pages}{#1}

% Add: Accessed text and format date correctly
\DeclareFieldFormat{urldate}{Accessed \thefield{urlday}.\thefield{urlmonth}.\thefield{urlyear}\isdot}
  
% Space between references 
\setlength\bibitemsep{\baselineskip}
