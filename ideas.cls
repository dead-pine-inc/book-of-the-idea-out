\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ideas}[2015/05/09 v0.1.3]

%% размеры шрифтов (14 pt у основного)
%% http://en.wikibooks.org/wiki/LaTeX/Fonts#Sizing_text
\newcommand\tiny{\@setfontsize\tiny{6pt}{7.2pt}}
\newcommand\scriptsize{\@setfontsize\scriptsize{8pt}{9.6pt}}
\newcommand\footnotesize{\@setfontsize\footnotesize{10pt}{12pt}}
\newcommand\small{\@setfontsize\small{12pt}{14.4pt}}
\renewcommand\normalsize{\@setfontsize\normalsize{14pt}{16.8pt}}
\newcommand\large{\@setfontsize\large{17pt}{20.4pt}}
\newcommand\Large{\@setfontsize\Large{20pt}{24pt}}
\newcommand\LARGE{\@setfontsize\LARGE{25pt}{30pt}}
\newcommand\huge{\@setfontsize\huge{29.17pt}{35pt}}
\newcommand\Huge{\@setfontsize\Huge{33.3pt}{40pt}}

%% параметры страницы
%% http://en.wikibooks.org/wiki/LaTeX/Page_Layout#Page_dimensions

%% высота и ширина страницы
\setlength\paperheight{297mm} % A4
\setlength\paperwidth{210mm}

% абзацный отступ
\setlength\parindent{1.5em}

% ширина текста на странице
\setlength\textwidth{\paperwidth}
\addtolength\textwidth{-3cm}
\addtolength\textwidth{-1.5cm}

% высота текста на странице
\setlength\textheight{\paperheight}
\addtolength\textheight{-2cm}
\addtolength\textheight{-2cm}

% горизонтальные отступы
\setlength\hoffset{-1in}
\setlength\oddsidemargin{3cm}
\setlength\evensidemargin{3cm}

% вертикальные отступы
\setlength\voffset{-1in}
\setlength\topmargin{2cm}
\setlength\headheight{0cm}
\setlength\headsep{0cm}

% отступ подвала страницы (от низа текста до нижнего колонтитула)
\setlength\footskip{1.5cm}

% вид нумерации страниц
\newcommand\thepage{\arabic{page}}
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{\z@}

% стиль колонтитулов
\pagestyle{plain}

\setcounter{secnumdepth}{3}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\renewcommand\thesection{\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}

%% \startsection{<name>}{<level>}{<indent>}
%% {<beforeskip>}{<afterskip>}{<style>}*[<altheading>]{<heading>}
\newcommand\iraggedright{%
  \let\\\@centercr\@rightskip\@flushglue \rightskip\@rightskip
  \leftskip\z@skip}
\newcommand\section{
    \@startsection{section}{1}{\z@}{.9cm}{.5cm}
    {\normalfont\normalsize\iraggedright\center\MakeUppercase}}
\newcommand\ssection[1]{
    \section*{#1}
ideas    \addcontentsline{toc}{section}{#1}}
\newcommand\subsection{
    \@startsection{subsection}{2}{\parindent}{.9cm}{.5cm}
    {\normalfont\normalsize\iraggedright}}
\newcommand\subsubsection{
    \@startsection{subsubsection}{3}{\parindent}{.9cm}{.5cm}
    {\normalfont\normalsize\iraggedright}}
% \newcommand\paragraph{
%     \@startsection{paragraph}{4}{\parindent}{.5cm}{.5cm}
%     {\normalfont\normalsize\raggedright}}
% \newcommand\subparagraph{
%     \@startsection{subparagraph}{5}{\parindent}{.5cm}{.5cm}
%     {\normalfont\normalsize\raggedright}}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setlength{\tabcolsep}{6\p@}
\setlength{\arraycolsep}{5\p@}

\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname%
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
%\newcommand*\l@section[2]{%
  %\ifnum \c@tocdepth >\z@
    %\addpenalty\@secpenalty
    %\addvspace{1.0em \@plus\p@}%
    %\setlength\@tempdima{1.5em}%
    %\begingroup
      %\parindent \z@ \rightskip \@pnumwidth
      %\parfillskip -\@pnumwidth
      %\leavevmode \bfseries
      %\advance\leftskip\@tempdima
      %\hskip -\leftskip
      %#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    %\endgroup
  %\fi}
\newcommand*\l@section{\@dottedtocline{1}{0em}{1em}}
\newcommand*\l@subsection{\@dottedtocline{2}{1em}{2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{2em}{3em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{3em}{4em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{4em}{5em}}

\newdimen\bibindent%
\setlength\bibindent{1.5em}
\renewcommand{\@biblabel}[1]{#1}
\newenvironment{thebibliography}[1]
     {\ssection{\refname%
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

%% \newenvironment{name}[num]{before}{after}
\newenvironment{titlepage}{
    \newpage
    \thispagestyle{empty}
    %\setcounter{page}\@ne
}
{
    \newpage
    %\setcounter{page}\@ne
}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@arabic\c@enumii}
\renewcommand\theenumiii{\@arabic\c@enumiii}
\renewcommand\theenumiv{\@arabic\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{\theenumi.\theenumii.}
\newcommand\labelenumiii{\theenumi.\theenumii.\theenumiii.}
\newcommand\labelenumiv{\theenumi.\theenumii.\theenumiii.\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi.\theenumii}
\renewcommand\p@enumiv{\p@enumiii.\theenumiii}
\newcommand\labelitemi{\normalfont\bfseries \textendash}
\newcommand\labelitemii{\textasteriskcentered}
\newcommand\labelitemiii{\textperiodcentered}
\newcommand\labelitemiv{\textbullet}

\def\@listi{\leftmargin 2.5em
            \labelsep .5em
            \labelwidth\leftmargin
            \advance\labelwidth-\labelsep
            \parsep 0.5\p@
            \topsep 5\p@
            \itemsep 0\p@}
\def\@listii{\leftmargin 2.2em
             \labelwidth\leftmargin
             \advance\labelwidth-\labelsep}
\def\@listiii{\leftmargin 1.9em
              \labelwidth\leftmargin
              \advance\labelwidth-\labelsep}
\def\@listiv {\leftmargin 1.7em
              \labelwidth\leftmargin
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin 1.6em
              \labelwidth\leftmargin
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin 1.5em
              \labelwidth\leftmargin
              \advance\labelwidth-\labelsep}

% figure
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

% table
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

% captions
\RequirePackage{hyphenat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\newcommand\captiondelim{~---~}
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small #1\captiondelim \nohyphens{#2}}%
  \ifdim \wd\@tempboxa >\hsize
    \small #1\captiondelim \nohyphens{#2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\newcounter{task}
\renewcommand\thetask{\@arabic\c@task}
\newenvironment{task}[1][]{\refstepcounter{task}\par\medskip\noindent%
   \textbf{\taskname~\thetask. (#1)} \itshape}{\medskip}
\endinput

\@addtoreset{equation}{section}
\renewcommand\theequation{%
  \ifnum \c@section>\z@ \thesection.\fi\@arabic\c@equation}
