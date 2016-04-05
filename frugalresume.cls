\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{frugalresume}

\LoadClass[a4paper]{article}

\RequirePackage[ text = garalde
               , mono = typewriter
               ]{typographydefaults}
\RequirePackage{parskip}

\RequirePackage[md]{titlesec}
\titleformat{\section}
  {\normalfont\LARGE\mdseries}{\thesection}{1em}{}

\RequirePackage{xcolor}
\definecolor{linkcolour}{rgb}{0.6,0.1,0.2}

\RequirePackage{hyperref}
\hypersetup{ colorlinks = true 
           , allcolors  = linkcolour
           }

\RequirePackage{enumitem}

\RequirePackage{pdftexcmds}
\RequirePackage{kvoptions} % key-value options


\SetupKeyvalOptions{ family = frugal
                   , prefix = frugal@
                   }

\DeclareStringOption[]{street}
\DeclareStringOption[]{city}
\DeclareStringOption[]{state}

\DeclareStringOption[]{phone}
\DeclareStringOption[]{email}
\DeclareStringOption[]{github}

\DeclareStringOption[]{company}
\DeclareStringOption[]{start}
\DeclareStringOption[]{end}
\DeclareStringOption[]{industry}
\DeclareStringOption[]{role}

\DeclareStringOption[]{degree}
\DeclareStringOption[]{course}
\DeclareStringOption[]{institution}
\DeclareStringOption[]{date}

\ProcessKeyvalOptions{frugal}

\def\labelitemi{---}

\newcommand{\parr}{\par\vspace{-1pt}}

\newcommand{\newkvcmd}[2]{%
  \newcommand{#1}[1]{%
    \setkeys{frugal}{##1}
    #2
  }
}

\newcommand{\applicant}[1]{%
    \bgroup
        \setlength{\parindent}{0pt}
        \begin{flushleft}
            \huge{\textsc{#1}}
        \end{flushleft}
    \egroup
}%

\newcommand{\headline}[1]{{#1}\vspace{0.5em}}

\newkvcmd{\address}{
  \begin{flushleft}
  \frugal@street\\
  \frugal@city~---~\frugal@state
  \end{flushleft}
}

\newkvcmd{\contact}{
  \begin{tabbing}
  \emph{Telephone:}~~~ \= \frugal@phone\\
  \emph{Email:}        \> \href{mailto:\frugal@email}{\frugal@email}\\
  \emph{Github:}       \> \href{https://github.com/\frugal@github}{\frugal@github}\\
  \end{tabbing}
}

\newenvironment{summary}[1][Summary]{%
  \section*{#1}    
}%
{}

\newenvironment{experience}[1][Experience]{%
  \section*{#1}
}%
{}

\newkvcmd{\job}{%
  \Large{\emph{\frugal@role}}\parr
  \large{\frugal@company}~\footnotesize{(\frugal@industry)}\parr
  \normalsize
  \frugal@start~--~\frugal@end\par
}

\newenvironment{achievements}[1]{
  \newcommand{\done}{\item}
  \begin{itemize}[ leftmargin = 1cm
                 , topsep     = \baselineskip
                 ]
  #1
}{%
  \end{itemize}
}

\newenvironment{education}[1][Education]{
  \section*{#1}
}
{}

\newkvcmd{\degree}{%
  \Large{\emph{\frugal@degree~in\ \frugal@course}}\parr
  \normalsize%
  \frugal@institution~\frugal@date.
  \par
}

\newenvironment{skills}[1][Skills]{
  \newcommand{\skillset}[2]{\item[##1]{##2}}
  \section*{#1}
  \begin{description}
}
{ \end{description}}

\newenvironment{certificates}[1][Certificates]{
  \newcommand{\certificate}[1]{\item{##1}}
  \section*{#1}
  \begin{itemize}
}
{ \end{itemize}}
