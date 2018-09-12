\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fernandes_supp}[04/26/2017, v1.4]
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass{extarticle}

% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{mathpazo} % Widely available alternative to Garamond
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\RequirePackage[colorlinks=true, allcolors=color1]{hyperref}

\newcommand{\headerfont}{\normalfont\sffamily\fontsize{7}{9} \selectfont}
\newcommand{\titlefont}{\normalfont\sffamily\bfseries\fontsize{22}{25}\selectfont}
\newcommand{\datesfont}{\normalfont\sffamily\itshape\fontsize{9}{11}\selectfont}
\renewcommand\UrlFont{\color{color1}\sffamily}
\newcommand{\absfont}{\normalfont\rmfamily\bfseries\fontsize{11}{14}\selectfont}
\newcommand{\copyrightfont}{\normalfont\rmfamily\fontsize{11}{14}\selectfont}
\newcommand{\ociscodefont}{\normalfont\sffamily\fontsize{9}{11}\selectfont}

% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{1em}
\renewcommand\Authfont{\color{color2}\normalfont\sffamily\bfseries\scshape\fontsize{15}{17}\selectfont}
\renewcommand\Affilfont{\color{color0}\normalfont\sffamily\itshape\fontsize{9}{11}\selectfont}

% Options for element switching
\RequirePackage{xifthen}
\newboolean{displaycopyright}
\newboolean{shortarticle}
\newboolean{minireview}

% Copyright statement
\RequirePackage{textcomp} % For copyright symbol styling
\newcommand{\copyrightstatement}{\, \textcopyright\, 2016 Optical Society of America}

% Graphics, tables and other formatting
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{changepage}
\RequirePackage[left=48pt,%
                right=42pt,%
                top=46pt,%
                bottom=40pt,%
                headheight=15pt,%
                headsep=10pt,%
                letterpaper,twoside]{geometry}%
%\RequirePackage[labelfont={bf,sf},%
%                labelsep=period,%
%                figurename=Fig.,%
%                singlelinecheck=off,%
%                justification=RaggedRight]{caption}
\RequirePackage{caption}
\DeclareCaptionFont{colorcaption}{\color{color2}}
\usepackage[labelfont={colorcaption,bf,sf},width=0.7\textwidth,format=hang]{caption}
% \captionsetup{font=doublespacing} %double spacing of captions

\setlength{\columnsep}{24pt} % Distance between the two columns of text
\setlength{\parindent}{12pt} % Paragraph indent

% Set document color scheme
\definecolor{color0}{RGB}{0,0,0} % Base
\definecolor{color1}{RGB}{59,90,198} % author email, doi
\definecolor{color2}{RGB}{165,28,48} % Header, authors, table lines
\definecolor{color3}{RGB}{16,131,16} % Header, authors, table lines      
% Bibliography    
% % https://en.wikibooks.org/wiki/LaTeX/More_Bibliographies
%\RequirePackage[numbers,sort&compress]{natbib}
%\setlength{\bibsep}{0.0pt}
%\RequirePackage[sort&compress,square,comma,authoryear]{natbib}
\RequirePackage[round]{natbib}
%%%%%%%%%%%%%%%%%%
% LLT: use abbreviated style if shortarticle
%\AtBeginDocument{%
%  \ifthenelse{\boolean{shortarticle}}%
%  {\bibliographystyle{osajnlnt}}%
%  {\bibliographystyle{osajnl}}%
%}

%% LLT: Providing the list of full refs
% Creating a new bibliography
%\RequirePackage[resetlabels]{multibib}
%\newcites{fullrefs}{Full References}  %% Or whatever the heading might be
%\bibliographystylefullrefs{osajnl}    %% The full style

