%%
%% This is file `UUposter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% UUposter.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2011 by Joseph Scott <joseph.scott@it.uu.se>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{UUposter}
    [2011/09/19 v0.4b Class for making scientific posters in the style of Uppsala University]
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
\DeclareOptionX{xetex}{\@uuposter@xetextrue}
\DeclareOptionX{notimes}{\@uuposter@timefalse}
\DeclareOptionX{nohelvet}{\@uuposter@helvetfalse}
\DeclareOptionX{nomathtools}{\@uuposter@mathtoolsfalse}
\DeclareOptionX{mathtools}[]{\PassOptionsToPackage{mathtools}{#1}}
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
\DeclareOptionX{gray}{
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
\DeclareOptionX{columns}[2]{\def \uuposter@columns {#1}}
\DeclareOptionX{ruled}{\@uuposter@ruledtrue}
\DeclareOptionX{logo}[4f]{\def\uuposter@LogoInclude{\includegraphics[width=\logoboxwidth]{UU_logo_#1_84}}}
\newcommand{\uuposterSigil}{}
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
}{\ClassWarning{UUposter}{Ignoring unrecognized value for option 'sigil' (valid options: NW,NE,SW,SE,margin)}}
\DeclareOptionX{sigilwidth}[0.5]{\def\sigilproportion{#1}}
\DeclareOptionX{sidebarwidth}[0.2]{\def\sidebarproportion{#1}}
\DeclareOptionX{titleheight}[6em]{
\@uuposter@TitleHeightSettrue
\setlength\uuposter@TitleHeight{#1}
}
\DeclareOptionX{math}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
\DeclareOptionX{noxits}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
\DeclareOptionX{serif}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
\DeclareOptionX{sanserif}{\PassOptionsToPackage{\CurrentOption}{UUxetex}}
\newif\if@uuposter@hasbib
\DeclareOptionX{bib}{\@uuposter@hasbibtrue}
\DeclareOptionX{biblines}[3]{\def\uuposter@biblines{#1}}
\DeclareOptionX{biboffset}[1]{\def\uuposter@biboffset{#1}}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{a0poster}}
\ExecuteOptionsX{grey,sigilwidth,portrait,biblines,biboffset}
\ProcessOptionsX\relax
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
\RequirePackage{xcolor}
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
\RequirePackage[hang,norule,multiple]{footmisc}
\setlength{\footnotemargin}{2em}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\newcommand{\forloop}[5][1]{%
\setcounter{#4}{#2} %
\ifthenelse{ \value{#4}<#3 }%
{%
#5 %
\addtocounter{#4}{#1} %
\forloop[#1]{\value{#4}}{#3}{#4}{#5} %
}{%
#5 %
}}%
\RequirePackage{flowfram}
\setlength{\vcolumnsep}{2\baselineskip}
\setlength{\columnsep}{2\baselineskip}
\newlength\sidebarwidth
\newlength\sidebaroffset
\setlength{\sidebarwidth}{\sidebarproportion\textwidth}
\setlength{\logoboxwidth}{\sidebarwidth}
\addtolength{\logoboxwidth}{-\columnsep}
\newlength\logoboxoffset
\setlength{\logoboxoffset}{\columnsep}
\if@uuposter@TitleHeightSet
\if@uuposter@top
\setlength{\logoboxwidth}{\uuposter@TitleHeight}
\addtolength{\logoboxwidth}{-\vcolumnsep}
\fi
\else
\setlength\uuposter@TitleHeight{\logoboxwidth}
\addtolength{\uuposter@TitleHeight}{-2\logoboxoffset}
\@uuposter@TitleHeightSettrue
\fi
\if@uuposter@top
\setlength{\sidebarwidth}{0pt}
\setlength{\sidebaroffset}{0pt}
\else
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
\Ncolumntopinarea{static}{\uuposter@columns}{\uuposter@TitleHeight}{\mainwidth}{\textheight}{\sidebaroffset}{0pt}
\if@uuposter@sigil@corner
\setstaticframe{2}{label={title}}
\else
\setstaticframe{1}{label={title}}
\fi
\newlength\uupostercolwidth
\getflowbounds{1}
\setlength{\uupostercolwidth}{\ffareawidth}

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

\if@uuposter@hasbib
\newlength{\bibframeheight}
\setlength{\bibframeheight}{\uuposter@biblines\baselineskip}
\newlength{\biboffset}
\setlength{\biboffset}{\bibframeheight}
\addtolength{\biboffset}{\uuposter@biboffset\baselineskip}
\computeflowframearea{1,\uuposter@columns}
\addtolength{\ffareaheight}{-\biboffset}
\newcounter{maincol}
\setcounter{maincol}{1}
\forloop{1}{\uuposter@columns}{maincol}{%
\setflowframe{\themaincol}{y=\biboffset,height=\ffareaheight}
}
\newlength{\bibframewidth}
\setlength{\bibframewidth}{\ffareawidth}
\newstaticframe{\bibframewidth}{\bibframeheight}{\ffareax}{0in}[bibframe]
\setstaticframe*{bibframe}{border=plain}
\renewcommand{\refname}{}
\fi
\newcommand\uuposterInsertVerticalRules{
\newcounter{firstcol}
\setcounter{firstcol}{1}
\newcounter{secondcol}
\forloop{2}{\uuposter@columns}{secondcol}{%
\insertvrule{flow}{\thefirstcol}{flow}{\thesecondcol}
\addtocounter{firstcol}{1}
}
}
\if@uuposter@ruled
\uuposterInsertVerticalRules
\fi
\setallstaticframes{valign=t}
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
    {%
    \uuposterTitleTextColor%
\uuposterTitleTextStyle%
    \@title \par}%
  \par
  }
 %    \end{macrocode}
 % \end{macro}
 % Modify these macros to control the placement of the title:
 % \begin{macro}{\uuposterBeforeTitle}
 %    \begin{macrocode}
\newcommand\uuposterBeforeTitle{}
 %    \end{macrocode}
 % \end{macro}
 % \begin{macro}{\uuposterTitleContent}
 %    \begin{macrocode}
\newcommand\uuposterTitleContent{\maketitle}
 %    \end{macrocode}
 % \end{macro}
 % \begin{macro}{\uuposterAfterTitle}
 %    \begin{macrocode}
\newcommand\uuposterAfterTitle{}
 %    \end{macrocode}
 % \end{macro}
 % \begin{macro}{\uuposterTitle}
 %    \begin{macrocode}
\newcommand\uuposterTitle{%
\uuposterBeforeTitle%
\uuposterTitleContent%
\uuposterAfterTitle}
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
\newcommand\uuposterAuthorTextStyle{\sffamily\Large}
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
\newcommand\uuposterBeforeLogo{%
\vspace{\logoboxoffset}
}
\newcommand\uuposterLogoContent{\uuposter@LogoInclude}
\newcommand\uuposterAfterLogo{}
\newcommand\uuposterLogo{%
\uuposterBeforeLogo%
\uuposterLogoContent%
\uuposterAfterLogo%
}
\newcommand\uuposterSectionTextColor{\color{black}}
\newcommand\uuposterSectionTextStyle{\sffamily\Huge}
\newcommand\uuposterSubSectionTextColor{\uuposterSectionTextColor}
\newcommand\uuposterSubSectionTextStyle{\sffamily\huge}
\renewcommand\section{%
\@startsection{section}{1}{\z@}%
              {-3ex \@plus -1ex \@minus -.2ex}%
              {2.3ex \@plus.2ex}%
              {\uuposterSectionTextColor\uuposterSectionTextStyle}}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
              {-2.25ex\@plus -1ex \@minus -.2ex}%
              {1ex \@plus .2ex}%
              {\uuposterSubSectionTextColor\uuposterSubSectionTextStyle}}
\newcommand\uuposterBodyTextStyle{\normalsize}
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
\endinput%
\endinput
%%
%% End of file `UUposter.cls'.
