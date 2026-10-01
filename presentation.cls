\ProvidesClass{presentation}[]
\LoadClass[hyperref={pdfencoding=auto, psdextra}]{beamer}

% Pakete
\RequirePackage[main=ngerman]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{multicol}
\RequirePackage{subcaption}
\RequirePackage{tcolorbox}
\RequirePackage{xcolor}
\RequirePackage{pdfpages}
\RequirePackage{mss}
\RequirePackage{etoolbox}
\RequirePackage{contour}
\RequirePackage{scalerel}
\RequirePackage{MnSymbol,wasysym}
\RequirePackage{amsmath}
\RequirePackage{array}

% Schriftgrößen
\setbeamerfont{title}{series=\bfseries,size=\LARGE}
\setbeamerfont{subtitle}{series=\bfseries,size=\Large}
\setbeamerfont{frametitle}{series=\bfseries,size=\small}
\setbeamerfont{block title}{series=\bfseries,size=\normalsize}
\setbeamerfont{normalsize}{size=\normalsize}
\setbeamerfont{largesize}{size=\large}
\setbeamerfont{headline}{size=\small}
\setbeamerfont{footline}{size=\tiny}

% Schriftfarben
\setbeamercolor{title}{fg=black}
\setbeamercolor{subtitle}{fg=black}
\setbeamercolor{frametitle}{fg=blue}
\setbeamercolor{block title}{fg=black}
\setbeamercolor{structure}{fg=black}
\setbeamercolor{headline}{fg=black}
\setbeamercolor{footline}{fg=black}
\setbeamercolor{normal text}{fg=black}

\newcommand{\bfrightarrow}{\contour{black}{$\rightarrow$}\;}

\newcommand{\bfplus}{\contour{black}{+}}

\newcommand{\bfminus}{\contour{black}{--}}

% Einzug
\def\einzug{10pt}
\setbeamersize{text margin left=\einzug}
% Navigationssymbole und Frametitle weg
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{frametitle}{}

% Makros für die Titelfolie
\def\theveranstaltung{}
\def\theveranstaltungstitel{}
\def\theveranstaltungsart{}
\def\thedatum{}
\def\thedozent{}
\def\thesemester{}
\def\thelehrstuhl{}
\def\theuniversitaet{}
\def\thedauer{}

