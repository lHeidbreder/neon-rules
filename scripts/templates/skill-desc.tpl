\ifthenelse{
    \endswith{@skill@}{ Combat Training}%
    \AND \NOT \equal{@skill@}{\lastskill}%
    }{
        \end{multicols}%
        \par%
        \subsection{@skill@}%
        \vspace{10mm}%
        \begin{multicols}{2}%
        \edef\lastskill{@skill@}%
    }{}
\begin{minipage}{\columnwidth}%
	\textbf{\ul{%
            \ifthenelse{\NOT \equal{@skill@}{\lastskill}}{@skill@}{@subtype@}%
        }%
        \ifthenelse{%
            \NOT \isempty{@subtype@}%
            \AND \NOT \equal{@skill@}{\lastskill}%
            \AND \NOT \endswith{@skill@}{ Combat Training}%
        }{\textsubscript{\ \textit{@subtype@}}}{}%
    }
    \\%
	Difficulty: \ifthenelse{\isempty{@difficulty@}}{Basic}{@difficulty@}
    \\%
	Common Characteristic: @common_characteristic@
    \\%
	\textit{@long_description@}
    \ifthenelse{
        \NOT \isempty{@itemize:example_eds@}
    }{
        \par%
        \vspace{2mm}
        \hrule%
        \vspace{2mm}
        Example Educations:%
        \begin{itemize}
        @itemize:example_eds@
        \end{itemize}
    }{}
\end{minipage}
\par
