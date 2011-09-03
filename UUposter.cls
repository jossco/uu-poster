%\NeedsTexFormat{LaTeX2e}
\ProvidesClass{UUposter}[2011/09/01 Class for making scientific posters in the style of Uppsala University]
\RequirePackage{xkeyval}

\newif\if@uured
\newif\if@uugrey
\newif\if@uulogovit
\newif\if@uulogosv
\newif\if@uulogofour
\newif\if@uulogotwo
\newif\if@uutop
\newif\if@uulandscape
\newif\if@uuruled
\newif\if@uucornersigil
\newif\if@uumarginalsigil
\DeclareOptionX{red}{
	\@uuredtrue
	\@uugreyfalse	
	\@uulogovittrue
	\@uulogotwofalse
	\@uulogofourfalse
	\@uulogosvfalse
}
\DeclareOptionX{grey}{
	\@uuredfalse
	\@uugreytrue
	\@uulogovitfalse
	\@uulogotwofalse
	\@uulogofourtrue
	\@uulogosvfalse
}
\DeclareOptionX{top}{
	\@uutoptrue
}
\DeclareOptionX{landscape}{
	\PassOptionsToClass{\CurrentOption}{a0poster}
	\@uulandscapetrue
}
\DeclareOptionX{columns}[2]{\def \uucolumns {#1}}
\DeclareOptionX{ruled}{\@uuruledtrue}
\DeclareOptionX{arial}{
	\PassOptionsToClass{\CurrentOption}{UUxetex}
}
\DeclareOptionX{times}{
	\PassOptionsToClass{\CurrentOption}{UUxetex}
}
\DeclareOptionX{noxits}{
	\PassOptionsToClass{\CurrentOption}{UUxetex}
}

\newcommand{\includesigil}{
}
\define@choicekey{UUposter.cls}{sigil}[\val\nr]{NW,NE,SW,SE,marginal}{
	\ifcase\nr\relax
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{18370_UU_sigill_NV_10black}}
		\@uucornersigiltrue
	\or 
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{18370_UU_sigill_NV_10black}}
		\@uucornersigiltrue
	\or
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{18370_UU_sigill_NV_10black}}
		\@uucornersigiltrue
	\or
		\renewcommand{\includesigil}{\includegraphics[width=\sigilwidth]{18370_UU_sigill_NV_10black}}
		\@uucornersigiltrue
	\or
		\@uumarginalsigiltrue
	\fi
}
%%Assume unrecognized options are for a0poster class:
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{a0poster}}
\ExecuteOptionsX{grey,columns}
\ProcessOptionsX\relax
\LoadClass{a0poster}

\RequirePackage{mathtools}

%%% Fonts with xetex and fontspec:
\RequirePackage{UUxetex}
%\RequirePackage{xunicode} %Unicode extras!
%\RequirePackage{xltxtra}
%\RequirePackage{unicode-math}
%\setmathfont{XITS Math}
%\setmathfont[range={\mathcal,\mathbfcal},StylisticSet=1]{XITS Math}
%
%\defaultfontfeatures{Mapping=tex-text}
%\renewcommand{\nobreakspace}{\nobreak\ }
%
%\setsansfont{Gill Alt One MT}
%\setmainfont[Ligatures={Common},BoldFont={Berling Bold}, ItalicFont={Berling Italic},Numbers={OldStyle,Proportional}]{Berling Roman}
%\newfontinstance\uubodyfont[Ligatures={Common},BoldFont={Berling Bold}, ItalicFont={Berling Italic},Numbers={OldStyle,Proportional}]{Berling Roman}
%\setromanfont{XITS}

%%% Colors:
\RequirePackage{xcolor}
\definecolor{uured}{RGB}{153,0,0}
\definecolor{uulightgrey}{RGB}{230,230,230}
\definecolor{uumidgrey}{RGB}{190,190,190}
\definecolor{uudarkgrey}{RGB}{130,130,130}

\if@uured
	\definecolor{uu@bg}{named}{uured}
	\definecolor{uu@fg}{named}{white}
\else
	\if@uugrey
		\definecolor{uu@bg}{named}{uulightgrey}
		\definecolor{uu@fg}{named}{black}
	\fi
\fi
%%% To fix footnotes in the sidebar minipage:
\RequirePackage[hang,norule,multiple]{footmisc}
\setlength{\footnotemargin}{1.8em}

\RequirePackage{graphicx}