\newcommand{\veranstaltung}[1]{\def\theveranstaltung{#1}}
\newcommand{\veranstaltungstitel}[1]{\def\theveranstaltungstitel{#1}}
\newcommand{\veranstaltungsart}[1]{\def\theveranstaltungsart{#1}}
\newcommand{\datum}[1]{\def\thedatum{#1}}
\newcommand{\dozentin}[1]{\def\thedozent{#1}}
\newcommand{\dauer}[1]{\def\thedauer{#1}}
\newcommand{\semester}[1]{\def\thesemester{#1}}
\newcommand{\lehrstuhl}[1]{\def\thelehrstuhl{#1}}
\newcommand{\universitaet}[1]{\def\theuniversitaet{#1}}

% Kopfzeile

\setbeamertemplate{headline}{%
	\usebeamerfont{frametitle}
	\vskip10pt
	\hskip\einzug
	\ifx\insertsubsubsubsectionhead\empty
		\ifx\insertsubsubsectionhead\empty
			\ifx\insertsubsectionhead\empty
				\insertsection
			\else
				\insertsubsection
			\fi
		\else
			\insertsubsubsection
		\fi
	\else
		\insertsubsubsection \, -- \insertsubsubsubsection
	\fi
	\vskip5pt
	\rule{\paperwidth}{0.5pt}
}

% Fußzeile

\setbeamertemplate{footline}{
	\usebeamerfont{footline}
	\rule{\paperwidth}{0.5pt}
	\vskip5pt
	\hskip\einzug
	\ifx\insertsubsubsubsectionhead\empty
		\ifx\insertsubsubsectionhead\empty
			\ifx\insertsubsectionhead\empty
				\insertsection
			\else
				\insertsection\, -- \insertsubsection
			\fi
		\else
			\insertsection \, -- \insertsubsection \, -- \insertsubsubsection
		\fi
	\else
		\insertsection \, -- \insertsubsection \, -- \insertsubsubsection \, -- \insertsubsubsubsection
	\fi
	\hfill \insertframenumber/\inserttotalframenumber \quad\;
	\vskip5pt
}

% Titelfolie
\setbeamertemplate{title page}{
	\begin{center}
		\vspace{1cm}
		\theveranstaltungsart \par
		{\usebeamerfont{title} \theveranstaltung} \par	\vspace{2cm}
		{\usebeamerfont{large} \bf \thedozent \par
			\thelehrstuhl \par
			\theuniversitaet \par}
	\end{center}
}

% Sectionfolie
\setbeamertemplate{section page}{
	\usebeamerfont{section title}
	\usebeamercolor[fg]{section title}
	\begin{center}
		\centering \bf \insertsectionnumber. \insertsection
	\end{center}
}

% Itemize & Enumerate

% Items als kleine, einstellbare Circles und nicht die Standard-Pfeile
\newcommand\centerbox[1]{$\vcenter{\hbox{#1}}$}
\defbeamertemplate*{itemize item}{custom circle}[1][.5ex]{%
	\centerbox{\tikz\fill (0,0) circle (#1);}}
\defbeamertemplate*{itemize subitem}{custom circle}[1][.3ex]{%
	\centerbox{\tikz\fill (0,0) circle (#1);}}
\defbeamertemplate*{itemize subsubitem}{custom circle}[1][.3ex]{%
	\centerbox{\tikz\fill (0,0) circle (#1);}}

\defbeamertemplate*{itemize item}{custom circle grey}[1][.5ex]{%
	\centerbox{\tikz\fill[gray] (0,0) circle (#1);}}

\setbeamertemplate{itemize item}[custom circle][1.5pt]
\setbeamertemplate{itemize subitem}[custom circle][1.0pt]
\setbeamertemplate{itemize subsubitem}[custom circle][0.6pt]

\setbeamertemplate{enumerate item}{\insertenumlabel.}

% Aufgabenumgebungen
\newcommand{\grau}[1]{\textcolor{gray}{#1}}
\newcommand{\tri}{\textcolor{gray}{$\blacktriangleright$ }}
\newcommand{\aufgabe}[1]{\grau{\tri #1 \\}}
\newenvironment{aufgabenstruktur}
{\begingroup
	\setbeamercolor{normal text}{fg=gray}
	\setbeamercolor{itemize/enumerate body}{fg=gray}
	\setbeamercolor{itemize/enumerate subbody}{fg=gray}
	\setbeamercolor{itemize/enumerate subsubbody}{fg=gray}
	\setbeamertemplate{itemize item}[custom circle grey][1.5pt]
	\setbeamertemplate{enumerate item}{\grau{\insertenumlabel.}}
}
{\endgroup}

% Farben für Boxumgebungen
\tcbuselibrary{skins,theorems}
\definecolor{greyred}{RGB}{187,144,158}
\definecolor{greyblue}{RGB}{144,158,187}
\definecolor{greygreen}{RGB}{144,187,158}
\definecolor{greyyellow}{RGB}{187,176,144}
% Box-Umgebungen
\tcbset{
	myboxblue/.style={
			colback=greyblue!15,
			colbacktitle=greyblue!50,
			coltitle=greyblue!10!black,
			colframe=greyblue!10!black,
			coltext=greyblue!10!black,
			boxrule=0.8pt,
			titlerule=0.8pt,
			arc=1pt,
			theorem name,
			title={#1},
			toptitle=2pt,
			bottom=2pt,
			top=2pt,
			left=2pt,
			right=2pt
		}
}

\tcbset{
	myboxgreen/.style={
			colback=greygreen!15,
			colbacktitle=greygreen!50,
			coltitle=greygreen!10!black,
			colframe=greygreen!10!black,
			coltext=greygreen!10!black,
			boxrule=0.8pt,
			titlerule=0.8pt,
			arc=1pt,
			theorem name,
			title={#1},
			toptitle=2pt,
			bottom=2pt,
			top=2pt,
			left=2pt,
			right=2pt,
			blend before title=dash
		}
}

\tcbset{
	myboxred/.style={
			colback=greyred!15,
			colbacktitle=greyred!50,
			coltitle=greyred!10!black,
			colframe=greyred!10!black,
			coltext=greyred!10!black,
			boxrule=0.8pt,
			titlerule=0.8pt,
			arc=1pt,
			theorem name,
			title={#1},
			toptitle=2pt,
			bottom=2pt,
			top=2pt,
			left=2pt,
			right=2pt
		}
}

\tcbset{
	myboxyellow/.style={
			colback=greyyellow!5,
			colbacktitle=greyyellow!50,
			coltitle=greyyellow!10!black,
			colframe=greyyellow!10!black,
			coltext=greyyellow!10!black,
			boxrule=0.8pt,
			titlerule=0.8pt,
			arc=1pt,
			theorem name,
			title={#1},
			toptitle=2pt,
			bottom=2pt,
			top=2pt,
			left=2pt,
			right=2pt
		}
}

\newtcbtheorem{defi}{\textbf{Definition}}{myboxred}{}
\newtcbtheorem{merke}{\textbf{Note}}{myboxgreen}{}
\newtcbtheorem{satz}{\textbf{Theorem}}{myboxblue}{}
\newtcbtheorem{beispiel}{\textbf{Example}}{myboxyellow}{}

% Define subsubsubsection
\newcounter{subsubsubsection}[subsubsection]

\renewcommand{\thesubsubsubsection}{}

\newcommand{\subsubsubsection}[1]{
	\refstepcounter{subsubsubsection}
	\def\insertsubsubsubsection{#1}
	\def\insertsubsubsubsectionhead{#1}
}

\def\insertsubsubsubsection{}
\def\insertsubsubsubsectionhead{}

% set subsubsubsection(head) empty for new ((sub)sub)section
\pretocmd{\subsubsection}{
	\def\insertsubsubsubsectionhead{}
	\def\insertsubsubsubsection{}
}{}{}
\pretocmd{\subsection}{
	\def\insertsubsubsubsectionhead{}
	\def\insertsubsubsubsection{}
}{}{}
\pretocmd{\section}{
	\def\insertsubsubsubsectionhead{}
	\def\insertsubsubsubsection{}
}{}{}


