\begin{minipage}{\columnwidth}
	\textbf{\ul{@skill@}
        \ifthenelse{\isempty{@subtype@}}{}{\textsubscript{\textit{@subtype@}}}
    }
    \\%
	Difficulty: \ifthenelse{\isempty{@difficulty@}}{Basic}{@difficulty@}
    \\%
	Common Characteristic: @common_characteristic@
    \\%
	\textit{@long_description@}
\end{minipage}
\par

