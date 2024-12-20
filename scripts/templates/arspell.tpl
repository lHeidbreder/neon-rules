\begin{minipage}{\columnwidth}
\subsection*{@name@}
\textit{\hackingskill\ @penalty@}
\\%
\textbf{For @duration@:}
\\%
{
	\itshape
    @effect@
}
\ifthenelse{\isempty{@multipletargets@}}{
    \\%
    \textbf{Against multiple targets} @multipletargets@
}{}
\end{minipage}
\par

