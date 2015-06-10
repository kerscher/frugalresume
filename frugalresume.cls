\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{frugalresume}

\LoadClass[a4paper]{article}

\RequirePackage{pdftexcmds}
\RequirePackage{kvoptions} % key-value options

\RequirePackage[ text = garalde
               , mono = programmer
               ]{typographydefaults}
\RequirePackage{parskip}
\RequirePackage[md]{titlesec}

\RequirePackage{xcolor}
\definecolor{linkcolour}{rgb}{0.44,0,0.15}

\RequirePackage{hyperref}
\hypersetup{ colorlinks = true 
           , allcolors  = linkcolour
           }

\SetupKeyvalOptions{ family = frugal
                   , prefix = frugal@
                   }

\DeclareStringOption[]{street}
\DeclareStringOption[]{city}
\DeclareStringOption[]{state}

\DeclareStringOption[]{phone}
\DeclareStringOption[]{email}

\DeclareStringOption[]{company}
\DeclareStringOption[]{start}
\DeclareStringOption[]{end}
\DeclareStringOption[]{industry}
\DeclareStringOption[]{role}

\ProcessKeyvalOptions{frugal}

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
  \emph{Telefone:}~~~ \= \frugal@phone\\
  \emph{Email:}       \> \url{\frugal@email}\\
  \end{tabbing}
}

\newenvironment{summary}[1][Sumário]{%
    \section*{#1}    
}%
{}%

\newenvironment{experience}[1][Experiência profissional]{%
    \section*{#1}
}%
{}%