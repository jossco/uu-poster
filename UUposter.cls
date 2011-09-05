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
\newlength\uuposter@TitleHeight
\newif\if@uuposter@TitleHeightSet
%% Use fontspec to load the Uppsala University fonts (Berling and Gill Alt One MT). These fonts, available from the Communication and Graphics Office, must be properly installed on your computer. (Also, the Mac fonts supplied by the university are in an old enough format that fontspec can't load them. Mac users can get around this by downloading and installing the TrueType fonts that are included in the PC font package.) This option is required because loading fontspec after flowfram messes up the alignment of the poster columns.
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
	\ExecuteOptionsX{sidebarwidth=0.1,columns=3}
	\@uuposter@landscapetrue
}
\DeclareOptionX{portrait}{
	\ExecuteOptionsX{sidebarwidth=0.20,columns=2}
	\@uuposter@landscapefalse
}
\DeclareOptionX{columns}[2]{\def \uucolumns {#1}}
\DeclareOptionX{ruled}{\@uuposter@ruledtrue}

\DeclareOptionX{logo}[4f]{\def\uuposter@LogoInclude{\includegraphics[width=\logoboxwidth]{UU_logo_#1_84}}}

\newcommand{\uuposterSigil}{
}
\define@choicekey+{UUposter.cls}{sigil}[\val\nr]{NW,NE,SW,SE,margin}[SE]{
	\ifcase\nr\relax
		\renewcommand{\uuposterSigil}{\includegraphics[width=\sigilwidth]{UU_sigill_SO_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@toptrue
		\@uuposter@sigil@lefttrue
		\@uuposter@sigil@bottomfalse
		\@uuposter@sigil@rightfalse
	\or 
		\renewcommand{\uuposterSigil}{\includegraphics[width=\sigilwidth]{UU_sigill_SV_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@toptrue
		\@uuposter@sigil@righttrue
		\@uuposter@sigil@bottomfalse
		\@uuposter@sigil@leftfalse
	\or
		\renewcommand{\uuposterSigil}{\includegraphics[width=\sigilwidth]{UU_sigill_NO_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@bottomtrue
		\@uuposter@sigil@lefttrue
		\@uuposter@sigil@topfalse
		\@uuposter@sigil@rightfalse
	\or
		\renewcommand{\uuposterSigil}{\includegraphics[width=\sigilwidth]{UU_sigill_NV_10Svart}}
		\@uuposter@sigil@cornertrue
		\@uuposter@sigil@marginfalse
		\@uuposter@sigil@bottomtrue
		\@uuposter@sigil@righttrue
		\@uuposter@sigil@topfalse
		\@uuposter@sigil@leftfalse
	\or
		\@uuposter@sigil@margintrue
		\@uuposter@sigil@cornerfalse
		\renewcommand{\uuposterSigil}{\includegraphics[width=\sigilwidth]{UU_marginalsigill_5Svart}}
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
\DeclareOptionX{titleheight}[6em]{
	\@uuposter@TitleHeightSettrue
	\setlength\uuposter@TitleHeight{#1}
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
%%%% From UU beamer theme:
\definecolor{uuposterred}{RGB}{153,0,0}
\definecolor{uuposterlightgrey}{RGB}{230,230,230}
\definecolor{uupostermidgrey}{RGB}{190,190,190}
\definecolor{uuposterdarkgrey}{RGB}{130,130,130}

\if@uuposter@red
	\definecolor{uuposter@bg}{named}{uuposterred}
	\definecolor{uuposter@fg}{named}{white}
\else
	\if@uuposter@grey
		\definecolor{uuposter@bg}{named}{uuposterlightgrey}
		\definecolor{uuposter@fg}{named}{black}
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
\if@uuposter@TitleHeightSet
\else
	\setlength\uuposter@TitleHeight{\logoboxwidth}
	\@uuposter@TitleHeightSettrue
\fi
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
		\setlength{\sigilwidth}{\uuposter@TitleHeight}
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
\Ncolumntopinarea{static}{\uucolumns}{\uuposter@TitleHeight}{\mainwidth}{\textheight}{\sidebaroffset}{0pt}
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
	\setstaticframe*{title}{backcolor=uuposter@bg}
	\getstaticbounds*{title}
	\newstaticframe{\logoboxwidth}{\ffareaheight}{0pt}{\ffareay}[logobox]
	\setlength{\authoroffset}{\textwidth}
	\addtolength{\authoroffset}{-\logoboxwidth}
	\newstaticframe{\logoboxwidth}{\ffareaheight}{\authoroffset}{\ffareay}[authorbox]
	\addtolength{\authoroffset}{-\logoboxwidth}
	\newstaticframe{\authoroffset}{\ffareaheight}{\logoboxwidth}{\ffareay}[titlebox]
\else
	\setstaticframe*{sidebar}{backcolor=uuposter@bg}
	\if@uuposter@landscape
		\setlength{\authoroffset}{3em}
	\else
		\setlength{\authoroffset}{6em}
	\fi
\fi
\setallstaticframes{valign=t}

%% Title Bar:
\newcommand\uuposterTitleTextColor{%
	\if@uuposter@top
		\color{uuposter@fg}%
	\else
		\color{uuposterred}%
	\fi%
}
\newcommand\uuposterTitleTextStyle{%
	\sffamily\bfseries\veryHuge%
}
\renewcommand\@maketitle{%
  \raggedright%
  \let \footnote \thanks
    {% set colour and font for the title 
    \uuposterTitleTextColor%
	\uuposterTitleTextStyle%
    \@title \par}%
  \par
  }
\newcommand\uuposterBeforeTitle{}
\newcommand\uuposterTitleContent{\maketitle}
\newcommand\uuposterAfterTitle{}
\newcommand\uuposterTitle{%
	\uuposterBeforeTitle%
	\uuposterTitleContent%
	\uuposterAfterTitle}
	
%%% Author Block:
%% Override this to set the author content in the document:
\newcommand\uuposterAuthor{}
\newcommand{\uuposterAuthorBlock}{%
	\uuposterBeforeAuthor%
	\uuposterAuthorContent%
	\uuposterAfterAuthor%
}
\newcommand\uuposterAuthorFootSkip{%
	\if@uuposter@top
		\vspace{0.5\baselineskip}
	\else
		\vspace{\baselineskip}
	\fi%
}
\newlength\uuposterAuthorOffset
\if@uuposter@top
	\setlength{\uuposterAuthorOffset}{0pt}
\else
	\if@uuposter@landscape
		\setlength{\uuposterAuthorOffset}{3em}
	\else
		\setlength{\uuposterAuthorOffset}{6em}
	\fi
\fi
\newcommand\uuposterBeforeAuthor{%
	\if@uuposter@sigil@margin
		\vfill
	\else
		\vskip \uuposterAuthorOffset
	\fi%
}
\newcommand\uuposterAuthorTextColor{\color{uuposter@fg}}
\newcommand\uuposterAuthorTextStyle{\sffamily\LARGE}
\newcommand\uuposterAuthorContent{%
	\begin{minipage}{0.9\logoboxwidth}
		\renewcommand{\thempfootnote}{\textcolor{uuposter@fg}{\Large{{\arabic{mpfootnote}}}}}
		\uuposterAuthorTextColor\uuposterAuthorTextStyle\uuposterAuthor
		\uuposterAuthorFootSkip
	\end{minipage}%
}
\newcommand\uuposterAfterAuthor{}
\newcommand\uuposterInstTextStyle{\large\sffamily}
\newcommand\uuposterInstTextColor{\uuposterAuthorTextColor}
\newcommand{\uuposterInst}[1]{%
	\footnote{\uuposterInstTextColor\uuposterInstTextStyle{#1}}%
}

%%% University Logo:
\newcommand\uuposterBeforeLogo{%
	\if@uuposter@top
		\vspace{-\baselineskip}%
	\fi%
}
\newcommand\uuposterLogoContent{\uuposter@LogoInclude}
\newcommand\uuposterAfterLogo{}
\newcommand\uuposterLogo{%
	\uuposterBeforeLogo%
	\uuposterLogoContent%
	\uuposterAfterLogo%
}

%%% Sectioning commands:
\newcommand\uuposterSectionTextColor{\color{black}}
\newcommand\uuposterSectionTextStyle{\sffamily\Huge}
\newcommand\uuposterSubSectionTextColor{\uuposterSectionTextColor}
\newcommand\uuposterSubSectionTextStyle{\sffamily\huge}
\renewcommand\section{%
\@startsection{section}{1}{\z@}%
              {-3.5ex \@plus -1ex \@minus -.2ex}%
              {2.3ex \@plus.2ex}%
              {\uuposterSectionTextColor\uuposterSectionTextStyle}}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
              {-3.25ex\@plus -1ex \@minus -.2ex}%
              {1.5ex \@plus .2ex}%
              {\uuposterSubSectionTextColor\uuposterSubSectionTextStyle}}
              
\newcommand\uuposterBodyTextStyle{\large}
\newcommand\uuposterBodyTextColor{\color{black}}        
\hyphenpenalty 10000
\tolerance 5000

\AtBeginDocument{%
\if@uuposter@sigil@corner
	\begin{staticcontents*}{background}
		\raggedleft
		\uuposterSigil
	\end{staticcontents*}
\fi
\if@uuposter@top
	\begin{staticcontents*}{titlebox}%
		\uuposterTitle%
	\end{staticcontents*}
	\begin{staticcontents*}{logobox}
		\uuposterLogo
	\end{staticcontents*}
	\begin{staticcontents*}{authorbox}
		\uuposterAuthorBlock
	\end{staticcontents*}
\else
	\begin{staticcontents*}{title}%
		\uuposterTitle%
	\end{staticcontents*}
	\begin{staticcontents*}{sidebar}
	\begin{center}
	\uuposterLogo
	\uuposterAuthorBlock
	\end{center}
	\if@uuposter@sigil@margin
		\vfill
		\uuposterSigil
	\fi
	\end{staticcontents*}
\fi
\uuposterBodyTextColor\uuposterBodyTextStyle%
}
\endinput