%%% flowfram is used to control the poster layout:
\RequirePackage{flowfram}
\newlength\sigilwidth
\if@uucornersigil
	\setlength{\sigilwidth}{.5\textwidth}
	\newlength\sigiloffset
	\setlength{\sigiloffset}{\textwidth}
	\addtolength{\sigiloffset}{-\sigilwidth}
	\newstaticframe{\sigilwidth}{\sigilwidth}{\sigiloffset}{0pt}[background]
	\setstaticframe*{background}{valign=b}
\fi
\setlength{\vcolumnsep}{2\baselineskip}
\setlength{\columnsep}{\vcolumnsep}
\newlength\logoboxwidth
\if@uulandscape
	\setlength{\logoboxwidth}{0.15\textwidth}
\else
	\setlength{\logoboxwidth}{0.2\textwidth}
\fi
\newlength\sidebarwidth
\newlength\sidebaroffset
\if@uutop
	\setlength{\sidebarwidth}{0pt}
	\setlength{\sidebaroffset}{0pt}
\else
	\setlength{\sidebarwidth}{\logoboxwidth}
	\setlength{\sidebaroffset}{\sidebarwidth}
	\addtolength{\sidebaroffset}{\vcolumnsep}
\fi
\newlength\mainwidth
\setlength{\mainwidth}{\textwidth}
\addtolength{\mainwidth}{-\sidebaroffset}
\Ncolumntopinarea{static}{\uucolumns}{12cm}{\mainwidth}{\textheight}{\sidebaroffset}{0pt}
\if@uucornersigil
	\setstaticframe{2}{label={title}}
\else
	\setstaticframe{1}{label={title}}
\fi
\if@uuruled
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
\if@uutop
	\setstaticframe*{title}{backcolor=uu@bg}
	\getstaticbounds*{title}
	\newstaticframe{\logoboxwidth}{\ffareaheight}{0pt}{\ffareay}[logobox]
	\newlength\authoroffset
	\setlength{\authoroffset}{\textwidth}
	\addtolength{\authoroffset}{-\logoboxwidth}
	\newstaticframe{\logoboxwidth}{\ffareaheight}{\authoroffset}{\ffareay}[authorbox]
	\addtolength{\authoroffset}{-\logoboxwidth}
	\newstaticframe{\authoroffset}{\ffareaheight}{\logoboxwidth}{\ffareay}[titlebox]
\else
	\setstaticframe*{sidebar}{backcolor=uu@bg}
\fi
\setallstaticframes{valign=t}
%\setallflowframes{border=plain}

\renewcommand\@maketitle{%
  %\newpage
 % \null
  \raggedright%
  \let \footnote \thanks
    {% set colour and font for the title 
    \if@uutop
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
	\if@uutop
		\vspace{0.5\baselineskip}
	\else
		\vspace{\baselineskip}
	\fi
	\end{minipage}
}
\hyphenpenalty 10000
\tolerance 5000

\AtBeginDocument{%
\if@uucornersigil
	\begin{staticcontents*}{background}
		\raggedleft
		\includesigil
	\end{staticcontents*}
\fi
\if@uutop
	\begin{staticcontents*}{titlebox}%
		\maketitle%
	\end{staticcontents*}
	\begin{staticcontents*}{logobox}
		\vspace{-\baselineskip}
		%\begin{center}
		\if@uulogovit
			\includegraphics[width=0.9\logoboxwidth]{UU_logo_vit_84}\\
		\fi
		\if@uulogosv
			\includegraphics[width=0.9\logoboxwidth]{UU_logo_sv_84}\\
		\fi
		\if@uulogotwo
			\includegraphics[width=0.9\logoboxwidth]{UU_logo_2f_84}\\
		\fi
		\if@uulogofour
			\includegraphics[width=0.9\logoboxwidth]{UU_logo_4f_84}\\
		\fi
		%\end{center}
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
	\if@uulogovit
		\includegraphics[width=0.9\logoboxwidth]{UU_logo_vit_84}\\
	\fi
	\if@uulogosv
		\includegraphics[width=0.9\logoboxwidth]{UU_logo_sv_84}\\
	\fi
	\if@uulogotwo
		\includegraphics[width=0.9\logoboxwidth]{UU_logo_2f_84}\\
	\fi
	\if@uulogofour
		\includegraphics[width=0.9\logoboxwidth]{UU_logo_4f_84}\\
	\fi
	\hspace{0.05\logoboxwidth}
	\vskip 6em
	\makeuuposterauthor
	\end{center}
	\end{staticcontents*}
\fi
\large\uubodyfont}
\endinput