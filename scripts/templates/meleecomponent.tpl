\begin{minipage}{\columnwidth}
    \begin{flavorblock}[@name@]
	    @flavor@
    \end{flavorblock}
	\textbf{Price}: cR @price@
    \ifthenelse{\isempty{@availability@}}{}{ / \textbf{Availability:} @availability@}
	\\%
    \textbf{Weight}: @weight@ kg
    \\%
    \ifthenelse{\isempty{@requirement@}}{}{\textbf{Requirement}: @requirement@\\}
	\textbf{Effect}: @effect@
\end{minipage}
\par
