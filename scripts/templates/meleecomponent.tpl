\begin{minipage}{\columnwidth}
    \begin{flavorblock}[@name@]
	    @flavor@
    \end{flavorblock}
	\ifthenelse{\NOT \isempty{@price@}}{\textbf{Price}: cR @price@}{}
    \ifthenelse{\isempty{@availability@}}{}{ / \textbf{Availability:} @availability@}
	\\%
    \ifthenelse{\NOT \isempty{@weight@}}{\textbf{Weight}: @weight@ kg}{}
    \\%
    \ifthenelse{\isempty{@requirement@}}{}{\textbf{Requirement}: @requirement@\\}
	\textbf{Effect}: @effect@
\end{minipage}
\par
