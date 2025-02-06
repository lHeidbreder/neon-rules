\begin{minipage}{\columnwidth}
	\textbf{\ul{@name@:}}
    \\%
	\textit{@flavor@}
    \\%
	\textbf{Price}: cR @price@
    \ifthenelse{\isempty{@availability@}}{}{ / \textbf{Availability:} @availability@}
	\\%
    \textbf{Weight}: @weight@ kg
    \ifthenelse{\isempty{@requirement@}}{}{\\ \textbf{Requirement}: @requirement@\\}
	\textbf{Effect}: @effect@
\end{minipage}
\par