% Patching \cite to automatically add cite
% to fullrefs list
%\RequirePackage{letltxmacro}
%\RequirePackage{xparse}
%\LetLtxMacro\oldcite\cite
%\RenewDocumentCommand{\cite}{O{} O{} m}{\oldcite[#1][#2]{#3}\nocitefullrefs{#3}}
%%% 13 Jul 2016: Patch the same for \citep and \citet
%\LetLtxMacro\oldcitep\citep
%\RenewDocumentCommand{\citep}{O{} O{} m}{\oldcitep[#1][#2]{#3}\nocitefullrefs{#3}}
%\LetLtxMacro\oldcitet\citet
%\RenewDocumentCommand{\citet}{O{} O{} m}{\oldcitet[#1][#2]{#3}\nocitefullrefs{#3}}

% Silence the "citation multiply defined" warning
%\RequirePackage{silence}
%\WarningFilter{natbib}{Citation `}
%\WarningFilter{natbib}{There were multiply}
%\WarningFilter{caption}{Unused \captionsetup}
%%%%%%%%%%%%%%

%\newlength{\biblabelwidth}
%\settowidth{\biblabelwidth}{00. }
%\makeatletter
%\renewcommand\@biblabel[1]{\makebox[\biblabelwidth][l]{#1.}} % Remove brackets from label
%\def\tagform@#1{\maketag@@@{\bfseries(\ignorespaces#1\unskip\@@italiccorr)}}
%\renewcommand{\eqref}[1]{\textup{{\normalfont Eq.~(\ref{#1}}\normalfont)}}
%\makeatother

% Table style
\arrayrulecolor{color2} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.5} % Increased line spacing
\captionsetup[table]{position=below} % Reduce spacing below caption

% Algorithm style
\makeatletter
\newcommand\fs@coloruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@coloruled
  \def\@fs@pre{\kern2pt}%
  \def\@fs@post{\kern2pt{\color{color2}\hrule}\relax}%
  \def\@fs@mid{\kern2pt{\color{color2}\hrule}\kern2pt}%
  \let\@fs@iftopcapt\iftrue}
\makeatother

\floatstyle{coloruled}
\restylefloat{algorithm}

\usepackage{datetime}
\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH] \THEYEAR}
% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\fancyhead[LE]{\headerfont \begin{tabular*}{\textwidth}{!{\color{black}\vrule}c!{\color{black}\vrule} @{\extracolsep{\fill}} c!{\color{black}\vrule}}\arrayrulecolor{black}
      \hline
      \cellcolor{black}\textcolor{white}{\ifthenelse{\boolean{minireview}}{Mini Review}{\ifthenelse{\boolean{shortarticle}}{Letter}{Advanced Materials Supplemental Information}}} & Vol. X, No. X / \monthyeardate\today \hspace{21pt}\thepage/\pageref*{LastPage} \\
      \hline
    \end{tabular*}}
\fancyhead[RO]{\headerfont \begin{tabular*}{\textwidth}{!{\color{black}\vrule}c!{\color{black}\vrule} @{\extracolsep{\fill}} c!{\color{black}\vrule}}\arrayrulecolor{black}
      \hline
      \cellcolor{black}\textcolor{white}{\ifthenelse{\boolean{minireview}}{Mini Review}{\ifthenelse{\boolean{shortarticle}}{Letter}{Advanced Materials Supplemental Information}}} & Vol. X, No. X / \monthyeardate\today \hspace{21pt}\thepage/\pageref*{LastPage} \\
      \hline
    \end{tabular*}}
\fancyhead[LO,RE]{}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
%\renewcommand{\thesubsection}{\Alph{subsection}}

\titleformat{\section}
  {\large\sffamily\bfseries}
  {\thesection.}
  {0.5em}
  {\MakeUppercase{#1}}
  []
\titleformat{name=\section,numberless}
  {\large\sffamily\bfseries}
  {}
  {0em}
  {\MakeUppercase{#1}}
  []  
\titleformat{\subsection}
  {\sffamily\bfseries}
  {\thesubsection.}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries\itshape}
  {\thesubsubsection.}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}


% Article meta data additional fields
\newcommand{\keywords}[1]{\def\@ociscodes{#1}}
\newcommand{\ociscodesname}{\textbf{\textit{Keywords:}}} % Defines the heading name
\newcommand{\dates}[1]{\def\@dates{#1}}
\newcommand{\doi}[1]{\def\@doi{#1}}


%%%%% Commented for no ABSTRACT %%%%%%%%%
% \def\xabstract{abstract}
% \long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract 
% \long\gdef\theabstract{\ignorespaces#1}
% \def\go{\end{abstract}}\else
% \typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J
% COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
% \gdef\theabstract{\vskip12pt BADLY FORMED ABSTRACT: PLEASE DO
% NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN
% THE ABSTRACT\vskip12pt}\let\go\relax\fi
% \go}

% Define a new environment with abstract content and styling
% (to enable switching between long and short articles)

%%%%% Commented for no ABSTRACT %%%%%%%%%
% \newcommand{\abscontent}{
% \noindent
% {%
% \parbox{\dimexpr\linewidth}{%
% 	\absfont \vspace*{-1.5em}\section*{Abstract:} \singlespace\linespread{0.7}\theabstract \\
%     \copyrightfont \ifthenelse{\boolean{displaycopyright}}{\copyrightstatement}{}
% }%
% }%
% \vskip8pt%
% \noindent
% \parbox{\dimexpr\linewidth}{%
% {\ociscodefont \ociscodesname\hspace*{0.5em} \@ociscodes}%
% }%
% \vskip8pt%
% \noindent
% \parbox{\dimexpr\linewidth}{%
% \@doi%
% }%
% \hfil\rule{\linewidth}{.4pt}
% }

% Custom title page 
\renewcommand{\@maketitle}{\singlespace%
{%
\vskip25pt%
{\raggedright \titlefont \@title\par}%
\vskip11pt
{\raggedright \@author\par}
\vskip11pt%
{\raggedright \datesfont \@dates\par}
\vskip1pt%
{\raggedright\@doi}%%%%%% Commented for no ABSTRACT %%%%%%%%%
\ifthenelse{\boolean{shortarticle}}
{% just a single line for short article
\rule{\linewidth}{.4pt}
\vskip12pt}
{% else display the abstract contents (in reduced width box)
{%
\begin{adjustwidth}{24pt}{24pt}
\rule{\linewidth}{.4pt}
\vskip12pt%
% \abscontent %%%%% Commented for no ABSTRACT %%%%%%%%%
\end{adjustwidth}
}%
\vskip25pt%
}%
}%
}%

% Other packages
\RequirePackage{enumitem} % For reducing bullet list item separation
\usepackage{lipsum} % Required to insert dummy text

% Delay certain patches/options till \begin{document} when all the booleans are set
\RequirePackage{etoolbox}
%% Change pagestyle to fancy after \maketitle
\apptocmd{\maketitle}
  {\thispagestyle{fancy}}
  {\typeout{Banner added to title page.}}%
  {\ClassWarning{optica}{Could not change title page style.}}

\AtBeginDocument{%
  %% If short article, add the abstract _after_ \maketitle i.e. in 2-column mode
  \ifthenelse{\boolean{shortarticle}}{%
    \apptocmd{\maketitle}{\abscontent}%
    {\typeout{shortarticle: Abstract in left column.}}%
    {\ClassWarning{optica}{shortarticle: Couldn't add abstract after title.}}%
  }{}
  %
  %% If shortarticle, there will be a pagebreak before \bibliographyfullrefs
%  \ifthenelse{\boolean{shortarticle}}{%
%    \pretocmd{\bibliographyfullrefs}{\clearpage}%
%       {\typeout{shortarticle: Page break added before full references.}}%
%       {\ClassWarning{optica}{shortarticle: Couldn't add page break before full references.}}%
%  }{}
}

%% Default template values
\setboolean{shortarticle}{false}
\setboolean{minireview}{false}
\setboolean{displaycopyright}{false}

\dates{Compiled \usdate\today}
%\doi{\url{http://dx.doi.org/}}
% \doi{Edit paper at: \href{http://fer.me/spongesup}{fer.me/SpongeSup}}
\doi{}

%% Matheus Imported functions
\usepackage[nameinlink]{cleveref}
\usepackage{indentfirst}
\usepackage{setspace}
\usepackage{color,soul}

% setting line numbers
\usepackage{lineno}
\renewcommand{\linenumberfont}{\normalfont\bfseries\small\color{color2}}
\setlength\linenumbersep{0.1cm}

%% Equation functions
% \newcommand{\e}[1]{\[#1\]}
% \newcommand{\be}[1]{\[\boxed{#1}\]}
% \newcommand{\eq}[1]{\begin{equation}#1\end{equation}}
% \newcommand{\eql}[2]{\begin{equation}\label{#2}#1\end{equation}}
% \newcommand{\beq}[1]{\begin{equation}\boxed{#1}\end{equation}}
% \newcommand{\beql}[2]{\begin{equation}\label{#2}\boxed{#1}\end{equation}}
%command for figure
\newcommand{\fig}[3]{\begin{figure}[H]\centering\includegraphics[width=#2\linewidth]{#1}\caption{#3}\end{figure}}
\newcommand{\figl}[4]{\begin{figure}[H]\centering\includegraphics[width=#2\linewidth]{#1}\caption{#3}\label{#4}\end{figure}}
\newcommand{\figll}[3]{\begin{figure}[H]\centering\includegraphics[width=#2\linewidth]{#1}\caption{#3}\label{#1}\end{figure}}