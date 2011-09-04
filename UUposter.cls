%\NeedsTexFormat{LaTeX2e}
\ProvidesClass{UUposter}[2011/09/04 v0.2b Class for making scientific posters in the style of Uppsala University]
\RequirePackage{xkeyval}

\newif\if@uuposter@xetex
\newif\if@uuposter@times
\@uuposter@timestrue
\newif\if@uuposter@helvet
\@uuposter@helvettrue
\newif\if@uuposter@mathtools
\@uuposter@mathtoolstrue
\newif\if@uuposter@red
\newif\if@uuposter@grey
\newif\if@uuposter@top
\newif\if@uuposter@landscape
\newif\if@uuposter@ruled
\newif\if@uuposter@sigil@corner
\newif\if@uuposter@sigil@margin
\newif\if@uuposter@sigil@left
\newif\if@uuposter@sigil@right
\newif\if@uuposter@sigil@top
\newif\if@uuposter@sigil@bottom
\newlength\logoboxwidth
\DeclareOptionX{xetex}{
	\@uuposter@xetextrue
}
\DeclareOptionX{notimes}{
	\@uuposter@timefalse
}
\DeclareOptionX{nohelvet}{
	\@uuposter@helvetfalse
}
\DeclareOptionX{nomathtools}{
	\@uuposter@mathtoolsfalse
}
\DeclareOptionX{mathtools}[]{
	\PassOptionsToPackage{mathtools}{#1}
}
\DeclareOptionX{red}{
	\@uuposter@redtrue
	\@uuposter@greyfalse	
	\ExecuteOptionsX{logo=vit}
}
\DeclareOptionX{grey}{
	\@uuposter@redfalse
	\@uuposter@greytrue
	\ExecuteOptionsX{logo=4f}
}
\DeclareOptionX{top}{\@uuposter@toptrue}
\DeclareOptionX{landscape}{
	\ExecuteOptionsX{sidebarwidth=0.15,titleheight=0.075,columns=3}
	\@uuposter@landscapetrue
}
\DeclareOptionX{portrait}{
	\ExecuteOptionsX{sidebarwidth=0.20,titleheight=0.1,columns=2}
	\@uuposter@landscapefalse
}
\DeclareOptionX{columns}[2]{\def \uucolumns {#1}}
\DeclareOptionX{ruled}{\@uuposter@ruledtrue}

\DeclareOptionX{logo}[4f]{\def\includelogo{\includegraphics[width=\logoboxwidth]{UU_logo_#1_84}}}

\newcommand{\includesigil}{
}
\define@choicekey+{UUposter.cls}{sigil}[\val\nr]{NW,NE,SW,SE,margin}[SE]{
	\ifcase\nr\relax
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{UU_sigill_SO_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@toptrue
		\@uuposter@sigil@lefttrue
		\@uuposter@sigil@bottomfalse
		\@uuposter@sigil@rightfalse
	\or 
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{UU_sigill_SV_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@toptrue
		\@uuposter@sigil@righttrue
		\@uuposter@sigil@bottomfalse
		\@uuposter@sigil@leftfalse
	\or
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{UU_sigill_NO_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@bottomtrue
		\@uuposter@sigil@lefttrue
		\@uuposter@sigil@topfalse
		\@uuposter@sigil@rightfalse
	\or
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{UU_sigill_NV_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@bottomtrue
		\@uuposter@sigil@righttrue
		\@uuposter@sigil@topfalse
		\@uuposter@sigil@leftfalse
	\or
		\@uuposter@sigil@margintrue
		\@uuposter@sigil@cornerfalse
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{UU_marginalsigill_5Svart}}
	\fi
}{%
	\ClassWarning{UUposter}{Ignoring unrecognized value for option 'sigil' (valid options: NW,NE,SW,SE,margin)}
}
\DeclareOptionX{sigilwidth}[0.5]{
	\def\sigilproportion{#1}
}
\DeclareOptionX{sidebarwidth}[0.2]{
	\def\sidebarproportion{#1}
}
\DeclareOptionX{titleheight}[0.1]{
	\def\titleproportion{#1}
}
%%Pass xetex font options off to UUxetex.sty:
\DeclareOptionX{math}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
\DeclareOptionX{noxits}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
\DeclareOptionX{serif}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
\DeclareOptionX{sanserif}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
	
%%Assume unrecognized options are for a0poster class:
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{a0poster}}
\ExecuteOptionsX{grey,sigilwidth,portrait}
\ProcessOptionsX\relax
%%a0poster doesn't seem to like getting multiples of these:
\if@uuposter@landscape
	\PassOptionsToClass{landscape}{a0poster}
\else
	\PassOptionsToClass{portrait}{a0poster}
\fi
\LoadClass{a0poster}

\if@uuposter@mathtools
	\RequirePackage{mathtools}
\fi

\if@uuposter@xetex
	\RequirePackage{UUxetex}
\else
	\if@uuposter@times
		\RequirePackage{times}
	\fi
	\if@uuposter@helvet
		\RequirePackage{helvet}
	\fi
\fi

%%% Colors:
\RequirePackage{xcolor}
\definecolor{uured}{RGB}{153,0,0}
\definecolor{uulightgrey}{RGB}{230,230,230}
\definecolor{uumidgrey}{RGB}{190,190,190}
\definecolor{uudarkgrey}{RGB}{130,130,130}

\if@uuposter@red
	\definecolor{uu@bg}{named}{uured}
	\definecolor{uu@fg}{named}{white}
\else
	\if@uuposter@grey
		\definecolor{uu@bg}{named}{uulightgrey}
		\definecolor{uu@fg}{named}{black}
	\fi
\fi
%%% To fix footnotes in the sidebar minipage:
\RequirePackage[hang,norule,multiple]{footmisc}
\setlength{\footnotemargin}{2em}

\RequirePackage{graphicx}

%%% flowfram is used to control the poster layout:
\RequirePackage{flowfram}
\setlength{\vcolumnsep}{2\baselineskip}
\setlength{\columnsep}{2\baselineskip}
\setlength{\logoboxwidth}{\sidebarproportion\textwidth}
\newlength\sidebarwidth
\newlength\sidebaroffset
\if@uuposter@top
	\setlength{\sidebarwidth}{0pt}
	\setlength{\sidebaroffset}{0pt}
\else
	\setlength{\sidebarwidth}{\logoboxwidth}
	\setlength{\sidebaroffset}{\sidebarwidth}
	\addtolength{\sidebaroffset}{\vcolumnsep}
\fi

\newlength\sigilwidth
\if@uuposter@sigil@margin
	\if@uuposter@top
		\setlength{\sigilwidth}{\titleproportion\textheight}
	\else
		\setlength{\sigilwidth}{\sidebarwidth}
	\fi
\fi
\if@uuposter@sigil@corner
	\setlength{\sigilwidth}{\sigilproportion\textwidth}
	\newlength\sigiloffsetx
	\newlength\sigiloffsety
	\if@uuposter@sigil@right
		\setlength{\sigiloffsetx}{\textwidth}
		\addtolength{\sigiloffsetx}{-\sigilwidth}
	\else \if@uuposter@sigil@left
		\setlength{\sigiloffsetx}{\sidebarwidth}
	\fi \fi
	\if@uuposter@sigil@bottom
		\setlength{\sigiloffsety}{0pt}
	\else \if@uuposter@sigil@top
		\setlength{\sigiloffsety}{\textheight}
		\addtolength{\sigiloffsety}{-\sigilwidth}
	\fi \fi
	\newstaticframe{\sigilwidth}{\sigilwidth}{\sigiloffsetx}{\sigiloffsety}[background]
	\setstaticframe*{background}{valign=b}
\fi
\newlength\mainwidth
\setlength{\mainwidth}{\textwidth}
\addtolength{\mainwidth}{-\sidebaroffset}
\Ncolumntopinarea{static}{\uucolumns}{\titleproportion\textheight}{\mainwidth}{\textheight}{\sidebaroffset}{0pt}
\if@uuposter@sigil@corner
	\setstaticframe{2}{label={title}}
\else
	\setstaticframe{1}{label={title}}
\fi
\if@uuposter@ruled
	\insertvrule{flow}{1}{flow}{2}
\fi

%\newlength\offset
%\setlength{\offset}{5in}
%\addtolength{\offset}{\vcolumnsep}
%\computeflowframearea{2,3}
%\addtolength{\ffareaheight}{-\offset}
%
%\setflowframe{2,3}{y=\offset,height=\ffareaheight}
%
%\newstaticframe{\ffareawidth}{5in}{\ffareax}{0in}[table]
%\setstaticframe{2}{clear}
\newstaticframe{\sidebarwidth}{\textheight}{0pt}{0pt}[sidebar]
\newlength\authoroffset
\if@uuposter@top
	\setstaticframe*{title}{backcolor=uu@bg}
	\getstaticbounds*{title}
	\newstaticframe{\logoboxwidth}{\ffareaheight}{0pt}{\ffareay}[logobox]
	\setlength{\authoroffset}{\textwidth}
	\addtolength{\authoroffset}{-\logoboxwidth}
	\newstaticframe{\logoboxwidth}{\ffareaheight}{\authoroffset}{\ffareay}[authorbox]
	\addtolength{\authoroffset}{-\logoboxwidth}
	\newstaticframe{\authoroffset}{\ffareaheight}{\logoboxwidth}{\ffareay}[titlebox]
\else
	\setstaticframe*{sidebar}{backcolor=uu@bg}
	\if@uuposter@landscape
		\setlength{\authoroffset}{3em}
	\else
		\setlength{\authoroffset}{6em}
	\fi
\fi
\setallstaticframes{valign=t}

\renewcommand\@maketitle{%
  \raggedright%
  \let \footnote \thanks
    {% set colour and font for the title 
    \if@uuposter@top
    		\color{uu@fg}
	\else
		\color{uured}
	\fi
	\sffamily\bfseries\veryHuge
    \@title \par}%
  \par
  }

\renewcommand\section{%
\@startsection{section}{1}{\z@}%
              {-3.5ex \@plus -1ex \@minus -.2ex}%
              {2.3ex \@plus.2ex}%
              {\color{black}\sffamily\Huge}}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
              {-3.25ex\@plus -1ex \@minus -.2ex}%
              {1.5ex \@plus .2ex}%
              {\color{black}\sffamily\huge}}
\newcommand{\Inst}[1]{%
\color{uu@fg}\large{\sffamily{#1}}
}
\newcommand{\uuposterauthor}{%
}
\newcommand{\makeuuposterauthor}{%
\begin{minipage}{0.9\logoboxwidth}
	\renewcommand{\thempfootnote}{\textcolor{uu@fg}{\Large{{\arabic{mpfootnote}}}}}
	\color{uu@fg}\sffamily\LARGE
	\uuposterauthor
	\if@uuposter@top
		\vspace{0.5\baselineskip}
	\else
		\vspace{\baselineskip}
	\fi
	\end{minipage}
}
\hyphenpenalty 10000
\tolerance 5000

\AtBeginDocument{%
\if@uuposter@sigil@corner
	\begin{staticcontents*}{background}
		\raggedleft
		\includesigil
	\end{staticcontents*}
\fi
\if@uuposter@top
	\begin{staticcontents*}{titlebox}%
		\maketitle%
	\end{staticcontents*}
	\begin{staticcontents*}{logobox}
		\vspace{-\baselineskip}
		\includelogo
	\end{staticcontents*}
	\begin{staticcontents*}{authorbox}
		\makeuuposterauthor
	\end{staticcontents*}
\else
	\begin{staticcontents*}{title}%
		\maketitle%
	\end{staticcontents*}
	\begin{staticcontents*}{sidebar}
	\begin{center}
	\includelogo
	\if@uuposter@sigil@margin
		\vfill
	\else
		\vskip \authoroffset
	\fi
	\makeuuposterauthor
	\end{center}
	\if@uuposter@sigil@margin
		\vfill
		\includesigil
	\fi
	\end{staticcontents*}
\fi
\if@uuposter@xetex
	\large%\uubodyfont
\else
	\large
\fi
}
\endinput